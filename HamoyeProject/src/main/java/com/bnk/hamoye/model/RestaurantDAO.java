package com.bnk.hamoye.model;

import java.util.List;

import com.bnk.hamoye.domain.Restaurant;

public interface RestaurantDAO {
	//Create 필요x
	List<Restaurant> getRestaurantsByCategory(String category);//업종으로 레스토랑들 조회 Read
	List<Restaurant> getRestaurantsByName(String restaurantName);//이름으로 레스토랑들 조회 Read
	List<Restaurant> getAllRestaurants();// 모든 레스토랑들 조회 Read
	Restaurant getRestaurantById(String restaurantId);//Id로 레스토랑 조회 Read
	List<Restaurant> getRestaurantNotInTodayRestaurant();//오늘의 식당 아닌 레스토랑 조회
	//Update 필요x
	//Delete 필요x
}
