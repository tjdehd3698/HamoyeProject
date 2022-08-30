package com.bnk.hamoye.domain;

import lombok.Data;

@Data
public class Status {
	private String ecoChallengeId;
	private String ecoChallengeName;
	private int userCnt;
	private int successPercent;
}
