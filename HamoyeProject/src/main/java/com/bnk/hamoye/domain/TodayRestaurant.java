package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TodayRestaurant {
	private String todayRestaurantCode; // 오늘의 식당 코드
	private String restaurantId ; // 식당 ID
	private String restaurantName; // 식당 이름
	private String category; // 식당 업종
	private Date registerDate; // 오늘의 식당 등록 날짜
}
