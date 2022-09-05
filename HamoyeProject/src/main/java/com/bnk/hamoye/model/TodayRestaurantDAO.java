package com.bnk.hamoye.model;

import java.sql.Date;
import java.util.List;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.TodayRestaurant;

public interface TodayRestaurantDAO {
	int registerTodayRestaurant(TodayRestaurant todayRestaurant); // 오늘의 식당 등록
	int updateTodayRestaurant(TodayRestaurant todayRestaurant); // 오늘의 식당 정보 수정
	int deleteTodayRestaurantById(String restaurantId); // 아이디로 오늘의 식당 삭제
	List<TodayRestaurant> getTodayRestaurantsByCategory(String category); // 업종으로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByName(String restaurantName); // 이름으로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByDate(Date date); // 날짜로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getAllTodayRestaurant(); // 모든 오늘의 식당 조회
	TodayRestaurant getTodayRestaurantById(String restaurantId); // Id로 오늘의 레스토랑 조회 Read
	List<Coordinate> getCoordinateOfTodayRestaurants(); // 오늘의 식당 좌표 전부 조회
	List<String> getTodayRetaurantsName(); // 오늘의 식당 가게 이름 리스트 조회
}
