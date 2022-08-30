package com.bnk.hamoye.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.AdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdminService adminService;
	
	@PostMapping("")
	@ResponseBody
	public String adminLogin(User user, HttpSession session) {
//		try {
//			
//			User findUser = adminService.login(user);
//			
//			if(findUser!=null){
//				session.setAttribute("user", findUser.getUserId());
//				session.setAttribute("userName", findUser.getUserName());
//				System.out.println("로그인 성공");
//				return "T";
//			} 
//			else return "F";
//			
//		} catch (SQLException e) {
//			System.out.println("login 에러 : "+ e.getMessage());
//		}
		return "";
	}
}
