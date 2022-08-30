package com.bnk.hamoye.service.impl;

import java.sql.Date;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Point;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
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
	
	@Override
	public int registerUser(User user) throws SQLException {
		Point point = new Point();
		int row = pointDAO.insertPoint(point);
		
		if(row==1) {
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
		String findId = userDAO.duplicateId(user).getUserId();
		
		if(findId==null) return false;
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

}
