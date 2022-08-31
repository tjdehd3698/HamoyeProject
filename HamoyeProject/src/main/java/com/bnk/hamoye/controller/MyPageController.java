package com.bnk.hamoye.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {
	private final UserService userService;
	
//	@PostMapping()
//	public String updateUser(User user) {
//		try {
//			userService.updateUser(user);
//		} catch (SQLException e) {
//			System.out.println("updateUser 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
//	
//	@GetMapping()
//	public String getUserInfo(Model model, HttpSession session) {
//		try {
//			User user = userService.getUserInfo((String)session.getAttribute("user"));
//			model.addAttribute("result", user);
//		} catch (SQLException e) {
//			System.out.println("getUserInfo 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
	
//	@PostMapping()
//	public String withdraw(HttpSession session) {
//		try {
//			userService.withdrawUser((String)session.getAttribute("user"));
//		} catch (SQLException e) {
//			System.out.println("withdraw 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
	@GetMapping("mypage.do")
	public String getMyPageInfo(HttpSession session, Model model) {
		try {
			
			User user = userService.getMypageInfo((String)session.getAttribute("user"));
			//System.out.println(user.getEcoChallenge().getEcoChallengeId());
			model.addAttribute("result", user);
			
			if(user.getEcoChallenge().getEcoChallengeId()==null) {
				model.addAttribute("totalCnt", null);
				model.addAttribute("successCnt", null);
			}
			else {
				List<User> userList = userService.getUserByEcoChallenge(user.getEcoChallenge().getEcoChallengeId());
				model.addAttribute("totalCnt", userList.size());
				
				int successCnt = 0;
		        for(User u : userList) {
		           if(u.getParticipationCount()>=user.getEcoChallenge().getTotalCount())
		               successCnt++;
		        }
		        model.addAttribute("successCnt", successCnt);
			}
	        
		} catch (SQLException e) {
			System.out.println("getMyPageInfo 에러 : "+ e.getMessage());
		}
		
		return "mpg/MWPMPGV00M";
	}
	
//	@PostMapping()
//	public String changePoint(HttpSession session, int amount) {
//		try {
//			userService.changePoint((String)session.getAttribute("user"), amount);
//		} catch (SQLException e) {
//			System.out.println("changePoint 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
//	@PostMapping()
//	public String expireAccount(HttpSession session) {
//		try {
//			userService.expireAccount((String)session.getAttribute("user"));
//		} catch (SQLException e) {
//			System.out.println("expireAccount 에러 : "+ e.getMessage());
//		}
//		return "";
//	}
	
//	@GetMapping()
//	public String getParticipateChallenge(HttpSession session,Model model) {
//		try {
//			List<Participation>list = userService.getParticipateChalleng((String)session.getAttribute("user"));
//			model.addAttribute("result", list);
//		} catch (SQLException e) {
//			
//		}
//		return "";
//	}
	
	
}
