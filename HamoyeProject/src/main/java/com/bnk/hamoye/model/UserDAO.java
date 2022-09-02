package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;

public interface UserDAO {
	int registerUser(User user) throws SQLException; //회원가입
	User login(User user) throws SQLException; //로그인
	int joinAccount(User user) throws SQLException; //계좌 가임
	User duplicateId(User user) throws SQLException; //아이디 중복 검사
	int updateUserPassword(User user) throws SQLException; //페스워드 변경
	int updateUser(User user) throws SQLException; //회원 정보 변경
	User getUserInfo(String userId) throws SQLException; //회원 정보 조회
	int withdrawUser(String userId) throws SQLException; //회원 탈퇴
	String checkEcoChallenge(String userId) throws SQLException; //에코챌린지 가입 여부 확인
	User getMypageInfo(String userId) throws SQLException; //마이페이지 정보 조회
	int expireAccount(String userId) throws SQLException; //계좌 해지
	List<User> getAllUser() throws SQLException; //모든 유저 가져요기
	User getUserAllInfo(String userId) throws SQLException; //유저의 모든 정보 조회
	List<User> getUserByEcoChallenge(String ecoChallengeId) throws SQLException; //해당 에코챌린지 가입 중인 유저 조회
	User getMypageInfoWithNoEco(String userId) throws SQLException; //에코챌린지 가입 안한 회원 마이페이지 정보 조회
	int getUserCntByDate(String date) throws SQLException; //날짜별 유저가져오기
	User getUserInfoByAdmin(String userId) throws SQLException;	//관리자가 회원 정보 조회
	User getUserInfoByAdminWithNoEco(String userId) throws SQLException; //관리자가 에코챌린지 가입 안한 회원 정보 조회
	int updateUserByAdmin(User user) throws SQLException; //관리자 회원 정보 수정
	List<User> getUserByEcoChallengeType(String ecoChallengeId) throws SQLException; //에코챌린지 타입 별 유저 수 조회
	int joinEcoChallenge(User user) throws SQLException; // 에코 챌린지 가입
}
 