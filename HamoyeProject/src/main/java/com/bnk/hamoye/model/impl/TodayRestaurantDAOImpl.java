package com.bnk.hamoye.model.impl;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.TodayRestaurant;
import com.bnk.hamoye.model.TodayRestaurantDAO;

@Repository
public class TodayRestaurantDAOImpl implements TodayRestaurantDAO {
	
	private final String NS = "sql.hamoye.todayRestaurant_mapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int registerTodayRestaurant(TodayRestaurant todayRestaurant) {
		return sqlSession.insert(NS+"registerTodayRestaurant", todayRestaurant);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByCategory(String category) {
		return sqlSession.selectList(NS+"getTodayRestaurantsByCategory", category);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByName(String restaurantName) {
		return sqlSession.selectList(NS+"getTodayRestaurantsByName", restaurantName);
	}

	@Override
	public TodayRestaurant getTodayRestaurantById(String restaurantId) {
		return sqlSession.selectOne(NS+"getTodayRestaurantById", restaurantId);
	}

	@Override
	public int updateTodayRestaurant(TodayRestaurant todayRestaurant) {
		return sqlSession.update(NS+"updateTodayRestaurant", todayRestaurant);
	}

	@Override
	public int deleteTodayRestaurantById(String restaurantId) {
		return sqlSession.delete(NS+"deleteTodayRestaurant", restaurantId);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByDate(Date date) {
		return sqlSession.selectList(NS+"getTodayRestaurantsByDate", date);
	}

	@Override
	public List<TodayRestaurant> getAllTodayRestaurant() {
		return sqlSession.selectList(NS+"getAllTodayRestaurants");
	}

	@Override
	public List<Coordinate> getCoordinateOfTodayRestaurants() {
		return sqlSession.selectList(NS+"getCoordinateOfTodayRestaurants");
	}

	@Override
	public List<String> getTodayRetaurantsName() {
		return sqlSession.selectList(NS+"getTodayRestaurantsName");
	}

}
