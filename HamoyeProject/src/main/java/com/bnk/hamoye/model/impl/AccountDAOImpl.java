package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.model.AccountDAO;

@Repository
public class AccountDAOImpl implements AccountDAO{
	private final String NS = "sql.hamoye.account_mapper.";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int registerAccount(Account account) throws Exception {
		return sqlSession.insert(NS+"registerAccount",account);
	}
	
	@Override
	public int checkAccount(String accountNumber) throws Exception{
		return sqlSession.selectOne(NS+"checkAccount",accountNumber);
	}

	@Override
	public int deleteAccount(String userId) throws Exception {
		return sqlSession.delete(NS+"deleteAccount",userId);
	}

	@Override
	public int updateBalance(Map<String, String> map) throws Exception {
		return sqlSession.update(NS+"updateBalance", map);
	}

	@Override
	public int getAllAcountCnt() throws Exception {
		return sqlSession.selectList(NS+"getAllAcountCnt").size();
	}

	@Override
	public int getAccountCntByDate(String date) throws Exception {
		return sqlSession.selectOne(NS+"getAccountCntByDate",date);
	}

	@Override
	public int getBalanceSum() throws Exception {
		return sqlSession.selectOne(NS+"getBalanceSum");
	}


}
