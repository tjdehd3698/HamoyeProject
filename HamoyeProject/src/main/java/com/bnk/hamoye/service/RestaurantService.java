package com.bnk.hamoye.service;

import java.sql.Date;
import java.util.List;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.Restaurant;
import com.bnk.hamoye.domain.TodayRestaurant;

public interface RestaurantService {
	List<Restaurant> getRestaurantsByCategory(String category) throws Exception;//업종으로 레스토랑들 조회 Read
	List<Restaurant> getRestaurantsByName(String restaurantName) throws Exception;//이름으로 레스토랑들 조회 Read
	List<Restaurant> getAllRestaurants() throws Exception; // 모든 레스토랑 조회
	Restaurant getRestaurantById(String restaurantId) throws Exception;//Id로 레스토랑 조회 Read
	int registerTodayRestaurants(TodayRestaurant todayRestaurant) throws Exception; // 오늘의 식당 등록
	List<TodayRestaurant> getTodayRestaurantsByCategory(String category) throws Exception; // 업종으로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByName(String restaurantName) throws Exception; // 이름으로 오늘의 레스토랑들 조회 Read
	TodayRestaurant getTodayRestaurantById(String restaurantId) throws Exception; // Id로 오늘의 레스토랑 조회 Read
	List<TodayRestaurant> getTodayRestaurantsByDate(Date date) throws Exception; // 날짜로 오늘의 레스토랑들 조회 Read
	List<TodayRestaurant> getAllTodayRestaurants() throws Exception; // 모든 오늘의 레스토랑 조회
	int updateTodayRestaurant(TodayRestaurant todayRestaurant) throws Exception; // 오늘의 식당 정보 수정
	int deleteTodayRestaurantById(String restaurantId) throws Exception; // 아이디로 오늘의 식당 삭제
	List<Coordinate> getCoordinateOfTodayRestaurants() throws Exception; // 오늘의 식당들 좌표리스트 리턴
	List<String> getTodayRetaurantsName() throws Exception; // 오늘의 식당들 이름 리스트 리턴
	int deleteTodayRestaurantByList(List<String> restaurantIdList) throws Exception; //모든 오늘의 식당 삭제
	int updateTodayRestaurant(List<String> restaurantIdList) throws Exception; //오늘의 식당 업데이트
	List<Restaurant> getRestaurantNotInTodayRestaurant() throws Exception; //오늘의 식당을 제외한 나머지 식당 리스트 조회
}
