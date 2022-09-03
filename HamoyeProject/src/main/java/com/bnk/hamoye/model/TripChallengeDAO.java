package com.bnk.hamoye.model;

import java.util.List;

import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;

public interface TripChallengeDAO {
	int registerTripChallenge(TripChallenge tripChallenge) throws Exception; // 챌린지 등록
	int updateTripChallenge(TripChallenge tripChallenge) throws Exception; // 챌린지 수정
	int deleteTripChallenge(String challengeId) throws Exception; // 챌린지 삭제
	List<TripChallenge> searchTripChallenge(String word) throws Exception; // 챌린지 단어 일부 검색
	TripChallenge getTripChallengeStatus(String tripChallengeId) throws Exception; // 챌린지 현황 조회
	List<TripChallenge> getTripChallengeList() throws Exception; // 전체 챌린지 리스트 표출
	TripChallenge getTripChallengeDetail(String tripChallengeId) throws Exception; // 챌린지 상세 내역 표출
	List<TripChallenge> getRecommendedTripChallengeList(User user) throws Exception; // 추천 챌린지 표출
	List<TripChallenge> getTripChallengeListByAdmin() throws Exception; //관리자 챌린지 전체 조회
	int updateTripChallengeImage(TripChallenge tripChallenge) throws Exception; //챌린지 이미지 변경
}
