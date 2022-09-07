package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	private String paymentId; // 결제 코드
	private String userId; // 결제한 유저 Id
	private String category; // 결제 내역 업종
	private String restaurantName; // 음식점 이름
	private String restaurantId; // 음식점 고유 코드
	private int price; // 금액
	private Date paymentDate; // 결제 날짜
	private User user; // user
	private Restaurant restaurant; // restaurant

}
