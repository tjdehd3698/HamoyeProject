package com.bnk.hamoye.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripStatus;
import com.bnk.hamoye.domain.User;

public interface AdminService {
	User adminLogin(User user) throws SQLException;
	List<User> getAllUser() throws SQLException;
	int getAllAcountCnt() throws SQLException;
	List<Status> getAllEcoChallenge() throws Exception;
	List<TripStatus> getAllTripChallenge() throws Exception;
	int getUserCntByDate() throws Exception;
	int getAccountCntByDate() throws Exception;
	int getBalanceSum() throws Exception;
	int getPointSum() throws Exception;
	Map<String,Integer> getTripChallengeCntByMonth() throws Exception;
}
