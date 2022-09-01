package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TripChallenge{
	private String tripChallengeId;
	private String tripChallengeName;
	private String tripChallengeType;
	private Date startDate;
	private Date endDate;
	private int hits;
	private int rewardPoint;
	private int isDelete;
	private String content;
	
}
