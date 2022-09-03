package com.bnk.hamoye.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;

	@PostMapping("register.do") // 회원가입
	public String registerUser(User user, Model model) {
		try {
			userService.registerUser(user);
			return "cmn/MWPCMNV03M";
		} catch (Exception e) {
			System.out.println("registerUser 에러 : " + e.getMessage());
			return "";
		}
	}

	@PostMapping("duplicateId.do") // 아이디 중복 확인
	@ResponseBody
	public String duplicateId(User user, Model model) {
		boolean result;
		try {
			result = userService.duplicateId(user);
			if (result)
				return "F";
			else
				return "T";
		} catch (Exception e) {
			System.out.println("duplicateId 에러 : " + e.getMessage());
		}
		return "";
	}

	@PostMapping("login.do") // 로그인
	@ResponseBody
	public String login(User user, HttpSession session) {
		try {
			User findUser = userService.login(user);

			if (findUser != null) {
				session.setAttribute("user", findUser.getUserId());
				session.setAttribute("userName", findUser.getUserName());
				System.out.println("로그인 성공");
				return "T";
			} else
				return "F";

		} catch (Exception e) {
			System.out.println("login 에러 : " + e.getMessage());
		}
		return "";
	}

	@RequestMapping("logout.do") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@GetMapping("getUserAllInfo.do")
	public String getUserAllInfo(HttpSession session, String challengeId, Model model) throws Exception {
		try {
			User user = userService.getUserAllInfo((String) session.getAttribute("user"));
			String birthday = user.getBirthday();
			String year = birthday.substring(0, 4);
			String month = birthday.substring(4, 6);
			String day = birthday.substring(6, 8);
			String newBirthDay = year + "-" + month + "-" + day;
			user.setBirthday(newBirthDay);

			List<String> tempType = ecoChallengeService.getEcoChallengeType();

			HashMap<String, String> ecoChallengeMap = new HashMap<>();
			
			for (String str : tempType) {
				if(str.equals("1001")) {
					ecoChallengeMap.put(str, "대중교통");
				}else if(str.equals("1002")) {
					ecoChallengeMap.put(str, "환경 봉사");
				}
			}

			model.addAttribute("ecoChallengeMap", ecoChallengeMap);
			model.addAttribute("ecoChallengeId", challengeId);

			if (user.getGender().equals("m")) {
				user.setGender("남자");
			} else {
				user.setGender("여자");
			}
			model.addAttribute("result", user);

		} catch (Exception e) {
			System.out.println("getUserAllInfo 에러 : " + e.getMessage());
		}
		return "chl/MWPCHLV10M";
	}

//	@PostMapping()
//	public String joinAccount(Account account,String ecoChallengeId, HttpSession session) {
//		try {
//			userService.joinAccount(account, (String)session.getAttribute("user"), ecoChallengeId);
//		} catch (SQLException e) { 
//			System.out.println("joinAccount 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
//	
//	@GetMapping()
//	public String findPassword(User user, Model model) {
//		try {
//			String findPassword = userService.findPassword(user);
//			if(findPassword!=null) model.addAttribute("result", findPassword);
//			else model.addAttribute("result", "F");
//		} catch (SQLException e) {
//			System.out.println("findPassword 에러 : "+ e.getMessage());
//		}
//		return "";
//	}

//	@GetMapping()
//	public String checkEcoChallenge(HttpSession session, Model model) {
//		try {
//			String findId = userService.checkEcoChallenge((String)session.getAttribute("user"));
//
//		} catch (SQLException e) {
//			System.out.println("checkEcoChallenge 에러 : "+ e.getMessage());
//		}
//		return "";
//	}	
//	
//	@PostMapping()
//	public String joinAccount(Account account, String userId, String ecoChallengeId) {
//		
//		return "";
//	}

}
