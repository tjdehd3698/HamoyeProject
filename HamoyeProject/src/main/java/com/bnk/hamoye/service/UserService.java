package com.bnk.hamoye.service;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;

public interface UserService {
	int registerUser(User user) throws SQLException;
	User login(User user) throws SQLException;
	boolean duplicateId(User user) throws SQLException;
	String findPassword(User user) throws SQLException;
	int updateUser(User user) throws SQLException;
	User getUserInfo(String userId) throws SQLException;
	int withdrawUser(String userId) throws SQLException;
	int joinAccount(Account account, String userId, String ecoChallengeId) throws SQLException;
	int expireAccount(String userId) throws SQLException;
	String checkEcoChallenge(String userId) throws SQLException;
	User getMypageInfo(String userId) throws SQLException;
	int changePoint(String userId, int amount) throws SQLException;
	List<Participation> getParticipateChallenge(String userId) throws SQLException; 
	User getUserAllInfo(String userId) throws SQLException;
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws SQLException;
}
