package com.bnk.hamoye.domain;

import java.sql.Date;
import java.util.Random;

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
	private int isAdmin;
	private Date registerDate;
	private String accountNumber;
	private Account account;
	private String pointId;
	private Point point;
	private String ecoChallengeId;
	private EcoChallenge ecoChallenge;
	
	public void changePassword() {
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		for(int i=0;i<20;i++){
			if(rnd.nextBoolean()){
				buf.append((char)((int)(rnd.nextInt(26))+97));
			}
			else{
				buf.append((rnd.nextInt(10)));
			}
		}
		this.userPassword = buf.toString();
	}

}
