package com.bnk.hamoye.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.impl.TripChallengeDAOImpl;
import com.bnk.hamoye.service.TripChallengeService;
import com.bnk.hamoye.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyPageController {
	private final UserService userService;
	private final TripChallengeService tripChallengeService;
	
	@PostMapping("change.do") //회원 정보 업데이트(비밀번호/이메일/주소)
	public String updateUser(User user) {
		try {
			userService.updateUser(user);
		} catch (Exception e) {
			System.out.println("updateUser 에러 : "+ e.getMessage());
		}
		return "mpg/MWPMPGV00M";
	} 
	
	@GetMapping("moveToChangeForm.do") //회원 정보 변경 페이지 이동
	public String getUserInfo(Model model, HttpSession session) {
		try {
			User user = userService.getUserInfo((String)session.getAttribute("user"));
			model.addAttribute("result", user);
		} catch (Exception e) {
			System.out.println("getUserInfo 에러 : "+ e.getMessage());
		}
		return "mpg/MWPMPGV01M";
	}

	@PostMapping("userout.do") //회원 탈퇴(비동기)
	@ResponseBody
	public String withdraw(HttpSession session,Model model, String userPassword) {
		try {
			User user = new User();
			user.setUserId((String)session.getAttribute("user"));
			user.setUserPassword(userPassword);
			
			User findUser = userService.login(user);
			if(findUser!=null) {
				userService.withdrawUser((String)session.getAttribute("user"));
				session.invalidate();
				return "T";
			}
			else return "F";
		} catch (Exception e) {
			System.out.println("withdraw 에러 : "+ e.getMessage());
		}
		return "";
	}

	@GetMapping("mypage.do") //마이페이지 화면 정보
	public String getMyPageInfo(HttpSession session, Model model) {
		try {

			User user = userService.getMypageInfo((String) session.getAttribute("user"));
			model.addAttribute("result", user);
			
			List<TripChallenge> tripList = tripChallengeService.getTripChallengeList();
			System.out.println(tripList);
			model.addAttribute("tripList", tripList);

			if (user.getEcoChallenge() == null) {
				model.addAttribute("totalCnt", null);
				model.addAttribute("successCnt", null);
			} else {
				List<User> userList = userService.getUserByEcoChallenge(user.getEcoChallenge().getEcoChallengeId());
				model.addAttribute("totalCnt", userList.size());

				int successCnt = 0;
				for (User u : userList) {
					if (u.getParticipationCount() >= user.getEcoChallenge().getTotalCount())
						successCnt++;
				}
				model.addAttribute("successCnt", successCnt);
			}

		} catch (Exception e) {
			System.out.println("getMyPageInfo 에러 : " + e.getMessage());
		}

		return "mpg/MWPMPGV00M";
	}
	
	@PostMapping("deposit.do")
	@ResponseBody
	public String changePoint(HttpSession session,int amount, String userPassword) {
		try {
			System.out.println("aaa");
			User user = new User();
			user.setUserId((String)session.getAttribute("user"));
			user.setUserPassword(userPassword);
			
			User findUser = userService.login(user);
			if(findUser!=null) {
				System.out.println("t");
				userService.changePoint((String)session.getAttribute("user"), amount);
				return "T";
				
			}
			else return "F";
		} catch (Exception e) {
			System.out.println("changePoint 에러 : "+ e.getMessage());
		}
		return "";
	}
	 
	@PostMapping("expireAccount.do") //계좌 해지
	@ResponseBody
	public String expireAccount(HttpSession session, String userPassword, Model model) {
		try {
			User user = new User();
			user.setUserId((String)session.getAttribute("user"));
			user.setUserPassword(userPassword);
			
			User findUser = userService.login(user);
			if(findUser!= null) {
				userService.expireAccount((String)session.getAttribute("user"));
				return "T";
			}
			else return "F";
			
		} catch (Exception e) {
			System.out.println("expireAccount 에러 : "+ e.getMessage());
		}
		return "";
	}

	@GetMapping("showpoint.do") //포인트 적립 내역 조회
	public String getParticipateChallenge(HttpSession session, Model model) {
		try {
			List<Participation> list = userService.getParticipateChallenge((String) session.getAttribute("user"));
			for(Participation p :list)
				System.out.println(p);
			model.addAttribute("result", list);
		} catch (Exception e) {

		}
		return "mpg/MWPMPGV04M";
	}

	@GetMapping("moveToOut.do") public String pageMoveToOut() { 
		return "mpg/MWPMPGV02M"; 
	}
	 
	
	 @GetMapping("moveToAccountOut.do") public String pageMoveToOutOfAcc() { 
		 return "mpg/MWPMPGV03M";
	 }

	 @GetMapping("moveDeposit.do")  //포인트->계좌 변경 페이지
	 public String pageMoveToDeposit(HttpSession session, Model model) { 
		 User user;
		try {
			user = userService.getMypageInfo((String) session.getAttribute("user"));
			
			model.addAttribute("accountNumber", user.getAccount().getAccountNumber());
			model.addAttribute("totalPoint", user.getPoint().getTotalPoint());
			
		} catch (Exception e) {
			System.out.println("pageMoveToDeposit 에러 : "+ e.getMessage());
		}
		 return "mpg/MWPMPGV05M"; 
	 } 
	
//	@GetMapping()
//	public String getParticipateChallenge(HttpSession session,Model model) {
//		try {
//			List<Participation>list = userService.getParticipateChalleng((String)session.getAttribute("user"));
//			model.addAttribute("result", list);
//		} catch (SQLException e) {
//			
//		}
//		return "";
//	}
	

	
}
