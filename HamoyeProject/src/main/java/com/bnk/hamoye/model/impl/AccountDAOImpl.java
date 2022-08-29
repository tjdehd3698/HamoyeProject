package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;

import lombok.RequiredArgsConstructor;

@Repository
public class AccountDAOImpl implements AccountDAO{
	private final String NS = "sql.hamoye.account_mapper.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerAccount(Account account) throws SQLException {
		return sqlSession.insert("insertAccount",account);
	}

	@Override
	public int expireAccount(String id) throws SQLException {
		return sqlSession.update("expireAccount",id);
	}

	@Override
	public int deleteAccount(String id) throws SQLException {
		return sqlSession.delete("deleteAccount",id);
	}

	@Override
	public int updateBalance(Map<String, String> map) throws SQLException {
		return sqlSession.update("updateBalance", map);
	}

}
