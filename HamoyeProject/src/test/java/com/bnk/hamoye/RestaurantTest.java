package com.bnk.hamoye;

import java.io.Reader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.TodayRestaurant;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;

public class RestaurantTest {
	
	@Test
	public void getCoordinateOfTodayRestaurants() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<Coordinate> coordinateList= session.selectList("sql.hamoye.todayRestaurant_mapper.getCoordinateOfTodayRestaurants");
		
		for(Coordinate co : coordinateList) {
			System.out.println(co.getLongitude()+" "+co.getLatitude());
		}
		
		session.commit();
	}
	
	@Test
	public void getAllTodayRestaurants() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<TodayRestaurant> todayRestaurantsList= session.selectList("sql.hamoye.todayRestaurant_mapper.getAllTodayRestaurants");
		
		for(TodayRestaurant tr : todayRestaurantsList) {
			System.out.println(tr);
		}
		
		session.commit();
	}
	
	@Test
	public void getTodayRetaurantsName() throws Exception{
Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<String> todayRetaurantsNameList= session.selectList("sql.hamoye.todayRestaurant_mapper.getTodayRestaurantsName");
		
		for(String str : todayRetaurantsNameList) {
			System.out.println(str);
		}
		
	}

	

}
