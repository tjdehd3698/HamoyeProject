package com.bnk.hamoye.service;

import java.util.List;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;

public interface UserService {
	int registerUser(User user) throws Exception;
	User login(User user) throws Exception;
	boolean duplicateId(User user) throws Exception;
	String findPassword(User user) throws Exception;
	int updateUser(User user) throws Exception;
	User getUserInfo(String userId) throws Exception;
	int withdrawUser(String userId) throws Exception;
	int joinAccount(Account account, String userId, String ecoChallengeId) throws Exception;
	Account getAccount(String userId) throws Exception; // 특정 유저의 계좌 정보 조회
	int expireAccount(String userId) throws Exception;
	String checkEcoChallenge(String userId) throws Exception; //회원 ecoChallenge 가입 여부 조회
	User getMypageInfo(String userId) throws Exception;
	int changePoint(String userId, int amount) throws Exception;
	List<Participation> getParticipateChallenge(String userId) throws Exception;  //회원 참여 중인 tripChallenge리스트 조회
	User getUserAllInfo(String userId) throws Exception;
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws Exception; //특정 EcoChallenge 참며중인 회원 리스트 조회
}
