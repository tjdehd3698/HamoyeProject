package com.bnk.hamoye.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.AdminService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final UserDAO userDAO;
	
	@Override
	public List<User> getAllUser() throws SQLException {
		return userDAO.getAllUser();
	}
}
