package com.bnk.hamoye.service;

import java.sql.SQLException;
import java.util.List;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.User;

public interface AdminService {
	User adminLogin(User user) throws SQLException;
	List<User> getAllUser() throws SQLException;
	int getAllAcountCnt() throws SQLException;
	List<Status> getAllEcoChallenge() throws Exception;
}
