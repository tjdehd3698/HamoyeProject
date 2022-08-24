package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class EcoChallenge {
	private String ecoChalengeId;
	private String ecoChallengeName;
	private double primeRate;
	private Date startDate;
	private Date endDate;
	private int limitedPeople;
	private boolean isDelete;
}
