package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Participation {
	private String participationId; // 참가 고유 코드
	private Date participationDate; // 참가 날짜
	private int achievementRate; // 달성율
	private int isSuccess; // 성공 여부
	private String tripChallengeId; // tripChallengeId
	private TripChallenge tripChallenge; // tripChallenge
	private String userId; // 참가자 id
	private User user; // User
}
