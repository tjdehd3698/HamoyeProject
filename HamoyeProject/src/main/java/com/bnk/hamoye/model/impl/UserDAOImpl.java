package com.bnk.hamoye.model.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.UserDAO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {
	private final String NS = "sql.hamoye.user_mapper.";
	private SqlSession sqlSession;
	
	@Override
	public int registerUser(User user) throws SQLException {
		return sqlSession.insert("registerUser",user);
	}

	@Override
	public String login(User user) throws SQLException {
		return (String)sqlSession.selectOne("userIdPassword", user);
	}

	@Override
	public String duplicateId(User user) throws SQLException {
		return (String)sqlSession.selectOne("userIdPassword", user);
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return sqlSession.update("updateUser", user);
	}

	@Override
	public User getUserInfo(String id) throws SQLException {
		return sqlSession.selectOne("getUserInfo",id);
	}

	@Override
	public int updateUserPassword(User user) throws SQLException {
		return sqlSession.update("updateUserPassword", user);
	}

}
