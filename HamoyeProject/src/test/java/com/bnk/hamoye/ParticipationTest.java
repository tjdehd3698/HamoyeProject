package com.bnk.hamoye;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.bnk.hamoye.domain.Participation;

public class ParticipationTest {

	@Test
	public void doParticipateTripChallenge() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");

		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		Participation participation = new Participation();
		participation.setUserId("aa");
		participation.setTripChallengeId("bbb");

		int row = session.insert("sql.hamoye.participation_mapper.doParticipateTripChallenge", participation);
		System.out.println();
		session.commit();
	}

	@Test
	public void checkParticipationTripChallenge(Participation participation) throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");

		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();
		participation.setUserId("aa");
		participation.setTripChallengeId("bbb");
		
		session.selectOne("sql.hamoye.participation_mapper.checkParticipationTripChallenge", participation);
		System.out.println();
	}

}
