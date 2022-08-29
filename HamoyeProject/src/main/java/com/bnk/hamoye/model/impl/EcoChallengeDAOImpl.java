package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.EcoChallengeDAO;

public class EcoChallengeDAOImpl implements EcoChallengeDAO {

	private final String NS = "sql.hamoye.ecoChallenge_mapper.";
	private SqlSession sqlSession;
	
	@Override
	public int registerEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return sqlSession.update("registerEcoChallenge", ecoChallenge);
	}
	
	@Override
	public int updateEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return sqlSession.update("updateEcoChallenge", ecoChallenge);
	}

	@Override
	public int deleteEcoChallenge(String ecoChallengeId) throws Exception {
		return sqlSession.update("deleteEcoChallenge", ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> searchEcoChallenge(String word) throws Exception {
		return sqlSession.selectList("searchEcoChallenge", word);
	}

	@Override
	public EcoChallenge getEcoChallengeStatus(String ecoChallengeId) throws Exception {
		return null;
	}

	@Override
	public List<EcoChallenge> getEcoChallengeList() throws Exception {
		return sqlSession.selectList("getEcoChallengeList");
	}

	@Override
	public EcoChallenge getEcoChallengeDetail(String ecoChallengeId) throws Exception {
		return sqlSession.selectOne("getChallengeDetail", ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getRecommendedEcoChallengeList(User user) throws Exception {
		return sqlSession.selectOne("getRecommendedEcoChallengeList", user);
	}

}
