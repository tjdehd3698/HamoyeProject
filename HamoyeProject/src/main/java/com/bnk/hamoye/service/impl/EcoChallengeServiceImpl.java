package com.bnk.hamoye.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.EcoChallengeService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EcoChallengeServiceImpl implements EcoChallengeService {

	private final UserDAO userDAO;
	private final PointDAO pointDAO;
	private final AccountDAO accountDAO;
	private final ParticipationDAO participationDAO;
	private final EcoChallengeDAO ecoChallengeDAO;

	@Override
	public int registerEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return ecoChallengeDAO.registerEcoChallenge(ecoChallenge);
	}

	@Override
	public int updateEcoChallenge(EcoChallenge ecoChallenge) throws Exception {
		return ecoChallengeDAO.updateEcoChallenge(ecoChallenge);
	}

	@Override
	public int deleteEcoChallenge(String challengeId) throws Exception {
		return ecoChallengeDAO.deleteEcoChallenge(challengeId);
	}

	@Override
	public List<EcoChallenge> searchEcoChallenge(String word) throws Exception {
		return ecoChallengeDAO.searchEcoChallenge(word);
	}

	@Override
	public EcoChallenge getEcoChallengeStatus(String ecoChallengeId) throws Exception {
		return ecoChallengeDAO.getEcoChallengeStatus(ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getEcoChallengeList() throws Exception {
		return ecoChallengeDAO.getEcoChallengeList();
	}

	@Override
	public EcoChallenge getEcoChallengeDetail(String ecoChallengeId) throws Exception {
		return ecoChallengeDAO.getEcoChallengeDetail(ecoChallengeId);
	}

	@Override
	public List<EcoChallenge> getRecommendedEcoChallengeList(User user) throws Exception {
		return ecoChallengeDAO.getRecommendedEcoChallengeList(user);
	}

	@Override
	public List<String> getEcoChallengeType() throws Exception {
		return ecoChallengeDAO.getEcoChallengeType();
	}

	@Override
	public Account setAccountInfo(String purpose, String incomeSource, String maturity, String ecoChallengeId)
			throws Exception {
		EcoChallenge ecoChallenge = ecoChallengeDAO.getEcoChallengeDetail(ecoChallengeId); // ecoChallenge 정보를 담은 객체 생성

		Account account = new Account(); // 계좌 생성
		Date now = new Date(); // 현재 날짜

		Calendar cal = Calendar.getInstance(); // Calendar 객체 생성
		cal.setTime(now); // Calendar에 현재 날짜 지정
		String[] newMaturity = maturity.split("개");
		cal.add(Calendar.MONTH, Integer.parseInt(newMaturity[0].trim())); // 현재 날짜에 개월 수 더해서 만기일 갱신

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = simpleDateFormat.format(cal.getTime());
		account.setIncomeSource(incomeSource); // 수입원 주입
		account.setMatureDate(java.sql.Date.valueOf(formattedDate)); // 만기일 주입
		account.setPrimeRate(ecoChallenge.getPrimeRate()); // 우대이율 주입
		account.setPurpose(purpose); // 계좌 개설 목적 주입
		account.setBalance(5000); // 5000원 기본 세팅

		return account;
	}

}
