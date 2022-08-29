package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.TripChallengeDAO;

public class TripChallengeDAOImpl implements TripChallengeDAO {

	private final String NS = "sql.hamoye.tripChallenge_mapper.";
	private SqlSession sqlSession;
	
	@Override
	public int registerTripChallenge(TripChallenge tripChallenge) throws Exception {
		return sqlSession.insert("registerTripChallenge", tripChallenge);
	}

	@Override
	public int updateTripChallenge(TripChallenge tripChallenge) throws Exception {
		return sqlSession.update("updateTripChallenge", tripChallenge);
	}

	@Override
	public int deleteTripChallenge(String tripChallengeId) throws Exception {
		return sqlSession.update("deleteTripChallenge", tripChallengeId);
	}

	@Override
	public List<TripChallenge> searchTripChallenge(String word) throws Exception {
		return sqlSession.selectList("searchTripChallenge", word);
	}

	@Override
	public TripChallenge getTripChallengeStatus(String tripChallengeId) throws Exception {
		return null;
	}

	@Override
	public List<TripChallenge> getTripChallengeList() throws Exception {
		return sqlSession.selectList("getTripChallengeList");
	}

	@Override
	public TripChallenge getTripChallengeDetail(String tripChallengeId) throws Exception {
		return sqlSession.selectOne("getTripChallengeDetail", tripChallengeId);
	}

	@Override
	public List<TripChallenge> getRecommendedTripChallengeList(User user) throws Exception {
		return sqlSession.selectOne("getRecommendedTripChallengeList", user);
	}

}
