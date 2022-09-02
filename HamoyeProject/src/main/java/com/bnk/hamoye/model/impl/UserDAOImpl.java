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
		return sqlSession.insert(NS+"registerUser",user);
	}

	@Override
	public User login(User user) throws SQLException {
		return (User)sqlSession.selectOne(NS+"userIdPassword", user);
	}

	@Override
	public User duplicateId(User user) throws SQLException {
		return (User)sqlSession.selectOne(NS+"userIdPassword", user);
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return sqlSession.update(NS+"updateUser", user);
	}

	@Override
	public User getUserInfo(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getUserInfo",userId);
	}

	@Override
	public int updateUserPassword(User user) throws SQLException {
		return sqlSession.update(NS+"updateUserPassword", user);
	}

	@Override
	public int withdrawUser(String userId) throws SQLException {
		return sqlSession.update(NS+"withdrawUser", userId);
	}
	
	@Override
	public int joinAccount(User user) throws SQLException {
		return sqlSession.update(NS+"joinAccount",user);
	}

	@Override
	public String checkEcoChallenge(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"checkEcoChallenge",userId);
	}

	@Override
	public User getMypageInfo(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getMypageInfo",userId);
	}

	@Override
	public int expireAccount(String userId) throws SQLException {
		return sqlSession.update(NS+"expireAccount",userId);
	}

	@Override
	public List<User> getAllUser() throws SQLException {
		return sqlSession.selectList(NS+"getAllUser");
	}

	@Override
	public User getUserAllInfo(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getUserAllInfo",userId);
	}

	@Override
	public List<User> getUserByEcoChallenge(String ecoChallengeId) throws SQLException {
		return sqlSession.selectList(NS+"getUserByEcoChallenge", ecoChallengeId);
	}

	@Override
	public User getMypageInfoWithNoEco(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getMypageInfoWithNoEco",userId);
	}

	@Override
	public int getUserCntByDate(String date) throws SQLException {
		return sqlSession.selectOne(NS+"getUserCntByDate", date);
	}

	@Override
	public User getUserInfoByAdmin(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getUserInfoByAdmin", userId);
	}

	@Override
	public User getUserInfoByAdminWithNoEco(String userId) throws SQLException {
		return sqlSession.selectOne(NS+"getUserInfoByAdminWithNoEco",userId);
	}

	@Override
	public int updateUserByAdmin(User user) throws SQLException {
		return sqlSession.update(NS+"updateUserByAdmin",user);
	}

	@Override
	public List<User> getUserByEcoChallengeType(String ecoChallengeId) throws SQLException {
		return sqlSession.selectList(NS+"getUserByEcoChallengeType", ecoChallengeId);
	}

	@Override
	public int joinEcoChallenge(User user) throws SQLException {
		return sqlSession.update(NS+"joinEcoChallenge",user);
	}

}
