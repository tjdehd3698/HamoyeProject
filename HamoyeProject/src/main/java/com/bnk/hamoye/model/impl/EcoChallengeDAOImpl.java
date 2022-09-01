package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.EcoChallengeDAO;

@Repository
public class EcoChallengeDAOImpl implements EcoChallengeDAO {

	private final String NS = "sql.hamoye.ecoChallenge_mapper.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return sqlSession.update(NS+"registerEcoChallenge", ecoChallenge);
	}
	
	@Override
	public int updateEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return sqlSession.update(NS+"updateEcoChallenge", ecoChallenge);
	}

	@Override
	public int deleteEcoChallenge(String ecoChallengeId) throws Exception {
		return sqlSession.update(NS+"deleteEcoChallenge", ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> searchEcoChallenge(String word) throws Exception {
		return sqlSession.selectList(NS+"searchEcoChallenge", word);
	}

	@Override
	public EcoChallenge getEcoChallengeStatus(String ecoChallengeId) throws Exception {
		return null;
	}

	@Override
	public List<EcoChallenge> getEcoChallengeList() throws Exception {
		return sqlSession.selectList(NS+"getEcoChallengeList");
	}

	@Override
	public EcoChallenge getEcoChallengeDetail(String ecoChallengeId) throws Exception {
		return sqlSession.selectOne(NS+"getEcoChallengeDetail", ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getRecommendedEcoChallengeList(User user) throws Exception {
		return sqlSession.selectOne(NS+"getRecommendedEcoChallengeList", user);
	}

}
