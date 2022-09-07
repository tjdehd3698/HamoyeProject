package com.bnk.hamoye.domain;

import lombok.Data;

@Data
public class Restaurant {
	private String restaurantId ; // 음식점 고유 코드
	private String restaurantName; // 음식점 이름
	private String category; // 음식점 업종
	private String location; // 음식점 위치
	private String longitude; // 음식점 경도
	private String latitude; // 음식점 위도
	
}
