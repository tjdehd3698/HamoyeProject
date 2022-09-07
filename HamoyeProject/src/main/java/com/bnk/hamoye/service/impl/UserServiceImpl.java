package com.bnk.hamoye.service.impl;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.Point;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	private final EcoChallengeDAO ecoChallengeDAO;

	@Override
	public int registerUser(User user) throws Exception { // 회원 가입
		// 포인트 생성 후 등록
		Point point = new Point();
		int row = pointDAO.insertPoint(point);

		if (row == 1) {
			// 나이 계산
			LocalDate now = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
			String nowYear = now.format(formatter);
			int age = Integer.parseInt(nowYear) - Integer.parseInt(user.getBirthday().substring(0, 4)) + 1;

			user.setUserAge(age);

			user.setRegisterDate(new Date(System.currentTimeMillis()));
			user.setPointId(point.getPointId());

			return userDAO.registerUser(user);
		}
		return 0;
	}

	@Override
	public User login(User user) throws Exception {
		return userDAO.login(user);
	}

	@Override
	public boolean duplicateId(User user) throws Exception { // 아이디 중복 검사
		if (userDAO.duplicateId(user) == null)
			return false;
		else
			return true;
	}

	@Override
	public String findPassword(User user) throws Exception { // 비밀번호 찾기
		// 비밀번호 변경 후 업데이트
		user.changePassword();
		int row = userDAO.updateUserPassword(user);
		
		if (row == 1)
			return user.getUserPassword();
		else
			return null;
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userDAO.updateUser(user);
	}

	@Override
	public User getUserInfo(String userId) throws Exception {
		return userDAO.getUserInfo(userId);
	}

	@Override
	public int withdrawUser(String userId) throws Exception { // 회원 탈퇴
		pointDAO.deletePoint(userId);
		return userDAO.withdrawUser(userId);
	}

	@Override
	public int joinAccount(Account account, String userId, String ecoChallengeId) throws Exception {
		account.makeAccountNumber();
		account.setCreateDate(new Date(System.currentTimeMillis()));
		
		try {
		int result = accountDAO.checkAccount(account.getAccountNumber());
		while(result!=0) {
			account.makeAccountNumber();
			result = accountDAO.checkAccount(account.getAccountNumber());
		} // 중복 계좌번호 입력 시 계좌번호 재생성 알고리즘
		if(result==0) {
			accountDAO.registerAccount(account);
			System.out.println("hi");
			User user = new User();
			user.setUserId(userId);
			user.setEcoChallengeId(ecoChallengeId);
			user.setEcoChallenge(ecoChallengeDAO.getEcoChallengeDetail(ecoChallengeId));
			user.setAccountNumber(account.getAccountNumber());
			return userDAO.joinAccount(user);
		}
		}catch(Exception e) {
			
		}
		return 0;
	}

	@Override
	public String checkEcoChallenge(String userId) throws Exception {
		return userDAO.checkEcoChallenge(userId);
	}

	@Override
	public User getMypageInfo(String userId) throws Exception {
		User user = userDAO.getUserAllInfo(userId);
		if (user.getEcoChallengeId() == null) {
			return userDAO.getMypageInfoWithNoEco(userId);
		}
		return userDAO.getMypageInfo(userId);
	}

	@Override
	public int changePoint(String userId, int amount) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("amount", Integer.toString(-amount));

		pointDAO.updateTotalPoint(map);

		map.put("amount", amount + "");

		return accountDAO.updateBalance(map);
	}

	@Override
	public int expireAccount(String userId) throws Exception {
		accountDAO.deleteAccount(userId);
		return userDAO.expireAccount(userId);
	}

	@Override
	public List<Participation> getParticipateChallenge(String userId) throws Exception {
		return participationDAO.getParticipateChallenge(userId);
	}

	@Override
	public User getUserAllInfo(String userId) throws Exception {
		return userDAO.getUserAllInfo(userId);
	}

	@Override
	public List<User> getUserByEcoChallenge(String ecoChallengeId) throws Exception {
		return userDAO.getUserByEcoChallenge(ecoChallengeId);
	}

	@Override
	public Account getAccount(String userId) throws Exception {
		return accountDAO.getAccount(getUserAllInfo(userId).getAccountNumber());
	}

}
