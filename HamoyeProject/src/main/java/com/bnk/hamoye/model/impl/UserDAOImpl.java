package com.bnk.hamoye.model.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.UserDAO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {
	private final String NS = "sql.hamoye.user_mapper.";
	private final SqlSession sqlSession;
	
	@Override
	public int registerUser(User user) throws Exception {
		return sqlSession.insert(NS+"registerUser",user);
	}

	@Override
	public User login(User user) throws Exception {
		return (User)sqlSession.selectOne(NS+"userIdPassword", user);
	}

	@Override
	public User duplicateId(User user) throws Exception {
		return (User)sqlSession.selectOne(NS+"userIdPassword", user);
	}

	@Override
	public int updateUser(User user) throws Exception {
		return sqlSession.update(NS+"updateUser", user);
	}

	@Override
	public User getUserInfo(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getUserInfo",userId);
	}

	@Override
	public int updateUserPassword(User user) throws Exception {
		return sqlSession.update(NS+"updateUserPassword", user);
	}

	@Override
	public int withdrawUser(String userId) throws Exception {
		return sqlSession.update(NS+"withdrawUser", userId);
	}
	
	@Override
	public int joinAccount(User user) throws Exception {
		return sqlSession.update(NS+"joinAccount",user);
	}

	@Override
	public String checkEcoChallenge(String userId) throws Exception {
		return sqlSession.selectOne(NS+"checkEcoChallenge",userId);
	}

	@Override
	public User getMypageInfo(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getMypageInfo",userId);
	}

	@Override
	public int expireAccount(String userId) throws Exception {
		return sqlSession.update(NS+"expireAccount",userId);
	}

	@Override
	public List<User> getAllUser() throws Exception {
		return sqlSession.selectList(NS+"getAllUser");
	}

	@Override
	public User getUserAllInfo(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getUserAllInfo",userId);
	}

	@Override
	public List<User> getUserByEcoChallenge(String ecoChallengeId) throws Exception {
		return sqlSession.selectList(NS+"getUserByEcoChallenge", ecoChallengeId);
	}

	@Override
	public User getMypageInfoWithNoEco(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getMypageInfoWithNoEco",userId);
	}

	@Override
	public int getUserCntByDate(String date) throws Exception {
		return sqlSession.selectOne(NS+"getUserCntByDate", date);
	}

	@Override
	public User getUserInfoByAdmin(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getUserInfoByAdmin", userId);
	}

	@Override
	public User getUserInfoByAdminWithNoEco(String userId) throws Exception {
		return sqlSession.selectOne(NS+"getUserInfoByAdminWithNoEco",userId);
	}

	@Override
	public int updateUserByAdmin(User user) throws Exception {
		return sqlSession.update(NS+"updateUserByAdmin",user);
	}

	@Override
	public List<User> getUserByEcoChallengeType(String ecoChallengeId) throws Exception {
		return sqlSession.selectList(NS+"getUserByEcoChallengeType", ecoChallengeId);
	}

	@Override
	public int updateUserParticipationCount(Map<String, String> map) throws Exception {
		return sqlSession.update(NS+"updateUserParticipationCount", map);
	}

}
