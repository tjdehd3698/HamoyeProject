package com.bnk.hamoye.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.TripChallengeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EcoChallengeController {
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;

	@GetMapping("challengeDetail.do/ecoChallengeId")
	public String getChallengeDetail(@PathVariable String ecoChallengeId, Model model) {
		
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
	
<<<<<<< HEAD
	@GetMapping("challenge.do")
	public String getChallengeList(Model model) {
		
		try {
			List<EcoChallenge> ecoChallengeList = ecoChallengeService.getEcoChallengeList();
			List<TripChallenge> tripChallengeList = tripChallengeService.getTripChallengeList();
			
			model.addAttribute("ecoChallengeList", ecoChallengeList);
			model.addAttribute("tripChallengeList", tripChallengeList);
		}catch(Exception e) {
			
		}
		
		return "chl/MWPCHLV00M";
		
	}
	
=======
	@GetMapping("challnge.do") 
    public String getChallengeList(Model model) {

        System.out.println("#%(#%(#%");
      try {
          List<EcoChallenge> ecoChallengeList = ecoChallengeService.getEcoChallengeList();
          System.out.println(ecoChallengeList);
          for(EcoChallenge eco : ecoChallengeList) {
              System.out.println(eco);
          }
              model.addAttribute("ecoChallengeList", ecoChallengeList);
      } catch (Exception e) {
      }
          return "chl/MWPCHLV00M";
    }
>>>>>>> branch 'main_test' of https://github.com/tjdehd3698/HamoyeProject
}
