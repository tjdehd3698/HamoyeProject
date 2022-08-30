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
		return sqlSession.insert(NS+"insertAccount",account);
	}

	@Override
	public int deleteAccount(String userId) throws SQLException {
		return sqlSession.delete(NS+"deleteAccount",userId);
	}

	@Override
	public int updateBalance(Map<String, String> map) throws SQLException {
		return sqlSession.update(NS+"updateBalance", map);
	}

	@Override
	public int getAllAcountCnt() throws SQLException {
		return sqlSession.selectList(NS+"getAllAcountCnt").size();
	}

}
