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
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.AdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdminService adminService;
	
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
	
	@GetMapping("getAllUser.do")
	public String getAllUser(Model model) {
		try {
			List<User> list = adminService.getAllUser();
			model.addAttribute("result",list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	@GetMapping("getAdminPageInfo.do")
	public String getAdminPageInfo(Model model) {
		try {
			int totalUserCnt = adminService.getAllUser().size();
			int totalAccountCnt = adminService.getAllAcountCnt();
			List<Status> ecoList = adminService.getAllEcoChallenge();
			int userIncrement = adminService.getUserCntByDate();
			int accountIncrement = adminService.getAccountCntByDate();
			int accountBalanceSum = adminService.getBalanceSum();
			int pointSum = adminService.getPointSum();
			List<TripStatus> tripList = adminService.getAllTripChallenge();
			Map<String, Integer> challengeDateCnt = adminService.getTripChallengeCntByMonth();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";	
	}
}
