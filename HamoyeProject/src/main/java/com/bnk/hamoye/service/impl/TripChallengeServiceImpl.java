package com.bnk.hamoye.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.TripChallengeDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.TripChallengeService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TripChallengeServiceImpl implements TripChallengeService {

	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	private final TripChallengeDAO tripChallengeDAO;
	
	@Override
	public int registerTripChallenge(TripChallenge tripChallenge) throws Exception {
		return tripChallengeDAO.registerTripChallenge(tripChallenge);
	}

	@Override
	public int updateTripChallenge(TripChallenge tripChallenge) throws Exception {
		return tripChallengeDAO.updateTripChallenge(tripChallenge);
	}

	@Override
	public int deleteTripChallenge(String challengeId) throws Exception {
		return tripChallengeDAO.deleteTripChallenge(challengeId);
	}

	@Override
	public List<TripChallenge> searchTripChallenge(String word) throws Exception {
		return tripChallengeDAO.searchTripChallenge(word);
	}

	@Override
	public TripChallenge getTripChallengeStatus(String tripChallengeId) throws Exception {
		return tripChallengeDAO.getTripChallengeStatus(tripChallengeId);
	}

	@Override
	public List<TripChallenge> getTripChallengeList() throws Exception {
		return tripChallengeDAO.getTripChallengeList();
	}

	@Override
	public TripChallenge getTripChallengeDetail(String tripChallengeId) throws Exception {
		return tripChallengeDAO.getTripChallengeDetail(tripChallengeId);
	}

	@Override
	public List<TripChallenge> getRecommendedTripChallengeList(User user) throws Exception {
		return tripChallengeDAO.getRecommendedTripChallengeList(user);
	}

	@Override
	public List<TripChallenge> getTripChallengeListByAdmin() throws Exception {
		return tripChallengeDAO.getTripChallengeListByAdmin();
	}

	@Override
	public int participateTripChallenge(Participation participation) throws Exception {
		return participationDAO.doParticipateTripChallenge(participation);
	}

	@Override
	public int checkParticipationTripChallenge(Participation participation) throws Exception {
		return participationDAO.checkParticipateTripChallenge(participation);
	}

	@Override
	public int addPoint(String userId, int rewardPoint) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("amount", String.valueOf(rewardPoint));
		map.put("userId", userId);
		return pointDAO.updateTotalPoint(map);
	}

}
