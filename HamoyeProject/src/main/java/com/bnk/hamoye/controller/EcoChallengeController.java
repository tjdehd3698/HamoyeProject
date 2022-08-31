package com.bnk.hamoye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.service.EcoChallengeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EcoChallengeController {
	private final EcoChallengeService ecoChallengeService;
	

	@GetMapping("challengeDetail.do")
	public String getChallengeDetail(String ecoChallengeId, Model model) {
		
		try {
//			EcoChallenge ecoChallenge = ecoChallengeService.getEcoChallengeDetail(ecoChallengeId);
			
			EcoChallenge ecoChallenge = new EcoChallenge();
			ecoChallenge.setEcoChallengeId("100");
			ecoChallenge.setEcoChallengeName("대중교통 이용");
			System.out.println(ecoChallenge);
			model.addAttribute("eco01", ecoChallenge);
		} catch (Exception e) {
		}
		
		return "chl/MWPCHLV01M";
	}
	
}
