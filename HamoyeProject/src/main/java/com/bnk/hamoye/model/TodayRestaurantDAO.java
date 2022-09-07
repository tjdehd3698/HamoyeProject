package com.bnk.hamoye.model;

import java.sql.Date;
import java.util.List;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.TodayRestaurant;

public interface TodayRestaurantDAO {
	int registerTodayRestaurant(TodayRestaurant todayRestaurant) throws Exception; // 오늘의 식당 등록
	int updateTodayRestaurant(TodayRestaurant todayRestaurant) throws Exception; // 오늘의 식당 정보 수정
	int deleteTodayRestaurantById(String restaurantId) throws Exception; // 아이디로 오늘의 식당 삭제
	List<TodayRestaurant> getTodayRestaurantsByCategory(String category) throws Exception; // 업종으로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByName(String restaurantName) throws Exception; // 이름으로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByDate(Date date) throws Exception; // 날짜로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getAllTodayRestaurant() throws Exception; // 모든 오늘의 식당 조회
	TodayRestaurant getTodayRestaurantById(String restaurantId) throws Exception; // Id로 오늘의 레스토랑 조회 Read
	List<Coordinate> getCoordinateOfTodayRestaurants() throws Exception; // 오늘의 식당 좌표 전부 조회
	List<String> getTodayRetaurantsName() throws Exception; // 오늘의 식당 가게 이름 리스트 조회
	int deleteAllTodayRestaurant() throws Exception; //모든 오늘의 식당 삭제
}
