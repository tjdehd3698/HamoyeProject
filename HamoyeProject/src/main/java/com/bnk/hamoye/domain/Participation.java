package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Participation {
	private String parcitipationId;
	private Date parcitipationDate;
	private int achievementRate;
	private int isSuccess;
	private String tripChallengId;
	private TripChallenge tripChallenge;
	private String userId;
	private User user;
}
