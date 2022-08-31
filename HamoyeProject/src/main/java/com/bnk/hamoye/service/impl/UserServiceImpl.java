package com.bnk.hamoye.service.impl;

import java.sql.Date;
import java.sql.SQLException;
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
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	
	@Override
	public int registerUser(User user) throws SQLException {
		Point point = new Point();
		int row = pointDAO.insertPoint(point);
		
		if(row==1) {
			LocalDate now = LocalDate.now();     
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
			String nowYear = now.format(formatter);
			int age = Integer.parseInt(nowYear)-Integer.parseInt(user.getBirthday().substring(0,4))+1; 
			
			user.setUserAge(age);
			
			user.setRegisterDate(new Date(System.currentTimeMillis()));
			user.setPointId(point.getPointId());
			
			
			return userDAO.registerUser(user);
		}
		return 0;
	}

	@Override
	public User login(User user) throws SQLException {
		return userDAO.login(user);
	}
	
	@Override
	public boolean duplicateId(User user) throws SQLException {
		if(userDAO.duplicateId(user)==null) return false;
		else return true;
	}

	@Override
	public String findPassword(User user) throws SQLException {
		user.changePassword();
		int row = userDAO.updateUserPassword(user);
		
		if(row==1) return user.getUserPassword();
		else return null;
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return userDAO.updateUser(user);
	}

	@Override
	public User getUserInfo(String userId) throws SQLException {
		return userDAO.getUserInfo(userId);
	}

	@Override
	public int withdrawUser(String userId) throws SQLException {
		pointDAO.deletePoint(userId);
		return userDAO.withdrawUser(userId);
	}

	@Override
	public int joinAccount(Account account, String userId, String ecoChallengeId) throws SQLException {
		account.makeAccountNumber();
		account.setCreateDate(new Date(System.currentTimeMillis()));
		
		int result = accountDAO.registerAccount(account);
		if(result == 1) {
			User user = new User();
			user.setUserId(userId);
			user.setEcoChallengeId(ecoChallengeId);
			user.setAccountNumber(account.getAccountNumber());
			return userDAO.joinAccount(user);
		}
		return 0;
	}

	@Override
	public String checkEcoChallenge(String userId) throws SQLException {
		return userDAO.checkEcoChallenge(userId);
	}

	@Override
	public User getMypageInfo(String userId) throws SQLException {
		User user = userDAO.getUserAllInfo(userId);
		if(user.getEcoChallengeId()==null) {
			return userDAO.getMypageInfoWithNoEco(userId);
		}
		return userDAO.getMypageInfo(userId);
	}

	@Override
	public int changePoint(String userId, int amount) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", userId);
		map.put("amount", Integer.toString(-amount));
		
		pointDAO.updateTotalPoint(map);
		
		map.put("amount", amount+"");
		
		return accountDAO.updateBalance(map);
	}

	@Override
	public int expireAccount(String userId) throws SQLException {
		accountDAO.deleteAccount(userId);
		return userDAO.expireAccount(userId);
	}

	@Override
	public List<Participation> getParticipateChallenge(String userId) throws SQLException {
		return participationDAO.getParticipateChallenge(userId);
	}

	@Override
	public User getUserAllInfo(String userId) throws SQLException {
		return userDAO.getUserAllInfo(userId);
	}

	@Override
	public List<User> getUserByEcoChallenge(String ecoChallengeId) throws SQLException {
		return userDAO.getUserByEcoChallenge(ecoChallengeId);
	}

}
