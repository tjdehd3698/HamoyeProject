package com.bnk.hamoye.service;

import java.sql.SQLException;

import com.bnk.hamoye.domain.User;

public interface UserService {
	int registerUser(User user) throws SQLException;
	String login(User user) throws SQLException;
	boolean duplicateId(User user) throws SQLException;
	String findPassword(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	User getUserInfo(String id) throws SQLException;
	int withdrawUser(String id) throws SQLException;
}
