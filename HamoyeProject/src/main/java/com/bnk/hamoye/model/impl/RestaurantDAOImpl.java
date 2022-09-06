package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Restaurant;
import com.bnk.hamoye.model.RestaurantDAO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {

	private final String NS = "sql.hamoye.restaurant_mapper.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Restaurant> getRestaurantsByCategory(String category) {
		return sqlSession.selectList(NS+"getRestaurantsByCategory", category);
	}
	
	@Override
	public List<Restaurant> getRestaurantsByName(String restaurantName) {
		return sqlSession.selectList(NS+"getRestaurantsByName", restaurantName);
	}
	
	@Override
	public Restaurant getRestaurantById(String restaurantId) {
		return sqlSession.selectOne(NS+"getRestaurantById", restaurantId);
	}

	@Override
	public List<Restaurant> getAllRestaurants() {
		return sqlSession.selectList(NS+"getAllRestaurants");
	}

	@Override
	public List<Restaurant> getRestaurantNotInTodayRestaurant() {
		return sqlSession.selectList(NS+"getRestaurantNotInTodayRestaurant");
	}
	

}
