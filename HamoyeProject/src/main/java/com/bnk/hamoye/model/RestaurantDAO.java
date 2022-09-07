package com.bnk.hamoye.model;

import java.util.List;

import com.bnk.hamoye.domain.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> getRestaurantsByCategory(String category) throws Exception;//업종으로 레스토랑들 조회 Read
	List<Restaurant> getRestaurantsByName(String restaurantName) throws Exception;//이름으로 레스토랑들 조회 Read
	List<Restaurant> getAllRestaurants() throws Exception;// 모든 레스토랑들 조회 Read
	Restaurant getRestaurantById(String restaurantId) throws Exception;//Id로 레스토랑 조회 Read
	List<Restaurant> getRestaurantNotInTodayRestaurant() throws Exception;//오늘의 식당 아닌 레스토랑 조회
}
