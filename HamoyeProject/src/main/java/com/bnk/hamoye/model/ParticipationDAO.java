package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.Participation;

public interface ParticipationDAO {
	List<Participation> getAllUserByTripChallenge(String tripChallengId) throws SQLException;
	List<Participation> getParticipateChallenge(String userId) throws SQLException;

}
