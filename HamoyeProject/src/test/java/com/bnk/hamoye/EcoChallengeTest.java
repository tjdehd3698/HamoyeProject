package com.bnk.hamoye;

import java.io.Reader;
import java.sql.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.EcoChallenge;


public class EcoChallengeTest {
	
	@Test
	public void insertAccount() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		EcoChallenge eco = new EcoChallenge();
		eco.setEcoChallengeName("쓰레기 줍기");
		eco.setPrimeRate(2.3);
		eco.setStartDate(Date.valueOf("2022-03-12"));
		eco.setEndDate(Date.valueOf("2022-05-18"));
		eco.setLimitedPeople(300);
		
		int row = session.insert("sql.hamoye.ecoChallenge_mapper.insertEcoChallenge",eco);
		System.out.println();
		session.commit();
	}
	
	
	
}
