package com.bnk.hamoye.model.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.UserDAO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {
	private final String NS = "sql.hamoye.user_mapper.";
	private final SqlSession sqlSession;
	
	@Override
	public int registerUser(User user) throws SQLException {
		return sqlSession.insert("registerUser",user);
	}

	@Override
	public User login(User user) throws SQLException {
		return (User)sqlSession.selectOne("userIdPassword", user);
	}

	@Override
	public User duplicateId(User user) throws SQLException {
		return (User)sqlSession.selectOne("userIdPassword", user);
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return sqlSession.update("updateUser", user);
	}

	@Override
	public User getUserInfo(String userId) throws SQLException {
		return sqlSession.selectOne("getUserInfo",userId);
	}

	@Override
	public int updateUserPassword(User user) throws SQLException {
		return sqlSession.update("updateUserPassword", user);
	}

	@Override
	public int withdrawUser(String userId) throws SQLException {
		return sqlSession.update("withdrawUser", userId);
	}
	
	@Override
	public int joinAccount(User user) throws SQLException {
		return sqlSession.update("joinAccount",user);
	}

	@Override
	public String checkEcoChallenge(String userId) throws SQLException {
		return sqlSession.selectOne("checkEcoChallenge",userId);
	}

	@Override
	public User getMypageInfo(String userId) throws SQLException {
		return sqlSession.selectOne("getMypageInfo",userId);
	}

	@Override
	public int expireAccount(String userId) throws SQLException {
		return sqlSession.update("expireAccount",userId);
	}

	@Override
	public List<Participation> getParticipateChallenge(String userId) throws SQLException {
		return sqlSession.selectList("getParticipateChallenge", userId);
	}

	@Override
	public List<User> getAllUser() throws SQLException {
		return sqlSession.selectList("getAllUser");
	}

}
