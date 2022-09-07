package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TripChallenge{
	private String tripChallengeId; // tripChallenge Id
	private String tripChallengeName; // tripChallenge 이름
	private String tripChallengeType; // tripChallenge 타입
	private Date startDate; // 시작일
	private Date endDate; // 종료일
	private int rewardPoint; // tripChallenge 보상 동백 포인트
	private int isDelete; // 삭제 여부
	private String content; // 내용
	private String challengeImage; // 챌린지 이미지 주소
}
