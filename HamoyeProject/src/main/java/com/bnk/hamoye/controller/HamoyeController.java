package com.bnk.hamoye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
