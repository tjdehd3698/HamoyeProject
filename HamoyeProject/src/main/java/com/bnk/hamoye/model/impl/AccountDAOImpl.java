package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AccountDAOImpl implements AccountDAO{
	private final String NS = "sql.hamoye.account_mapper.";
	private SqlSession sqlSession;
	
	@Override
	public int insertAccount(Account account) throws SQLException {
		return sqlSession.insert("insertAccount",account);
	}

	@Override
	public int registerAccount(User user) throws SQLException {
		return sqlSession.update("registerAccount",user);
	}

	@Override
	public int expireAccount(String id) throws SQLException {
		return sqlSession.update("expireAccount",id);
	}

	@Override
	public int deleteAccount(String id) throws SQLException {
		return sqlSession.update("deleteAccount",id);
	}

	@Override
	public int updateBalance(Map<String, String> map) throws SQLException {
		return sqlSession.update("updateBalance", map);
	}

}
