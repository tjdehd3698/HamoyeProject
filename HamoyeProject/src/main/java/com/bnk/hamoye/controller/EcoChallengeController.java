package com.bnk.hamoye.controller;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EcoChallengeController {
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;
	private final UserService userService;

	@GetMapping("challengeDetail.do")
	public String getChallengeDetail(String challengeType, String challengeId, Model model, HttpSession session) {

		String path = "index.jsp";

		try {

			if (challengeType.equals("eco")) {
				EcoChallenge ecoChallenge = ecoChallengeService.getEcoChallengeDetail(challengeId);
				model.addAttribute("ecoChallenge", ecoChallenge);
				ecoChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
				String content = ecoChallenge.getContent();
				String[] newContent = content.split("@@");
				model.addAttribute("newContent", newContent);
				path = "chl/MWPCHLV01M";
			} else if (challengeType.equals("trip")) {
				TripChallenge tripChallenge = tripChallengeService.getTripChallengeDetail(challengeId);
				model.addAttribute("tripChallenge", tripChallenge);
				tripChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
				String content = tripChallenge.getContent();
				String[] newContent = content.split("@@");
				model.addAttribute("newContent", newContent);

				String flag = "F";
				String userId = (String) session.getAttribute("user");
				model.addAttribute("existUser", userId);
				if (userId != null) {
					Participation participation = new Participation();
					participation.setUserId(userId);
					participation.setTripChallengeId(challengeId);
					int value = tripChallengeService.checkParticipationTripChallenge(participation);
					if (value > 0) {
						flag = "T";
					}

					model.addAttribute("flag", flag);
				}

				path = "chl/MWPCHLV04M";
			}
		} catch (Exception e) {
		}

		return path;
	}

	@GetMapping("challenge.do")
	public String getChallengeList(Model model) {
		try {
			List<EcoChallenge> ecoChallengeList = ecoChallengeService.getEcoChallengeList();
			List<TripChallenge> tripChallengeList = tripChallengeService.getTripChallengeList();

			model.addAttribute("ecoChallengeList", ecoChallengeList);
			model.addAttribute("tripChallengeList", tripChallengeList);

		} catch (Exception e) {

		}

		return "chl/MWPCHLV00M";

	}

	@PostMapping("clickChallenge.do")
	@ResponseBody
	public String getPoint(HttpSession session, String tripChallengeId, int rewardPoint, Model model) {
		String flag = "F";

		try {
			String userId = (String) session.getAttribute("user");
			Participation participation = new Participation();
			participation.setUserId(userId);
			participation.setTripChallengeId(tripChallengeId);

			tripChallengeService.participateTripChallenge(participation);
			tripChallengeService.addPoint(userId, rewardPoint); // 포인트 업뎃
			int value = tripChallengeService.checkParticipationTripChallenge(participation);

		} catch (Exception e) {
		}

		return "chl/MWPCHLV12M";
	}

	@PostMapping("joinChallenge.do")
	@ResponseBody
	public String getPoint(HttpSession session, String purpose,
			String incomeSource, String maturity, String ecoChallengeId) {
		String result = "F";

		try {
			String userId = (String) session.getAttribute("user");
			User user = userService.getUserInfo(userId);
			EcoChallenge ecoChallenge = ecoChallengeService.getEcoChallengeDetail(ecoChallengeId);
			
			Account account = new Account();
			Date now = new Date();
			
			Calendar cal = Calendar.getInstance(); 
			cal.setTime(now);
			String[] newMaturity = maturity.split("개");
		    cal.add(Calendar.MONTH, Integer.parseInt(newMaturity[0].trim()));
		    System.out.println(userService.getUserInfo(userId));
			
		    account.setIncomeSource(incomeSource);
			account.setMatureDate(cal.getTime());
			account.setPrimeRate(ecoChallenge.getPrimeRate());
			account.setPurpose(purpose);
			
			userService.joinAccount(account, userId, ecoChallengeId);
			int value = userService.joinEcoChallenge(user);
	
			System.out.println("==============");

			System.out.println(value);
			if (value > 0) {
				result = "T";
			}
		} catch (Exception e) {
		}

		return result;
	}

	@GetMapping("nextPage.do")
	public String nextPage(Model model) {
		//현재 날짜 구하기 (시스템 시계, 시스템 타임존) 
		LocalDate now = LocalDate.now(); // 현재 날짜  구하기(Paris)
		
		model.addAttribute("year", now.getYear());
		model.addAttribute("month",now.getMonthValue());
		model.addAttribute("day",now.getDayOfMonth());

		return "chl/MWPCHLV11M";
	}

}
