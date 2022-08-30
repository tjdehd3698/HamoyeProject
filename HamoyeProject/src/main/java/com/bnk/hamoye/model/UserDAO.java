package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;

public interface UserDAO {
	int registerUser(User user) throws SQLException;
	User login(User user) throws SQLException;
	int joinAccount(User user) throws SQLException;
	User duplicateId(User user) throws SQLException;
	int updateUserPassword(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	User getUserInfo(String userId) throws SQLException;
	int withdrawUser(String userId) throws SQLException;
	String checkEcoChallenge(String userId) throws SQLException;
	User getMypageInfo(String userId) throws SQLException;
	int expireAccount(String userId) throws SQLException;
	List<Participation> getParticipateChallenge(String userId) throws SQLException;
	List<User> getAllUser() throws SQLException;
	User getUserAllInfo(String userId) throws SQLException;
}
 