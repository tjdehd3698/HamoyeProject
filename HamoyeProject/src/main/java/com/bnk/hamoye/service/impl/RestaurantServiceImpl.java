package com.bnk.hamoye.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.Restaurant;
import com.bnk.hamoye.domain.TodayRestaurant;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.RestaurantDAO;
import com.bnk.hamoye.model.TodayRestaurantDAO;
import com.bnk.hamoye.model.TripChallengeDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.RestaurantService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RestaurantServiceImpl implements RestaurantService {
	
	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	private final TripChallengeDAO tripChallengeDAO;
	private final RestaurantDAO restaurantDAO;
	private final TodayRestaurantDAO todayRestaurantDAO;

	@Override
	public List<Restaurant> getRestaurantsByCategory(String category) throws Exception {
		return restaurantDAO.getRestaurantsByCategory(category);
	}

	@Override
	public List<Restaurant> getRestaurantsByName(String restaurantName) throws Exception {
		return restaurantDAO.getRestaurantsByName(restaurantName);
	}

	@Override
	public Restaurant getRestaurantById(String restaurantId) throws Exception {
		return restaurantDAO.getRestaurantById(restaurantId);
	}

	@Override
	public int registerTodayRestaurants(TodayRestaurant todayRestaurant) throws Exception {
		return todayRestaurantDAO.registerTodayRestaurant(todayRestaurant);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByCategory(String category) throws Exception {
		return todayRestaurantDAO.getTodayRestaurantsByCategory(category);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByName(String restaurantName) throws Exception {
		return todayRestaurantDAO.getTodayRestaurantsByName(restaurantName);
	}

	@Override
	public TodayRestaurant getTodayRestaurantById(String restaurantId) throws Exception {
		return todayRestaurantDAO.getTodayRestaurantById(restaurantId);
	}

	@Override
	public List<TodayRestaurant> getTodayRestaurantsByDate(Date date) throws Exception {
		return todayRestaurantDAO.getTodayRestaurantsByDate(date);
	}

	@Override
	public int updateTodayRestaurant(TodayRestaurant todayRestaurant) throws Exception {
		return todayRestaurantDAO.updateTodayRestaurant(todayRestaurant);
	}

	@Override
	public int deleteTodayRestaurantById(String restaurantId) throws Exception {
		return todayRestaurantDAO.deleteTodayRestaurantById(restaurantId);
	}

	@Override
	public List<Restaurant> getAllRestaurants() throws Exception {
		return restaurantDAO.getAllRestaurants();
	}

	@Override
	public List<TodayRestaurant> getAllTodayRestaurants() throws Exception {
		return todayRestaurantDAO.getAllTodayRestaurant();
	}

	@Override
	public List<Coordinate> getCoordinateOfTodayRestaurants() throws Exception {
		return todayRestaurantDAO.getCoordinateOfTodayRestaurants();
	}

	@Override
	public List<String> getTodayRetaurantsName() throws Exception {
		return todayRestaurantDAO.getTodayRetaurantsName();
	}

	@Override
	public int deleteTodayRestaurantByList(List<String> restaurantIdList) throws Exception {
		for(String s : restaurantIdList) {
			todayRestaurantDAO.deleteTodayRestaurantById(s);
		}
		return 0;
	}

	@Override
	public int updateTodayRestaurant(List<String> restaurantIdList) throws Exception {
		for(String id : restaurantIdList) {
			Restaurant restaurant = restaurantDAO.getRestaurantById(id);
			TodayRestaurant todayRestaurant = new TodayRestaurant();
			todayRestaurant.setCategory(restaurant.getCategory());
			todayRestaurant.setRestaurantId(restaurant.getRestaurantId());
			todayRestaurant.setRestaurantName(restaurant.getRestaurantName());
			todayRestaurantDAO.registerTodayRestaurant(todayRestaurant);
		}
		
		return 0;
	}

	@Override
	public List<Restaurant> getRestaurantNotInTodayRestaurant() throws Exception {
		return restaurantDAO.getRestaurantNotInTodayRestaurant();
	}

}
