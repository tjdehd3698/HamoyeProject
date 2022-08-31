package com.bnk.hamoye.service.impl;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
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
	public List<Status> getAllTripChallenge() throws Exception {
		
		return null;
	}

	@Override
	public int getUserCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return userDAO.getUserByDate(nowYear);
	}

	@Override
	public int getAccountCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return accountDAO.getAccountCntByDate(nowYear);
	}
}
