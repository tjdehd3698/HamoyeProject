package com.bnk.hamoye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HamoyeController {

	@GetMapping("home.do")
	public String index() {
		return "index";
	}
	
//	@GetMapping("login.do")
//	public String getloginForm() {
//		return "login";
//	}
	
	@GetMapping("challege.do")
	public String doChallegeList() {
		return "MWPCHLV00M";
	}
	
	
}
