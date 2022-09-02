package com.bnk.hamoye.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EcoChallengeController {
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;
	private final UserService userService;

	@GetMapping("challengeDetail.do")
	public String getChallengeDetail(String challengeType, String challengeId, Model model,HttpSession session) {
		
		String path = "index.jsp";
		
		try {
			
			if (challengeType.equals("eco")) {
				EcoChallenge ecoChallenge = ecoChallengeService.getEcoChallengeDetail(challengeId);
				model.addAttribute("ecoChallenge", ecoChallenge);
				ecoChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
				String content = ecoChallenge.getContent();
				String[] newContent = content.split("@@");
				model.addAttribute("newContent", newContent);
				path = "chl/MWPCHLV01M";
			} 
			else if (challengeType.equals("trip")) {
				TripChallenge tripChallenge = tripChallengeService.getTripChallengeDetail(challengeId);
				model.addAttribute("tripChallenge", tripChallenge);
				tripChallenge.setContent("안녕하세요@@만나서 반갑습니다@@쓰레기를 주우면 보상을 드려요!");
				String content = tripChallenge.getContent();
				String[] newContent = content.split("@@");
				model.addAttribute("newContent", newContent);
				
				String flag = "F";
				String userId = (String)session.getAttribute("user");
				Participation participation = new Participation();
				participation.setUserId(userId);
				participation.setTripChallengeId(challengeId);
				int value = tripChallengeService.checkParticipationTripChallenge(participation);
				System.out.println("hi");
				if(value>0) {
					flag="T";
				}
				model.addAttribute("flag", flag);
				
				path = "chl/MWPCHLV04M";
			}
		} catch (Exception e) {
		}

		return path;
	}

	@GetMapping("challenge.do")
	public String getChallengeList(Model model) {

		try {
			List<EcoChallenge> ecoChallengeList = ecoChallengeService.getEcoChallengeList();
			List<TripChallenge> tripChallengeList = tripChallengeService.getTripChallengeList();

			model.addAttribute("ecoChallengeList", ecoChallengeList);
			model.addAttribute("tripChallengeList", tripChallengeList);
		} catch (Exception e) {

		}

		return "chl/MWPCHLV00M";

	}
	
	@PostMapping("clickChallenge.do")
	@ResponseBody
	public String getPoint(HttpSession session, String tripChallengeId, int rewardPoint, Model model) {
		String flag = "T";
		
		try {
			String userId = (String)session.getAttribute("user");
			Participation participation = new Participation();
			participation.setUserId(userId);
			participation.setTripChallengeId(tripChallengeId);
			
			tripChallengeService.participateTripChallenge(participation);
			tripChallengeService.addPoint(userId, rewardPoint); //포인트 업뎃
			int value = tripChallengeService.checkParticipationTripChallenge(participation);
			
			if(value>0) {
				flag="F";
			}
		}
		catch(Exception e) {
		}
		
		return flag;
	}
	
	@GetMapping("nextPage.do")
	public String nextPage(){
		return "chl/MWPCHLV11M";
	}
	
	
}
