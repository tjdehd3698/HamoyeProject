package com.bnk.hamoye.domain;

import lombok.Data;

@Data
public class Status {
	private String challengeId; // ChallengeId
	private String challengeName; // Challenge 이름
	private int userCnt; // 참가자 횟수
	private double successPercent; // Challenge 달성율
}
