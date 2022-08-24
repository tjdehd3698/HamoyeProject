package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userPassword;
	private String userName;
	private String gender;
	private int userAge;
	private String email;
	private String birthday;
	private String userAddress;
	private boolean isAdmin;
	private Date registerDate;
	private String accountNumber;
	private Account account;
	private String pointId;
	private Point point;
	private String ecoChallengeId;
	private EcoChallenge ecoChallenge;
}
