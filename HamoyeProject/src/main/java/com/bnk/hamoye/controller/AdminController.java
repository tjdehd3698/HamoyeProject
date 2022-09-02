package com.bnk.hamoye.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripChallenge;
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

	@PostMapping("adminLogin.do") //관리자 로그인
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
	
	@RequestMapping("adminIndex.do") //관리자 메인 화면 데이터 조회
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
			
			//지구를 떠나요 챌린지 별 참여자 수  pie chart 데이터 
			Map<String, Double> pieCharData = adminService.getUserCntByEcoChallengeType(totalUserCnt);
			model.addAttribute("userCntByEcoChallengeType", pieCharData);
			
		} catch (Exception e) {
			System.out.println("adminIndex 에러 : "+ e.getMessage());
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
			System.out.println("getUserInfoByAdmin 에러 : "+ e);
		}
		return "adm/ADMUSRV01M";
	}

	@GetMapping("adminEcoChallengeList.do") //관리자 화면 ecoChallenge리스트 조회
	public String adminEcoChallengeList(Model model) {
		try {
			model.addAttribute("ecoChallengeList", ecoChallengeService.getEcoChallengeList());
			
			//챌린지 별 참여자 수 
			model.addAttribute("userCount", adminService.getUserCntByEcoChallenge());
		} catch (Exception e) {
			System.out.println("adminEcoChallengeList 에러 : "+ e.getMessage());
		}
		return "adm/ADMCHLV00M";
	}
	
	@GetMapping("adminEcoChallengeDetail.do") //ecoChallenge 상세 페이지 정보 조회
	public String adminEcoChallengeDetail(Model model, String ecoChallengeId) {
		try {
			EcoChallenge e = ecoChallengeService.getEcoChallengeDetail(ecoChallengeId);
			model.addAttribute("ecoChallenge", e);
			
			//해당 EcoChallenge 참가 인원 조회
			int cnt = adminService.getUserCntByEcoChallengeById(ecoChallengeId);
			model.addAttribute("userCnt", cnt);
			
		} catch (Exception e) {
			System.out.println("adminEcoChallengeDetail 에러 : "+ e.getMessage());
		}
		return "adm/ADMCHLV01M";
	}

	@GetMapping("adminTripChallengeList.do") //관리자 화면 tripChallenge리스트 조회
	public String adminTripChallengeList(Model model) {
		try {
			model.addAttribute("tripChallengeList", tripChallengeService.getTripChallengeListByAdmin());
			//챌린지 별 참여자 수
			model.addAttribute("userCount", adminService.getUSerCntByTripChallenge());
		} catch (Exception e) {
			System.out.println("adminTripChallengeList 에러 : "+ e.getMessage());
		}
		return "adm/ADMCHLV10M";
	}
	
	@GetMapping("adminTripChallengeDetail.do") //tripChallenge 상세 페이지 정보 조회
	public String adminTripChallengeDetail(Model model, String tripChallengeId) {
		try {
			TripChallenge t = tripChallengeService.getTripChallengeDetail(tripChallengeId);
			model.addAttribute("tripChallenge", t);
			
			//해당 tripChallenge 참가 인원 조회
			int cnt = adminService.getUSerCntByTripChallengeById(tripChallengeId);
			model.addAttribute("userCnt", cnt);
			
		} catch (Exception e) {
			System.out.println("adminTripChallengeDetail 에러 : "+ e.getMessage());
		}
		return "adm/ADMCHLV11M";
	}
	
	@PostMapping("updateEcoChallenge.do") //ecoChallenge 수정(사진 업로드)
	public String updateEcoChallenge(EcoChallenge ecoChallenge, MultipartFile img1, MultipartFile img2,  MultipartFile img3) {
		try {
			String ecoChallengeImge = ""; //이미지 경로 담을 변수
			if(img1!=null) {
				File file1 = new File("eco\\"+ecoChallenge.getEcoChallengeId()+"\\"+img1.getOriginalFilename());
				ecoChallengeImge+= (img1.getOriginalFilename()+"@@");
				img1.transferTo(file1);
			}
			if(img2!=null) {
				File file2 = new File("eco\\"+ecoChallenge.getEcoChallengeId()+"\\"+img2.getOriginalFilename());
				ecoChallengeImge+= (img2.getOriginalFilename()+"@@");
				img2.transferTo(file2);
			}
			if(img3!=null) {
				File file3 = new File("eco\\"+ecoChallenge.getEcoChallengeId()+"\\"+img3.getOriginalFilename());
				ecoChallengeImge+= (img3.getOriginalFilename()+"@@");
				img3.transferTo(file3);
			}
			
			ecoChallenge.setChallengeImage(ecoChallengeImge);			
			
			ecoChallengeService.updateEcoChallenge(ecoChallenge);
		} catch (Exception e) {
			System.out.println("updateEcoChallenge 에러 : "+ e.getMessage());
		}
		return "";
	}
	
	@PostMapping("updateTripChallenge.do") //tripChallenge 수정
	public String updateTripChallenge(TripChallenge tripChallenge) {
		try {
			tripChallengeService.updateTripChallenge(tripChallenge);
		} catch (Exception e) {
			System.out.println("updateTripChallenge 에러 : "+ e.getMessage());
		}
		return "";
	}
}
