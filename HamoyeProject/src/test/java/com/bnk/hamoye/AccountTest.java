package com.bnk.hamoye;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.Point;


public class AccountTest {
	
	@Test
	public void insertAccount() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Account account = new Account();
		account.setPrimeRate(0.5);
		account.makeAccountNumber();
		
		int row = session.insert("sql.hamoye.account_mapper.insertAccount",account);
		System.out.println();
		session.commit();
	}
	
	
	
}
