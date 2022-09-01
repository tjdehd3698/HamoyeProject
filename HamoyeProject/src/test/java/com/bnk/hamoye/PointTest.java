package com.bnk.hamoye;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.Point;


public class PointTest {
	
	@Test
	public void insertPoint() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		Point point = new Point();
		
		int row = session.insert("sql.hamoye.point_mapper.insertPoint",point);
		session.commit();
	}
	
	@Test
	public void updatePoint() throws Exception{
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("user_id", "aaa");
		map.put("amount","-100");
		System.out.println(session.update("sql.hamoye.point_mapper.updateTotalPoint",map));
		session.commit();
	}
	
	
	
}
