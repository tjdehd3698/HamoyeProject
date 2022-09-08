package com.bnk.hamoye.service;

import java.util.List;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;

public interface EcoChallengeService {
	int registerEcoChallenge(EcoChallenge ecoChallenge) throws Exception; // 챌린지 등록
	int updateEcoChallenge(EcoChallenge ecoChallenge) throws Exception; // 챌린지 수정
	int deleteEcoChallenge(String challengeId) throws Exception; // 챌린지 삭제
	List<String> getEcoChallengeType() throws Exception; // 챌린지 타입 전부 들고오기
	List<EcoChallenge> searchEcoChallenge(String word) throws Exception; // 챌린지 단어 일부 검색
	EcoChallenge getEcoChallengeStatus(String ecoChallengeId) throws Exception; // 챌린지 현황 조회
	List<EcoChallenge> getEcoChallengeList() throws Exception; // 전체 챌린지 리스트 표출
	EcoChallenge getEcoChallengeDetail(String ecoChallengeId) throws Exception; // 챌린지 상세 내역 표출
	List<EcoChallenge> getRecommendedEcoChallengeList(User user) throws Exception; // 추천 챌린지 표출
	Account setAccountInfo(String purpose, String incomeSource, String maturity,
			String ecoChallengeId) throws Exception; // 챌린지 계좌정보 주입
}
