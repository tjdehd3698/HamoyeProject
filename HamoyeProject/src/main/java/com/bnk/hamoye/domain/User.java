package com.bnk.hamoye.domain;

import java.sql.Date;
import java.util.Random;

import lombok.Data;

@Data
public class User {
	private String userId; // user Id
	private String userPassword; // user 비밀번호
	private String userName; // user 이름
	private String gender; // 성별
	private int userAge; // 나이
	private String email; // 이메일
	private String birthday; // 생일
	private String userAddress; // 주소
	private int isAdmin; // 관리자 여부
	private Date registerDate; // 가입일
	private String accountNumber; // 계좌번호
	private Account account; // 계좌
	private String pointId; // 동백포인트 계정
	private Point point; // 동백포인트
	private String ecoChallengeId; // 참가중인 ecoChallenge Id
	private EcoChallenge ecoChallenge; // EcoChallenge
	private int participationCount; // 참가중인 ecoChallenge 수행 횟수
	
	public void changePassword() { // 패스워드 난수 생성
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
