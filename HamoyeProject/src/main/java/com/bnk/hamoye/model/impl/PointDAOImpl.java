package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Point;
import com.bnk.hamoye.model.PointDAO;

import lombok.RequiredArgsConstructor;

@Repository
public class PointDAOImpl implements PointDAO {
	private final String NS = "sql.hamoye.point_mapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertPoint(Point point) throws SQLException {
		return sqlSession.insert(NS+"insertPoint",point);
	}

	@Override
	public int updateTotalPoint(Map<String, String> map) throws SQLException {
		return sqlSession.update(NS+"updateTotalPoint",map);
	}

	@Override
	public int deletePoint(String userId) throws SQLException {
		return sqlSession.delete(NS+"deletePoint",userId);
	}
	

}
