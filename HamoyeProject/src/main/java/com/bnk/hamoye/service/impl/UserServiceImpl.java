package com.bnk.hamoye.service.impl;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{
	private UserDAO userDAO;
	
	@Override
	public int registerUser(User user) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String login(User user) throws SQLException {
		return userDAO.login(user);
	}

	@Override
	public boolean duplicateId(User user) throws SQLException {
		String findId = userDAO.duplicateId(user);
		
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
	public User getUserInfo(String id) throws SQLException {
		return userDAO.getUserInfo(id);
	}

	@Override
	public int withdrawUser(String id) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
