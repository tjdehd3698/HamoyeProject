package com.bnk.hamoye.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HamoyeController {
	/**************************************************************
		Front Page Test
	 ***************************************************************/
	
	@RequestMapping("home.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("agree.do")
	public String agree() {
		return "cmn/MWPCMNV00M";
	}
	
	@RequestMapping("viewRegister.do")
	public String viewRegister() {
		return "cmn/MWPCMNV01M";
	}	
//	
//	@RequestMapping("adminTripRestaurantList.do")
//	public String adminTripRestaurantList() {
//		return "adm/ADMCHLV20M";
//	}	
	
	
//	@PostMapping("login.do")
//	@ResponseBody
//	public String getloginForm(String userId,Model model,HttpServletRequest request) {
//		System.out.println(userId);
//		model.addAttribute("result","T");
//		HttpSession session = request.getSession();
//		session.setAttribute("login", "T");
//		return "";
//	}


	/*
	 * @RequestMapping("challegeDetail.do") public String doChallege() { return
	 * "chl/MWPCHLV01M"; }
	 */
	
}
