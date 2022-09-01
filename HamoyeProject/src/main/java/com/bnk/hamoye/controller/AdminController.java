package com.bnk.hamoye.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripStatus;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.AdminService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdminService adminService;
	private final UserService userService;
	
	@RequestMapping("admin.do")
	public String adminLoginPage() {
		return "adm/ADMCMNV00M";
	}

	@PostMapping("adminLogin.do")
	@ResponseBody
	public String adminLogin(User user, HttpSession session) {
		try {
			User findUser = adminService.adminLogin(user);
			
			if(findUser!=null){
				session.setAttribute("user", findUser.getUserId());
				System.out.println("로그인 성공");
				return "T";
			} 
			else return "F";
			
		} catch (SQLException e) {
			System.out.println("login 에러 : "+ e.getMessage());
		}
		return "";
	}
	
	@RequestMapping("adminLogout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "adm/ADMCMNV00M";
	}
	
	@RequestMapping("adminIndex.do")
	public String adminIndex() {
		return "adm/ADMCMNV01M";
	}
	
	@RequestMapping("adminUser.do")
	public String adminUserPage() {
		return "adm/ADMUSRV00M";
	}
	
	@PostMapping("adminUpdateUser.do")
	public String adminUpdateUser(User user) {
		try {
			userService.updateUser(user);
		} catch (SQLException e) {
			System.out.println("updateUser 에러 : "+ e.getMessage());
		}
		return "mpg/MWPMPGV01M";
	}
	
	@GetMapping("adminGetAllUser.do")
	public String adminGetAllUser(Model model) {
		try {
			List<User> list = adminService.getAllUser();
			model.addAttribute("result",list);
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "adm/ADMUSRV00M";
	}
	
	@GetMapping("adminGetUser.do")
	public String getUserInfo(Model model, String userId) {
		System.out.println("==================="+userId);
		try {
			User user = userService.getUserInfo(userId);
			model.addAttribute("result", user);
			System.out.println(user);
		} catch (SQLException e) {
			System.out.println("getUserInfo 에러 : "+ e.getMessage());
		}
		return "adm/ADMUSRV01M";
	}
	
	@GetMapping("getAdminPageInfo.do")
	public String getAdminPageInfo(Model model) {
		try {
			int totalUserCnt = adminService.getAllUser().size();
			model.addAttribute("totalUserCnt", totalUserCnt);
			int totalAccountCnt = adminService.getAllAcountCnt();
			model.addAttribute("totalAccountCnt", totalAccountCnt);
			List<Status> ecoList = adminService.getAllEcoChallenge();
			model.addAttribute("ecoList", ecoList);
			int userIncrement = adminService.getUserCntByDate();
			model.addAttribute("userIncrement", userIncrement);
			int accountIncrement = adminService.getAccountCntByDate();
			model.addAttribute("accountIncrement", accountIncrement);
			int accountBalanceSum = adminService.getBalanceSum();
			model.addAttribute("accountBalanceSum", accountBalanceSum);
			int pointSum = adminService.getPointSum();
			model.addAttribute("pointSum", pointSum);
			List<TripStatus> tripList = adminService.getAllTripChallenge();
			model.addAttribute("tripList", tripList);
			Map<String, Integer> challengeDateCnt = adminService.getTripChallengeCntByMonth();
			model.addAttribute("challengeDateCnt", challengeDateCnt);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";	
	}

	@RequestMapping("adminChallenge.do")
	public String adminChallengePage() {
		return "adm/ADMCHLV00M";
	}
	
}
