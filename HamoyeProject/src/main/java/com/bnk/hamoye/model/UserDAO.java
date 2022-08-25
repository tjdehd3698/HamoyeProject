package com.bnk.hamoye.model;

import java.sql.SQLException;

import com.bnk.hamoye.domain.User;

public interface UserDAO {
	int registerUser(User user) throws SQLException;
	String login(User user) throws SQLException;
	String duplicateId(User user) throws SQLException;
	int updateUserPassword(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	User getUserInfo(String id) throws SQLException;
}
 