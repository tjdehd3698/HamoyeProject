package com.bnk.hamoye.controller;

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
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final EcoChallengeService ecoChallengeService;

	@PostMapping("register.do") // 회원가입
	public String registerUser(User user, Model model) {
		try {
			userService.registerUser(user);
			return "cmn/MWPCMNV02M";
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
	public String getUserAllInfo(HttpSession session, String ecoChallengeId, Model model) throws Exception {
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
				if (str.equals("1001")) {
					ecoChallengeMap.put(str, "대중교통");
				} else if (str.equals("1002")) {
					ecoChallengeMap.put(str, "환경 봉사");
				}
			}

			model.addAttribute("ecoChallengeMap", ecoChallengeMap);
			model.addAttribute("ecoChallengeId", ecoChallengeId);

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

	@RequestMapping("findPasswordPage.do")
	public String findPasswordPage(User user, Model model) {
		return "cmn/MWPCMNV03M";
	}

	@PostMapping("findPassword.do")
	public String findPassword(User user, Model model) {
		String result = "cmn/MWPCMNV03M";
		try {
			String findPassword = userService.findPassword(user);

			if (findPassword != null) {
				result = "cmn/MWPCMNV04M";
				model.addAttribute("result", findPassword);
			}
		} catch (Exception e) {
			System.out.println("findPassword 에러 : " + e.getMessage());
		}
		return result;
	}

}
