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
import com.bnk.hamoye.service.EcoChallengeService;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdminService adminService;
	private final UserService userService;
	private final EcoChallengeService ecoChallengeService;
	private final TripChallengeService tripChallengeService;
	
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
	public String adminIndex(Model model) {
		try {
			//전체 회원 수 조회
			int totalUserCnt = adminService.getAllUser().size();
			model.addAttribute("totalUserCnt", totalUserCnt);
			
			//전체 계좌 수 조회
			int totalAccountCnt = adminService.getAllAcountCnt();
			model.addAttribute("totalAccountCnt", totalAccountCnt);
			
			//모든 지구를 떠나요 통계 조회
			List<Status> ecoList = adminService.getAllEcoChallenge();
			model.addAttribute("ecoList", ecoList);
			
			//오늘 회원 수 증가 조회
			int userIncrement = adminService.getUserCntByDate();
			model.addAttribute("userIncrement", userIncrement);
			
			//오늘 계좌 수 증가 조회
			int accountIncrement = adminService.getAccountCntByDate();
			model.addAttribute("accountIncrement", accountIncrement);
			
			//전체 계좌 금액 조회
			int accountBalanceSum = adminService.getBalanceSum();
			model.addAttribute("accountBalanceSum", accountBalanceSum);
			
			//전체 포인트 금액 조회
			int pointSum = adminService.getPointSum();
			model.addAttribute("pointSum", pointSum);
			
			//부산으로 떠나요 챌린지 통계 조회
			List<TripStatus> tripList = adminService.getAllTripChallenge();
			model.addAttribute("tripList", tripList);
			
			//부산을 떠나요 챌린지 최근 12개월 증가량 조회
			Map<String, Integer> challengeDateCnt = adminService.getTripChallengeCntByMonth();
			model.addAttribute("challengeDateCnt", challengeDateCnt);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "adm/ADMCMNV01M";
	}
	
	@RequestMapping("adminUser.do")
	public String adminUserPage() {
		return "adm/ADMUSRV00M";
	}
	
	@PostMapping("adminUpdateUser.do")
	@ResponseBody
	public String adminUpdateUser(User user) {
		String flag = "F";
		try {
			int row = adminService.updateUserByAdmin(user);
			System.out.println(row);
			if(row>0) flag="T";
		} catch (Exception e) {
			System.out.println("adminUpdateUser 에러 : "+ e.getMessage());
		}
		return flag;
	}
	
	@GetMapping("adminGetAllUser.do")
	public String adminGetAllUser(Model model) {
		try {
			List<User> list = adminService.getAllUser();
			model.addAttribute("result",list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "adm/ADMUSRV00M";
	}
	
	@GetMapping("adminGetUser.do")
	public String getUserInfoByAdmin(Model model, String userId) {
		try {
			User user = adminService.getUserInfoByAdmin(userId);
			model.addAttribute("result", user);
		} catch (Exception e) {
			System.out.println("getUserInfoByAdmin 에러 : "+ e.getMessage());
		}
		return "adm/ADMUSRV01M";
	}

	@RequestMapping("adminChallenge.do")
	public String adminChallengePage() {
		return "adm/ADMCHLV00M";
	}
	
	@GetMapping("adminEcoChallengeList.do")
	public String adminEcoChallengeList(Model model) {
		try {
			model.addAttribute("ecoChallengeList", ecoChallengeService.getEcoChallengeList());
			model.addAttribute("userCount", adminService.getUserCntByEcoChallenge());
		} catch (Exception e) {
			System.out.println("adminEcoChallengeList 에러 : "+ e.getMessage());
		}
		return "";
	}

	@GetMapping("adminTripChallengeList.do")
	public String adminTripChallengeList(Model model) {
		try {
			model.addAttribute("tripChallengeList", tripChallengeService.getTripChallengeListByAdmin());
			model.addAttribute("userCount", adminService.getUSerCntByTripChallenge());
		} catch (Exception e) {
			System.out.println("adminTripChallengeList 에러 : "+ e.getMessage());
		}
		return "";
	}
	
}
