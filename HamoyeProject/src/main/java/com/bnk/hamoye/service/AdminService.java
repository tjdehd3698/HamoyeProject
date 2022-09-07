package com.bnk.hamoye.service;

import java.util.List;
import java.util.Map;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.TripStatus;
import com.bnk.hamoye.domain.User;

public interface AdminService {
	User adminLogin(User user) throws Exception; //관리자 로그인
	List<User> getAllUser() throws Exception; //전체 회원 조회
	int getAllAcountCnt() throws Exception; //전체 계좌 수 조회
	List<Status> getAllEcoChallenge() throws Exception; // 전체 에코 챌린지 통계 조회
	List<TripStatus> getAllTripChallenge() throws Exception; // 모든 트립 챌린지 통계 조회
	int getUserCntByDate() throws Exception; // 날짜별 참가자 수 조회
	int getAccountCntByDate() throws Exception; // 날짜별 계좌 조회
	int getBalanceSum() throws Exception; // 계좌 잔고 조회
	int getPointSum() throws Exception; // 동백포인트 조회
	Map<String,Integer> getTripChallengeCntByMonth() throws Exception; // 월별 트립 챌린지 가입자 수
	User getUserInfoByAdmin(String userId) throws Exception; // 관리자가 유저 정보 조회
	int updateUserByAdmin(User user) throws Exception; // 관리자가 유저 정보 수정
	Map<String, Integer> getUserCntByEcoChallenge() throws Exception; //에코 챌린지 별 참여자 수 조회
	Map<String, Integer> getUserCntByTripChallenge() throws Exception; //Trip 챌린지 별 참여자 수 조회
	int getUserCntByEcoChallengeById(String ecoChallengeId) throws Exception; //특정 에코 챌린지 참여자 수 조회
	int getUSerCntByTripChallengeById(String tripChallengeId) throws Exception; //특정 Trip 챌린지 참여자 수 조회
	Map<String, Double> getUserCntByEcoChallengeType(int totalUserCnt) throws Exception; //에코 챌린지 타입 별 유저 수 조회
	int updateTripChallengeImage(TripChallenge tripChallenge) throws Exception; //트립챌린지 사진 업데이트
	int updateEcoChallengeImage(EcoChallenge ecoChallenge) throws Exception; //에코챌린지 사진 업데이트
	int updateUserParticipationCountWithVolunteer(List<User> userList) throws Exception; //봉사 챌린지 특정 유저목록의 유저 참여 횟수 증가
	int updateUserParticipationCountWithPublicTransportaion(String ecoChallengeId) throws Exception; //대중교통 챌린지 유저 참여 횟수 증가
}
