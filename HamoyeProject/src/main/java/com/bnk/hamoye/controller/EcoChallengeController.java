package com.bnk.hamoye.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
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
import com.bnk.hamoye.domain.Coordinate;
import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.TodayRestaurant;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.RestaurantService;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EcoChallengeController {
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;
	private final UserService userService;
	private final RestaurantService restaurantService;

	@GetMapping("challengeDetail.do")
	public String getChallengeDetail(String challengeType, String challengeId, Model model, HttpSession session) {

		String path = "index.jsp";

		try {

			if (challengeType.equals("eco")) {

				EcoChallenge ecoChallenge = ecoChallengeService.getEcoChallengeDetail(challengeId);
				EcoChallenge ecoChallenge2 = ecoChallengeService.getEcoChallengeDetail(challengeId);
				List<EcoChallenge> list = new ArrayList<>();
				ecoChallenge2.setPrimeRate(ecoChallenge2.getPrimeRate());
				list.add(ecoChallenge);
				ecoChallenge.setPrimeRate(ecoChallenge.getPrimeRate() - 0.2);
				list.add(ecoChallenge2);
				model.addAttribute("ecoChallenge", ecoChallenge);
				model.addAttribute("list", list);
//				ecoChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
				String content = ecoChallenge.getContent();
				String[] newContent = content.split("@@");
				model.addAttribute("newContent", newContent);
				String userId = (String) session.getAttribute("user");
				if (userId != null) {
					User user = userService.getUserAllInfo(userId);

					if (user.getAccountNumber() != null) {
						model.addAttribute("checkJoinChallenge", "F");
					} else {
						model.addAttribute("checkJoinChallenge", "T");
					} 
				}
				path = "chl/MWPCHLV01M";

			} else if (challengeType.equals("trip")) {
				TripChallenge tripChallenge = tripChallengeService.getTripChallengeDetail(challengeId);
				model.addAttribute("tripChallenge", tripChallenge);

				String flag = "F";
				String userId = (String) session.getAttribute("user");
				model.addAttribute("existUser", userId);
				String tripChallengeType = tripChallenge.getTripChallengeType();

				if (tripChallengeType.charAt(0) == '5') {
//					tripChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
					String content = tripChallenge.getContent();
					String[] newContent = content.split("@@");
					model.addAttribute("newContent", newContent);
					if (userId != null) {
						Participation participation = new Participation();
						participation.setUserId(userId);
						participation.setTripChallengeId(challengeId);
						int value = tripChallengeService.checkParticipationTripChallenge(participation);
						if (value > 0) {
							flag = "T";
						}

						model.addAttribute("flag", flag);
						path = "chl/MWPCHLV04M";
					} else
						path = "chl/MWPCHLV04M";
				}
				if (tripChallengeType.charAt(0) == '3') {
//					tripChallenge.setContent("안녕하세요@@만나서 반갑습니다@@부산지역 이곳저곳 들리고 보상을 받으세요!");
					String content = tripChallenge.getContent();
					String[] newContent = content.split("@@");
					model.addAttribute("newContent", newContent);
					
					System.out.println(userId+" "+challengeId);
					
					if (userId != null) {
						Participation participation = new Participation();
						participation.setUserId(userId);
						participation.setTripChallengeId(challengeId);
						int value = tripChallengeService.checkParticipationTripChallenge(participation);
						if (value > 0) {
							flag = "T";
						}

						model.addAttribute("flag", flag);
						path = "chl/MWPCHLV04M";
					} else
						path = "chl/MWPCHLV04M";
					
					List<String> todayRetaurantsNameList = restaurantService.getTodayRetaurantsName();
					List<Coordinate> coordinateOfTodayRestaurantList = restaurantService
							.getCoordinateOfTodayRestaurants();
					List<Double> longitudeList = new ArrayList<>();
					List<Double> latitudeList = new ArrayList<>();

					for (Coordinate co : coordinateOfTodayRestaurantList) {
						longitudeList.add(co.getLongitude());
						latitudeList.add(co.getLatitude());
					}
					model.addAttribute("nameList", todayRetaurantsNameList);
					model.addAttribute("longitudeList", longitudeList);
					model.addAttribute("latitudeList", latitudeList);
					model.addAttribute("len", todayRetaurantsNameList.size());

				path = "chl/MWPCHLV03M";
				}

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
				System.out.println("hi");
				int value = tripChallengeService.checkParticipationTripChallenge(participation);
				if (value > 0) {
					flag = "T";
				}

		} catch (Exception e) {
		}

		return "chl/MWPCHLV12M";
	}

	@PostMapping("joinChallenge.do")
	@ResponseBody
	public String getPoint(HttpSession session, String purpose, String incomeSource, String maturity,
			String ecoChallengeId) {
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
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = simpleDateFormat.format(cal.getTime());
			account.setIncomeSource(incomeSource);
			account.setMatureDate(java.sql.Date.valueOf(formattedDate));
			account.setPrimeRate(ecoChallenge.getPrimeRate());
			account.setPurpose(purpose);
			int value = userService.joinAccount(account, userId, ecoChallengeId);

			if (value > 0) {
				result = "T";
			}
		} catch (Exception e) {
		}

		return result;
	}

	@GetMapping("nextPage.do")
	public String nextPage(Model model) {
		// 현재 날짜 구하기 (시스템 시계, 시스템 타임존)
		LocalDate now = LocalDate.now(); // 현재 날짜 구하기(Paris)

		model.addAttribute("year", now.getYear());
		model.addAttribute("month", now.getMonthValue());
		model.addAttribute("day", now.getDayOfMonth());

		return "chl/MWPCHLV11M";
	}

	@GetMapping("completeJoin.do")
	public String completeJoin(String ecoChallengeId, String accountNumber, HttpSession session, Model model) {
		User user = new User();
		try {
			user = userService.getUserAllInfo((String) session.getAttribute("user"));
			user.setEcoChallenge(ecoChallengeService.getEcoChallengeDetail(ecoChallengeId));
			user.setAccount(userService.getAccount(user.getUserId()));
		} catch (Exception e) {
		}
		model.addAttribute("joinedUser", user);
		return "chl/MWPCHLV12M";
	}

}
