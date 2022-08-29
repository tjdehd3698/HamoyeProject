package com.bnk.hamoye.model;

import java.sql.SQLException;
import java.util.Map;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.User;

public interface AccountDAO {
	int registerAccount(Account account) throws SQLException;
	int expireAccount(String id) throws SQLException;
	int deleteAccount(String id)  throws SQLException;
	int updateBalance(Map<String, String> map) throws SQLException;
}
