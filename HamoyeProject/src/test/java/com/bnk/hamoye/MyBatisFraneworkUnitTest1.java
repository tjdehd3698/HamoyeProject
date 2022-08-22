package com.bnk.hamoye;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.service.spring.domain.MyProduct;

public class MyBatisFraneworkUnitTest1 {
	public static void main(String[] args) throws Exception{
		//1. 설정문서를 DIContainer가 읽어들여야 한다.
		Reader r=Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		//2. r을 SqlSessionFactory에서
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		
		//3. SqlSession
		SqlSession session = factory.openSession();
		
		System.out.println("===== 1. addProduct =======\n");
		
		MyProduct vo = new MyProduct("통돌이 세탁기", "대우", 500000);
		int result=session.insert("ns.sql.MyProductMapper.addProduct",vo);
		
		session.commit();//반드시 잊지말자~~~!!
		System.out.println(result+" 개 상품 추가 성공^^");

	}
}








