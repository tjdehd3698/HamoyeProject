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
	String checkEcoChallenge(String userId) throws SQLException; //회원 ecoChallenge 가입 여부 조회
	User getMypageInfo(String userId) throws SQLException;
	int changePoint(String userId, int amount) throws SQLException;
	List<Participation> getParticipateChallenge(String userId) throws SQLException;  //회원 참여 중인 tripChallenge리스트 조회
	User getUserAllInfo(String userId) throws SQLException;
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws SQLException; //특정 EcoChallenge 참며중인 회원 리스트 조회
	int joinEcoChallenge(User user) throws SQLException; // joinEcoChallenge
}
