package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class EcoChallenge{
	private String ecoChallengeId;
	private String ecoChallengeName;
	private double primeRate;
	private Date startDate;
	private Date endDate;
	private int limitedPeople;
	private int isDelete;
	private String content;
	
}
