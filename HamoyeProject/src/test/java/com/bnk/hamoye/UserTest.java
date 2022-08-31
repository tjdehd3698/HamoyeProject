package com.bnk.hamoye;

import java.io.Reader;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Point;
import com.bnk.hamoye.domain.User;

public class UserTest {
	@Test
	public void registerUser() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Point point = new Point();
		session.insert("sql.hamoye.point_mapper.insertPoint",point);
		
		Account account = new Account();
		account.setPrimeRate(0.5);
		account.makeAccountNumber();
		session.insert("sql.hamoye.account_mapper.insertAccount",account);
		
		EcoChallenge eco = new EcoChallenge();
		eco.setEcoChallengeName("쓰레기 줍기2");
		eco.setPrimeRate(2.1);
		eco.setStartDate(Date.valueOf("2022-03-12"));
		eco.setEndDate(Date.valueOf("2022-05-18"));
		eco.setLimitedPeople(300);
		
		session.insert("sql.hamoye.ecoChallenge_mapper.insertEcoChallenge",eco);
		
		User user = new User();
		user.setUserId("aaa");
		user.setUserPassword("aaa");
		user.setUserAddress("부산시");
		user.setUserName("김성동");
		user.setPointId(point.getPointId());
		user.setEmail("asdasd@naber.com");
		user.setBirthday("980323-1");
		String birth = user.getBirthday();
		
		char last = birth.charAt(birth.length()-1);
		if(last=='1'||last=='3')
			user.setGender("m");
		else
			user.setGender("f");
		
		String birthYear ="";
		if(last=='1'||last=='2')
			birthYear ="19";
		else
			birthYear ="20";
		birthYear+=(birth.charAt(0)+""+birth.charAt(1));
		
		// 현재 날짜 구하기       
		LocalDate now = LocalDate.now();         
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
		// 포맷 적용        
		String nowYear = now.format(formatter);
		int age = Integer.parseInt(nowYear)-Integer.parseInt(birthYear); 
		
		user.setUserAge(age);
		
		session.insert("sql.hamoye.user_mapper.registerUser",user);
		
		user.setEcoChallengeId(eco.getEcoChallengeId());
		user.setAccountNumber(account.getAccountNumber());
		session.update("registerAccount",user);
		session.commit();
	}
	
	@Test
	public void getMypageInfo()throws Exception{
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		User user = (User)session.selectOne("getMypageInfo","aaa");
		System.out.println(user.getUserName());
		System.out.println(user.getAccount().getBalance());
		System.out.println(user.getEcoChallenge().getEcoChallengeName());
		System.out.println(user.getPoint().getTotalPoint());
		System.out.println(user.getEcoChallenge().getTotalCount());
	}
	
	@Test
	public void login() throws Exception{
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		String id = "admin";
		String password = "admin";
		User user = new User();
		user.setUserId(id);
		user.setUserPassword(password);
		user.setIsAdmin(1);
		
		User findId = (User)session.selectOne("userIdPassword", user);
		System.out.println(findId.getUserAddress());
		
		
	}
}
