package com.bnk.hamoye.service.impl;

import java.sql.SQLException;
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
			
			
				
		}
		return result;
	}
}
