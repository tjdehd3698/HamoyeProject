package com.bnk.hamoye.service;

import java.util.List;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;

public interface UserService {
	int registerUser(User user) throws Exception; // 회원가입
	User login(User user) throws Exception; // 로그인
	boolean duplicateId(User user) throws Exception; // user 복사
	String findPassword(User user) throws Exception; // 비밀번호 찾기
	int updateUser(User user) throws Exception; // 회원정보 수정
	User getUserInfo(String userId) throws Exception; // user 정보 조회
	int withdrawUser(String userId) throws Exception; // 회원 탈퇴
	int joinAccount(Account account, String userId, String ecoChallengeId) throws Exception; // 계좌 가입
	Account getAccount(String userId) throws Exception; // 특정 유저의 계좌 정보 조회
	int expireAccount(String userId) throws Exception; // 계좌 만료
	String checkEcoChallenge(String userId) throws Exception; //회원 ecoChallenge 가입 여부 조회
	User getMypageInfo(String userId) throws Exception; // 마이페이지 정보 조회
	int changePoint(String userId, int amount) throws Exception; // 포인트 변경
	List<Participation> getParticipateChallenge(String userId) throws Exception;  //회원 참여 중인 tripChallenge리스트 조회
	User getUserAllInfo(String userId) throws Exception; // user 모든 정보 조회
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws Exception; //특정 EcoChallenge 참며중인 회원 리스트 조회
}
