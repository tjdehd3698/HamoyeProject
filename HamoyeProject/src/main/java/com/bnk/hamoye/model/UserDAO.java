package com.bnk.hamoye.model;

import java.util.List;
import java.util.Map;

import com.bnk.hamoye.domain.User;

public interface UserDAO {
	int registerUser(User user) throws Exception; //회원가입
	User login(User user) throws Exception; //로그인
	int joinAccount(User user) throws Exception; //계좌 가임
	User duplicateId(User user) throws Exception; //아이디 중복 검사
	int updateUserPassword(User user) throws Exception; //페스워드 변경
	int updateUser(User user) throws Exception; //회원 정보 변경
	User getUserInfo(String userId) throws Exception; //회원 정보 조회
	int withdrawUser(String userId) throws Exception; //회원 탈퇴
	String checkEcoChallenge(String userId) throws Exception; //에코챌린지 가입 여부 확인
	User getMypageInfo(String userId) throws Exception; //마이페이지 정보 조회
	int expireAccount(String userId) throws Exception; //계좌 해지
	List<User> getAllUser() throws Exception; //모든 유저 가져요기
	User getUserAllInfo(String userId) throws Exception; //유저의 모든 정보 조회
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws Exception; //해당 에코챌린지 가입 중인 유저 조회
	User getMypageInfoWithNoEco(String userId) throws Exception; //에코챌린지 가입 안한 회원 마이페이지 정보 조회
	int getUserCntByDate(String date) throws Exception; //날짜별 유저가져오기
	User getUserInfoByAdmin(String userId) throws Exception;	//관리자가 회원 정보 조회
	User getUserInfoByAdminWithNoEco(String userId) throws Exception; //관리자가 에코챌린지 가입 안한 회원 정보 조회
	int updateUserByAdmin(User user) throws Exception; //관리자 회원 정보 수정
	List<User> getUserByEcoChallengeType(String ecoChallengeId) throws Exception; //에코챌린지 타입 별 유저 수 조회
	int updateUserParticipationCount(Map<String, String> map) throws Exception; //관리자 회원 참가 횟수 변경
}
 