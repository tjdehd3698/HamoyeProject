package com.bnk.hamoye.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDateTime;
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
			
		} catch (Exception e) {
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
		String result = "F";
		try {
			int row = adminService.updateUserByAdmin(user);
			System.out.println(row);
			if(row>0) result="T";
		} catch (Exception e) {
			System.out.println("adminUpdateUser 에러 : "+ e.getMessage());
		}
		
		return result;
	}
	
	@GetMapping("adminGetAllUser.do")
	public String adminGetAllUser(Model model) {
		try {
			List<User> list = adminService.getAllUser();
			model.addAttribute("result",list);
		} catch (Exception e) {
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
	
	@RequestMapping("registerEcoChallengePage.do")
	public String registerEcoChallengePage() {
		return "adm/ADMCHLV02M";
	}
	
	@PostMapping("registerEcoChallenge.do") //ecoChallenge 등록(사진 업로드)
	@ResponseBody
	public String registerEcoChallenge(EcoChallenge ecoChallenge, MultipartFile img1, MultipartFile img2,  MultipartFile img3) {
		String result = "F";
		try {
			String imgTmp = LocalDateTime.now().getSecond()+""; //이미지 이름 중복 방지 문구
			String ecoChallengeImge = ""; //이미지 경로 담을 변수
			
			//챌린지 등록
			int row = ecoChallengeService.updateEcoChallenge(ecoChallenge);
			
			//사진 저장할 위치
			String path = "/img/eco/"+ecoChallenge.getEcoChallengeId();
			
			//원래 있던 사진 삭제
			File file = new File("./src/main/webapp"+path);
			if(!file.exists()) {
				file.mkdirs();
			}
			else{
				for(File f :file.listFiles()){
					f.delete();
				}
			}
			
			if(!img1.isEmpty()) {
				File file1 = new File(path,imgTmp+img1.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+img1.getOriginalFilename()+"||");
				if (!file1.exists()) {
					file1.mkdirs();
                }
				img1.transferTo(file1);
			}
			else {
				ecoChallengeImge+="||";
			}
			
			if(!img2.isEmpty()) {
				File file2 = new File(path,imgTmp+1+img2.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+1+img2.getOriginalFilename()+"||");
				if (!file2.exists()) {
					file2.mkdirs();
                }
				img2.transferTo(file2);
			}
			else {
				ecoChallengeImge+="||";
			}
			
			if(!img3.isEmpty()) {
				File file3 = new File(path,imgTmp+img3.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+2+img3.getOriginalFilename()+"||");
				if (!file3.exists()) {
					file3.mkdirs();
                }
				img3.transferTo(file3);
			}
			else {
				ecoChallengeImge+="||";
			}
			
			if(!ecoChallengeImge.equals("")) { //사진이 있으면 
				ecoChallenge.setChallengeImage(ecoChallengeImge);
				adminService.updateEcoChallengeImage(ecoChallenge);
			}
			
			if(row==1)
				result="T"; //정상적인 추가면 result = T
		} catch (Exception e) {
			System.out.println("updateEcoChallenge 에러 : "+ e.getMessage());
		}
		return result;
	}
	
	@PostMapping("updateEcoChallenge.do") //ecoChallenge 수정(사진 업로드)
	@ResponseBody
	public String updateEcoChallenge(EcoChallenge ecoChallenge, MultipartFile img1, MultipartFile img2,  MultipartFile img3) {
		String result = "F";
		try {
			String imgTmp = LocalDateTime.now().getSecond()+""; //이미지 이름 중복 방지 문구
			String ecoChallengeImge = ""; //이미지 경로 담을 변수
			String path = "/img/eco/"+ecoChallenge.getEcoChallengeId();
			
			//원래 사진 경로 split리스트
			String[] splitImage = ecoChallenge.getChallengeImage().split("\\|\\|");
			
			//원래 있던 사진 삭제, 폴더 추가
			File file = new File("./src/main/webapp"+path);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			if(!img1.isEmpty()) {
				File file1 = new File(path, imgTmp+img1.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+img1.getOriginalFilename()+"||");
				if (!file1.exists()) {
					file1.mkdirs();
                }
				img1.transferTo(file1);
			}
			else{
				ecoChallengeImge+= (splitImage[0]+"||");
			}
			
			if(!img2.isEmpty()) {
				File file2 = new File(path,imgTmp+1+img2.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+1+img2.getOriginalFilename()+"||");
				if (!file2.exists()) {
					file2.mkdirs();
                }
				img2.transferTo(file2);
			}
			else { 
				ecoChallengeImge+= (splitImage[1]+"||");
			}
			
			if(!img3.isEmpty()) {
				File file3 = new File(path,imgTmp+2+img3.getOriginalFilename());
				ecoChallengeImge+= (imgTmp+2+img3.getOriginalFilename()+"||");
				if (!file3.exists()) {
					file3.mkdirs();
                }
				img3.transferTo(file3);
			}
			else {
				ecoChallengeImge+= (splitImage[2]+"||");
			}
			
			System.out.println(ecoChallengeImge);
			ecoChallenge.setChallengeImage(ecoChallengeImge);	
			
			ecoChallengeService.updateEcoChallenge(ecoChallenge);
			result="T";
			
		} catch (Exception e) {
			System.out.println("updateEcoChallenge 에러 : "+ e);
		}
		return result;
	}
	
	@PostMapping("registerTripChallenge.do") //tripChallenge 등록
	@ResponseBody
	public String registerTripChallenge(TripChallenge tripChallenge,MultipartFile img1, MultipartFile img2, MultipartFile img3) {
		String result = "F";
		try {
			String tripChallengeImge = ""; //이미지 경로 담을 변수
			String imgTmp = LocalDateTime.now().getSecond()+""; //이미지 이름 중복 방지 문구
			
			int row = tripChallengeService.updateTripChallenge(tripChallenge);
			
			String path = "/img/trip/"+tripChallenge.getTripChallengeId();
			
			//원래 있던 사진 삭제, 폴더 추가
			File file = new File("./src/main/webapp"+path);
			if(!file.exists()) {
				file.mkdirs();
			}
			else{
				for(File f :file.listFiles()){
					f.delete();
				}
			}

			
			if(!img1.isEmpty()) {					
				File file1 = new File(path, imgTmp+img1.getOriginalFilename());
				tripChallengeImge+= (imgTmp+img1.getOriginalFilename()+"||");
			
				if (!file1.exists()) {
					file1.mkdirs();
                }
				img1.transferTo(file1);
			}
			else {
				tripChallengeImge+="||";
			}
			
			if(!img2.isEmpty()) {
				File file2 = new File(path, imgTmp+1+img2.getOriginalFilename());
				tripChallengeImge+= (imgTmp+1+img2.getOriginalFilename()+"||");

				if (!file2.exists()) {
					file2.mkdirs();
                }
				img2.transferTo(file2);
			}
			else {
				tripChallengeImge+="||";
			}
			
			if(!img3.isEmpty()) {
				File file3 = new File(path, imgTmp+2+img3.getOriginalFilename());
				tripChallengeImge+= (imgTmp+2+img3.getOriginalFilename()+"||");

				if (!file3.exists()) {
					file3.mkdirs();
                }
				
				img3.transferTo(file3);
			}
			else {
				tripChallengeImge+="||";
			}
			
			if(!tripChallengeImge.equals("")) {
				//변경된 사진 경로 set
				tripChallenge.setChallengeImage(tripChallengeImge);
				adminService.updateTripChallengeImage(tripChallenge);
			}
			
			if(row==1)
				result="T";
		} catch (Exception e) {
			System.out.println("updateTripChallenge 에러 : "+ e.getMessage());
		}
		return result;
	}
	
	@PostMapping("updateTripChallenge.do") //tripChallenge 수정
	@ResponseBody
	public String updateTripChallenge(TripChallenge tripChallenge,MultipartFile img1, MultipartFile img2, MultipartFile img3) {
		String result = "F";
		try {
			if(tripChallenge.getChallengeImage()==null) { //사진이 변경될때에만 
				String tripChallengeImge = ""; //이미지 경로 담을 변수
				String imgTmp = LocalDateTime.now().getSecond()+""; //이미지 이름 중복 방지 문구 
				String[] splitImage = tripChallenge.getChallengeImage().split("\\|\\|"); //원래 사진 경로 split리스트
				
				String path = "/img/trip/"+tripChallenge.getTripChallengeId();
				
				//원래 있던 사진 삭제, 폴더 추가
				File file = new File("./src/main/webapp"+path);
				if(!file.exists()) {
					file.mkdirs();
				}
				
				if(!img1.isEmpty()) {					
					File file1 = new File(path, imgTmp+img1.getOriginalFilename());
					tripChallengeImge+= (imgTmp+img1.getOriginalFilename()+"||");
				
					if (!file1.exists()) {
						file1.mkdirs();
	                }
					img1.transferTo(file1);
				}else{
					tripChallengeImge+= (splitImage[0]+"||");
				}				
				
				if(!img2.isEmpty()) {
					File file2 = new File(path, imgTmp+1+img2.getOriginalFilename());
					tripChallengeImge+= (imgTmp+1+img2.getOriginalFilename()+"||");

					if (!file2.exists()) {
						file2.mkdirs();
	                }
					img2.transferTo(file2);
				}else{
					tripChallengeImge+= (splitImage[1]+"||");
				}
				
				if(!img3.isEmpty()) {
					File file3 = new File(path, imgTmp+2+img3.getOriginalFilename());
					tripChallengeImge+= (imgTmp+2+img3.getOriginalFilename()+"||");

					if (!file3.exists()) {
						file3.mkdirs();
	                }
					
					img3.transferTo(file3);
				}else{
					tripChallengeImge+= (splitImage[2]+"||");
				}
				
				//변경된 사진 경로 set
				tripChallenge.setChallengeImage(tripChallengeImge);
			}
			
			tripChallengeService.updateTripChallenge(tripChallenge);
			result="T";
		} catch (Exception e) {
			System.out.println("updateTripChallenge 에러 : "+ e.getMessage());
		}
		return result;
	}
	
	
}
