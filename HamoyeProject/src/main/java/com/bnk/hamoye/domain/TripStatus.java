package com.bnk.hamoye.domain;

import lombok.Data;

//tripChallenge 통계를 위한 클래스
@Data
public class TripStatus {
	private String challengeId;
	private String challengeName;
	private int userCnt;
	private int successPercent;
	private int hits;
	private int totalPoint;
}
