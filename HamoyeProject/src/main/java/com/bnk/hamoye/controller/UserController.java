package com.bnk.hamoye.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.Account;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	
	
//	@PostMapping("")
//	public String registerUser(User user, Model model) {
//		try {
//			userService.registerUser(user);
//		} catch (SQLException e) {
//			System.out.println("registerUser 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
//	@GetMapping()
//	@ResponseBody
//	public String duplicateId(@RequestParam User user,Model model) {
//		boolean result;
//		try {
//			result = userService.duplicateId(user);
//			model.addAttribute("result", result);
//		} catch (SQLException e) {
//			System.out.println("duplicateId 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
	@PostMapping("login.do")
	@ResponseBody
	public String login(User user, HttpSession session) {
		try {
			User findUser = userService.login(user);
			
			if(findUser!=null){
				session.setAttribute("user", findUser.getUserId());
				session.setAttribute("userName", findUser.getUserName());
				System.out.println("로그인 성공");
				return "T";
			} 
			else return "F";
			
		} catch (SQLException e) {
			System.out.println("login 에러 : "+ e.getMessage());
		}
		return "";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
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
//	public String checkEcoChallenge(Model model,HttpSession session) {
//		try {
//			String findId = userService.checkEcoChallenge((String)session.getAttribute("user"));
//			if(findId == null) {
//				model.addAttribute("result", "T");
//			}
//			else {
//				model.addAttribute("result", "F");
//			}
//		} catch (SQLException e) {
//			System.out.println("checkEcoChallenge 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
	
//	@PostMapping()
//	public String joinAccount(Account account, HttpSession session, String ecoChallengeId ) {
//		try {
//			userService.joinAccount(account, (String)session.getAttribute("user"), ecoChallengeId);
//		} catch (SQLException e) {
//			System.out.println("joinAccount 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
	
	
}
