package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class EcoChallenge{
	private String ecoChallengeId; // ecoChallenge 아이디
	private String ecoChallengeName; // ecoChallenge 이름
	private String ecoChallengeType; // ecoChallenge 타입
	private double primeRate; // ecoChallenge 우대이율
	private Date startDate; // ecoCHallenge 시작일
	private Date endDate; // ecoChallenge 종료일
	private int limitedPeople; // ecoChallenge 제한 인원
	private int isDelete; // ecoChallenge 삭제 여부
	private String content; // ecoChallenge 내용
	private int totalCount; // ecoChalleng 완료 미션 횟수
	private String challengeImage; // ecoChallenge 이미지 경로
}
