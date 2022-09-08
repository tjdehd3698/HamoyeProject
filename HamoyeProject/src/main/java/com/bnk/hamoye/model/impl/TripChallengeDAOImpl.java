package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.TripChallengeDAO;

@Repository
public class TripChallengeDAOImpl implements TripChallengeDAO {

	private final String NS = "sql.hamoye.tripChallenge_mapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int registerTripChallenge(TripChallenge tripChallenge) throws Exception {
		return sqlSession.insert(NS + "registerTripChallenge", tripChallenge);
	}

	@Override
	public int updateTripChallenge(TripChallenge tripChallenge) throws Exception {
		return sqlSession.update(NS + "updateTripChallenge", tripChallenge);
	}

	@Override
	public int deleteTripChallenge(String tripChallengeId) throws Exception {
		return sqlSession.update(NS + "deleteTripChallenge", tripChallengeId);
	}

	@Override
	public List<TripChallenge> searchTripChallenge(String word) throws Exception {
		return sqlSession.selectList(NS + "searchTripChallenge", word);
	}

	@Override
	public TripChallenge getTripChallengeStatus(String tripChallengeId) throws Exception {
		return null;
	}

	@Override
	public List<TripChallenge> getTripChallengeList() throws Exception {
		return sqlSession.selectList(NS + "getTripChallengeList");
	}

	@Override
	public TripChallenge getTripChallengeDetail(String tripChallengeId) throws Exception {
		return sqlSession.selectOne(NS + "getTripChallengeDetail", tripChallengeId);
	}

	@Override
	public List<TripChallenge> getRecommendedTripChallengeList(User user) throws Exception {
		return sqlSession.selectOne(NS + "getRecommendedTripChallengeList", user);
	}

	@Override
	public List<TripChallenge> getTripChallengeListByAdmin() throws Exception {
		return sqlSession.selectList(NS + "getTripChallengeListByAdmin");
	}

	@Override
	public int updateTripChallengeImage(TripChallenge tripChallenge) throws Exception {
		return sqlSession.update(NS + "updateTripChallengeImage", tripChallenge);
	}

}
