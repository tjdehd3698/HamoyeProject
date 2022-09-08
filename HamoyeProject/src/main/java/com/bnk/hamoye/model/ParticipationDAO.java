package com.bnk.hamoye.model;

import java.util.List;

import com.bnk.hamoye.domain.Participation;

public interface ParticipationDAO {
	List<Participation> getAllUserByTripChallenge(String tripChallengId) throws Exception; //여행 챌린지 가입중인 모든 회원 조회
	List<Participation> getParticipateChallenge(String userId) throws Exception; //회원의 참가중인 챌린지 조회
	int getParticipationCntByDate(String date) throws Exception; //날짜별 여행챌린지 참가자 수 조회
	int doParticipateEcoChallenge(String userId) throws Exception; // 환경 챌린지 참가
	int doParticipateTripChallenge(Participation participation) throws Exception; // 여행 챌린지 참가
	int checkParticipationTripChallenge(Participation participation) throws Exception; // 여행 챌린지 참가 중인지 체크
	List<Participation> getParticipationCntByTripChallenge(String tripChallengeId) throws Exception; //여행챌린지 별 참여 목록 조회
}
