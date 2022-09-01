package com.bnk.hamoye.service.impl;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.TripStatus;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.TripChallengeDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.AdminService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final UserDAO userDAO;
	private final AccountDAO accountDAO;
	private final EcoChallengeDAO ecoChallengeDAO;
	private final ParticipationDAO participationDAO;
	private final PointDAO pointDAO;
	private final TripChallengeDAO tripChallengeDAO;
	
	@Override
	public List<User> getAllUser() throws SQLException {
		return userDAO.getAllUser();
	}

	@Override
	public User adminLogin(User user) throws SQLException {
		user.setIsAdmin(1);
		return userDAO.login(user);
	}

	@Override
	public int getAllAcountCnt() throws SQLException {
		return accountDAO.getAllAcountCnt();
	}

	@Override
	public List<Status> getAllEcoChallenge() throws Exception {
		List<Status> result = new ArrayList<>();
		List<EcoChallenge> list1 = ecoChallengeDAO.getEcoChallengeList();
		for(EcoChallenge e : list1) {
			if(e.getIsDelete()==1) continue;
			Status status = new Status();
			status.setChallengeId(e.getEcoChallengeId());
			status.setChallengeName(e.getEcoChallengeName());
			
			List<User> list2 = userDAO.getUserByEcoChallenge(e.getEcoChallengeId());
			status.setUserCnt(list2.size());
			
			int count = 0;
			for(User u : list2) {
				if(e.getTotalCount()<=u.getParticipationCount()) count++;
			}
			
			status.setSuccessPercent((count/list2.size())*100);
			result.add(status);
		}
		return result;
	}

	@Override
	public List<TripStatus> getAllTripChallenge() throws Exception {
		List<TripStatus> result = new ArrayList<TripStatus>();
		
		List<TripChallenge> tripList = tripChallengeDAO.getTripChallengeList();
		for(TripChallenge t: tripList) {
			
			List<Participation> list = participationDAO.getAllUserByTripChallenge(t.getTripChallengeId());
			int participateCnt = 0;
			for(Participation p : list) {
				if(p.getIsSuccess()==1)
					participateCnt++;
			}
			
			TripStatus status = new TripStatus();
			status.setChallengeId(t.getTripChallengeId());
			status.setChallengeName(t.getTripChallengeName());
			status.setHits(t.getHits());
			status.setUserCnt(list.size());
			status.setSuccessPercent(participateCnt/list.size()*100);
			result.add(status);
		}
		return result;
	}

	@Override
	public int getUserCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return userDAO.getUserCntByDate(nowYear);
	}

	@Override
	public int getAccountCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return accountDAO.getAccountCntByDate(nowYear);
	}

	@Override
	public int getBalanceSum() throws Exception {
		return accountDAO.getBalanceSum();
	}

	@Override
	public int getPointSum() throws Exception {
		return pointDAO.getPointSum();
	}

	@Override
	public Map<String, Integer> getTripChallengeCntByMonth() throws Exception {
		Map<String,Integer> result = new HashMap<String, Integer>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYYMM");
		
		for(int i=0;i<12;i++) {
			String date = LocalDate.now().minusMonths(1).format(formatter);
			System.out.println("date : "+date);
			result.put(date,participationDAO.getParticipationCntByDate(date));
		}
		
		return result;
	}

	@Override
	public User getUserInfoByAdmin(String userId) throws Exception {
		return userDAO.getUserInfoByAdmin(userId);
	}
}
