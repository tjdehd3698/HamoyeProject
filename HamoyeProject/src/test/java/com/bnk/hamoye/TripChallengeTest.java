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

import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;

public class TripChallengeTest {
	
	@Test
	public void registerTripChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		TripChallenge trip = new TripChallenge();
		trip.setTripChallengeName("쓰레기 줍기");
		trip.setStartDate(Date.valueOf("2022-03-15"));
		trip.setEndDate(Date.valueOf("2022-05-19"));
		trip.setRewardPoint(100);
		
		int row = session.insert("sql.hamoye.tripChallenge_mapper.registerTripChallenge",trip);
		System.out.println();
		session.commit();
	}
	
	@Test
	public void updateTripChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		TripChallenge trip = new TripChallenge();
		trip.setTripChallengeId("4");
		trip.setTripChallengeName("쓰레기 줍기");
		trip.setStartDate(Date.valueOf("2022-03-15"));
		trip.setEndDate(Date.valueOf("2022-05-19"));
		trip.setRewardPoint(100);
		
		int row = session.update("sql.hamoye.tripChallenge_mapper.updateTripChallenge",trip);
		System.out.println();
		session.commit();
	}
	
	@Test
	public void deleteTripChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int row = session.update("sql.hamoye.tripChallenge_mapper.deleteTripChallenge",'4');
		System.out.println();
		session.commit();
	}
	
	
	  @Test
	  public void searchTripChallenge() throws Exception { 
		  Reader r =
	  Resources.getResourceAsReader("config/SqlMapConfig.xml");
	  
	  SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	  SqlSession session = factory.openSession();
	  
	  String word = "쓰";
	  
	  List<TripChallenge> tripChallengeList =
	  session.selectList("sql.hamoye.tripChallenge_mapper.searchTripChallenge", word);
	  
	  for(TripChallenge tripChallenge : tripChallengeList) { 
		  System.out.println(tripChallenge);
	  }
	  }
	
	@Test
	public void getTripChallengeList() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<TripChallenge> tripChallengeList = new ArrayList<TripChallenge>();
				
		tripChallengeList = session.selectList("sql.hamoye.tripChallenge_mapper.getTripChallengeList");
		
		for(TripChallenge tripChallenge : tripChallengeList) {
			System.out.println(tripChallenge);
		}
		System.out.println();
	}
	
	@Test
	public void getTripChallengeDetail() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String challengeId = "5";
		
		TripChallenge tripChallenge = session.selectOne("sql.hamoye.tripChallenge_mapper.getTripChallengeDetail", challengeId);
		
		System.out.println(tripChallenge);
		System.out.println();
	}
	
	@Test
	public void getRtripmmendedTripChallengeList() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		HttpSession session2 = null;
		
		User user = (User)session2.getAttribute("user");
		
		TripChallenge tripChallenge = session.selectOne("sql.hamoye.tripChallenge_mapper.getRtripmmendedTripChallengeList", user);
		
		System.out.println(tripChallenge);
		System.out.println();
	}
	
}
