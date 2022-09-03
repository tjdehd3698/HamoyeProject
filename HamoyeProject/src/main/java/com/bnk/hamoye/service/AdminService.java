package com.bnk.hamoye.service;

import java.sql.SQLException;
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
	List<TripStatus> getAllTripChallenge() throws Exception;
	int getUserCntByDate() throws Exception;
	int getAccountCntByDate() throws Exception;
	int getBalanceSum() throws Exception;
	int getPointSum() throws Exception;
	Map<String,Integer> getTripChallengeCntByMonth() throws Exception;
	User getUserInfoByAdmin(String userId) throws Exception;
	int updateUserByAdmin(User user) throws Exception;
	Map<String, Integer> getUserCntByEcoChallenge() throws Exception; //에코 챌린지 별 참여자 수 조회
	Map<String, Integer> getUSerCntByTripChallenge() throws Exception; //Trip 챌린지 별 참여자 수 조회
	int getUserCntByEcoChallengeById(String ecoChallengeId) throws Exception; //특정 에코 챌린지 참여자 수 조회
	int getUSerCntByTripChallengeById(String tripChallengeId) throws Exception; //특정 Trip 챌린지 참여자 수 조회
	Map<String, Double> getUserCntByEcoChallengeType(int totalUserCnt) throws Exception; //에코 챌린지 타입 별 유저 수 조회
	int updateTripChallengeImage(TripChallenge tripChallenge) throws Exception; //트립챌린지 사진 업데이트
	int updateEcoChallengeImage(EcoChallenge ecoChallenge) throws Exception; //에코챌린지 사진 업데이트
}
