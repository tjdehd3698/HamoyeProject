package com.bnk.hamoye.domain;

import lombok.Data;

@Data
public class Status {
	private String challengeId;
	private String challengeName;
	private int userCnt;
	private int successPercent;
}
