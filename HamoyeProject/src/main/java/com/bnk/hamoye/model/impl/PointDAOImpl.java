package com.bnk.hamoye.model.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Point;
import com.bnk.hamoye.model.PointDAO;

@Repository
public class PointDAOImpl implements PointDAO {
	private final String NS = "sql.hamoye.point_mapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPoint(Point point) throws Exception {
		return sqlSession.insert(NS + "insertPoint", point);
	}

	@Override
	public int updateTotalPoint(Map<String, String> map) throws Exception {
		return sqlSession.update(NS + "updateTotalPoint", map);
	}

	@Override
	public int deletePoint(String userId) throws Exception {
		return sqlSession.delete(NS + "deletePoint", userId);
	}

	@Override
	public int getPointSum() throws Exception {
		return sqlSession.selectOne(NS + "getPointSum");
	}

}
