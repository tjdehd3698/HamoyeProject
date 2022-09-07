package com.bnk.hamoye.domain;

import lombok.Data;

//tripChallenge 통계를 위한 클래스
@Data
public class TripStatus {
	private String challengeId; // Challenge Id
	private String challengeName; // Challenge 이름
	private int userCnt; // 참가자 숫자
	private double successPercent; // 달성율
	private int totalPoint; // 동백포인트 보상 총합
}
