package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.model.ParticipationDAO;

@Repository
public class ParticipationDAOImpl implements ParticipationDAO {
	private final String NS = "sql.hamoye.participation_mapper.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Participation> getParticipateChallenge(String userId) throws SQLException {
		return sqlSession.selectList(NS+"getParticipateChallenge", userId);
	}

	@Override
	public List<Participation> getAllUserByTripChallenge(String tripChallengId) throws SQLException {
		return sqlSession.selectList(NS+"getAllUserByTripChallenge", tripChallengId);
	}

}
