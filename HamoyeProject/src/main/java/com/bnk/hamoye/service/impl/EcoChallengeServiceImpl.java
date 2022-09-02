package com.bnk.hamoye.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.EcoChallengeService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EcoChallengeServiceImpl implements EcoChallengeService {

	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	private final EcoChallengeDAO ecoChallengeDAO;
	
	@Override
	public int registerEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return ecoChallengeDAO.registerEcoChallenge(ecoChallenge);
	}

	@Override
	public int updateEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return ecoChallengeDAO.updateEcoChallenge(ecoChallenge);
	}

	@Override
	public int deleteEcoChallenge(String challengeId) throws Exception {
		return ecoChallengeDAO.deleteEcoChallenge(challengeId);
	}

	@Override
	public List<EcoChallenge> searchEcoChallenge(String word) throws Exception {
		return ecoChallengeDAO.searchEcoChallenge(word);
	}

	@Override
	public EcoChallenge getEcoChallengeStatus(String ecoChallengeId) throws Exception {
		return ecoChallengeDAO.getEcoChallengeStatus(ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getEcoChallengeList() throws Exception {
		return ecoChallengeDAO.getEcoChallengeList();
	}

	@Override
	public EcoChallenge getEcoChallengeDetail(String ecoChallengeId) throws Exception {
		return ecoChallengeDAO.getEcoChallengeDetail(ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getRecommendedEcoChallengeList(User user) throws Exception {
		return ecoChallengeDAO.getRecommendedEcoChallengeList(user);
	}

	@Override
	public List<String> getEcoChallengeType() throws Exception {
		return ecoChallengeDAO.getEcoChallengeType();
	}

}
