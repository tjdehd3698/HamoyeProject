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

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;


public class EcoChallengeTest {
	
	@Test
	public void registerEcoChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		EcoChallenge eco = new EcoChallenge();
		eco.setEcoChallengeName("쓰레기 줍기");
		((EcoChallenge) eco).setPrimeRate(2.3);
		eco.setStartDate(Date.valueOf("2022-03-12"));
		eco.setEndDate(Date.valueOf("2022-05-18"));
		((EcoChallenge) eco).setLimitedPeople(300);
		
		int row = session.insert("sql.hamoye.ecoChallenge_mapper.registerEcoChallenge",eco);
		System.out.println();
		session.commit();
	}
	
	@Test
	public void updateEcoChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		EcoChallenge eco = new EcoChallenge();
		eco.setEcoChallengeId("4");
		eco.setEcoChallengeName("쓰레기 줍기");
		((EcoChallenge) eco).setPrimeRate(3.3);
		eco.setStartDate(Date.valueOf("2022-03-15"));
		eco.setEndDate(Date.valueOf("2022-05-19"));
		((EcoChallenge) eco).setLimitedPeople(400);
		
		int row = session.update("sql.hamoye.ecoChallenge_mapper.updateEcoChallenge",eco);
		System.out.println();
		session.commit();
	}
	
	@Test
	public void deleteEcoChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		int row = session.update("sql.hamoye.ecoChallenge_mapper.deleteEcoChallenge",'4');
		System.out.println();
		session.commit();
	}
	
	
	  @Test
	  public void searchEcoChallenge() throws Exception { 
		  Reader r =
	  Resources.getResourceAsReader("config/SqlMapConfig.xml");
	  
	  SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
	  SqlSession session = factory.openSession();
	  
	  String word = "쓰";
	  
	  List<EcoChallenge> ecoChallengeList =
	  session.selectList("sql.hamoye.ecoChallenge_mapper.searchEcoChallenge", word);
	  
	  for(EcoChallenge ecoChallenge : ecoChallengeList) { 
		  System.out.println(ecoChallenge);
	  }
	  }
	
	@Test
	public void getEcoChallengeList() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		List<EcoChallenge> ecoChallengeList = new ArrayList<EcoChallenge>();
				
		ecoChallengeList = session.selectList("sql.hamoye.ecoChallenge_mapper.getEcoChallengeList");
		
		for(EcoChallenge ecoChallenge : ecoChallengeList) {
			System.out.println(ecoChallenge);
		}
		System.out.println();
	}
	
	@Test
	public void getEcoChallengeDetail() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String challengeId = "5";
		
		EcoChallenge ecoChallenge = session.selectOne("sql.hamoye.ecoChallenge_mapper.getEcoChallengeDetail", challengeId);
		
		System.out.println(ecoChallenge);
		System.out.println();
	}
	
	@Test
	public void getRecommendedEcoChallengeList() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		HttpSession session2 = null;
		
		User user = (User)session2.getAttribute("user");
		
		EcoChallenge ecoChallenge = session.selectOne("sql.hamoye.ecoChallenge_mapper.getRecommendedEcoChallengeList", user);
		
		System.out.println(ecoChallenge);
		System.out.println();
	}
	
	
	
}