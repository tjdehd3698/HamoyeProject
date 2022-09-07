package com.bnk.hamoye.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bnk.hamoye.domain.EcoChallenge;
import com.bnk.hamoye.domain.Participation;
import com.bnk.hamoye.domain.Payment;
import com.bnk.hamoye.domain.Status;
import com.bnk.hamoye.domain.TripChallenge;
import com.bnk.hamoye.domain.TripStatus;
import com.bnk.hamoye.domain.User;
import com.bnk.hamoye.model.AccountDAO;
import com.bnk.hamoye.model.EcoChallengeDAO;
import com.bnk.hamoye.model.ParticipationDAO;
import com.bnk.hamoye.model.PaymentDAO;
import com.bnk.hamoye.model.PointDAO;
import com.bnk.hamoye.model.TripChallengeDAO;
import com.bnk.hamoye.model.UserDAO;
import com.bnk.hamoye.service.AdminService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final UserDAO userDAO;
	private final AccountDAO accountDAO;
	private final EcoChallengeDAO ecoChallengeDAO;
	private final ParticipationDAO participationDAO;
	private final PointDAO pointDAO;
	private final TripChallengeDAO tripChallengeDAO;
	private final PaymentDAO paymentDAO;
	
	@Override
	public List<User> getAllUser() throws Exception {
		return userDAO.getAllUser();
	}

	@Override
	public User adminLogin(User user) throws Exception {
		user.setIsAdmin(1);
		return userDAO.login(user);
	}

	@Override
	public int getAllAcountCnt() throws Exception {
		return accountDAO.getAllAcountCnt();
	}

	@Override
	public List<Status> getAllEcoChallenge() throws Exception { //EcoChallenge 통계 조회
		//결과 ArrayList
		List<Status> result = new ArrayList<>();
		//전체 EcoChallenge 조회
		List<EcoChallenge> list1 = ecoChallengeDAO.getEcoChallengeList(); 
		
		for(EcoChallenge e : list1) {
			//취소된 챌린지면 continue
			if(e.getIsDelete()==1) continue;
			
			Status status = new Status();
			status.setChallengeId(e.getEcoChallengeId());
			status.setChallengeName(e.getEcoChallengeName());
			
			//EcoChallenge 참여자 조회
			List<User> list2 = userDAO.getUserByEcoChallenge(e.getEcoChallengeId());
			status.setUserCnt(list2.size());
			
			int count = 0;
			for(User u : list2) {
				//목표 횟수 도달 시 count 증가
				if(e.getTotalCount()<=u.getParticipationCount()) count++;
			}
			
			//달성률 설정
			if(list2.size()==0) {
				status.setSuccessPercent(0);
			}else {
				status.setSuccessPercent((double)count/(double)list2.size()*100.0);
			}
			
			result.add(status);
		}
		return result;
	}

	@Override
	public List<TripStatus> getAllTripChallenge() throws Exception {
		List<TripStatus> result = new ArrayList<TripStatus>();
		
		List<TripChallenge> tripList = tripChallengeDAO.getTripChallengeList();
		for(TripChallenge t: tripList) {
			
			List<Participation> list = participationDAO.getAllUserByTripChallenge(t.getTripChallengeId());
			int participateCnt = 0;
			int totalPoint =0;
			for(Participation p : list) {
				if(p.getIsSuccess()==1) {
					totalPoint+=t.getRewardPoint();
					participateCnt++;
				}
			}
			
			TripStatus status = new TripStatus();
			status.setChallengeId(t.getTripChallengeId());
			status.setChallengeName(t.getTripChallengeName());
			status.setUserCnt(list.size());
			status.setTotalPoint(totalPoint);
			if(list.size()==0)
				status.setSuccessPercent(0);
			else
				status.setSuccessPercent((double)participateCnt/(double)list.size()*100.0);
			System.out.println(status);
			result.add(status);
		}
		return result;
	}

	@Override
	public int getUserCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return userDAO.getUserCntByDate(nowYear);
	}

	@Override
	public int getAccountCntByDate() throws Exception {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String nowYear = LocalDate.now().format(formatter);
		
		return accountDAO.getAccountCntByDate(nowYear);
	}

	@Override
	public int getBalanceSum() throws Exception {
		return accountDAO.getBalanceSum();
	}

	@Override
	public int getPointSum() throws Exception {
		return pointDAO.getPointSum();
	}

	@Override
	public LinkedHashMap<String, Integer> getTripChallengeCntByMonth() throws Exception {
		LinkedHashMap<String,Integer> result = new LinkedHashMap<String, Integer>(); //결과 담을 LikedHashMap
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYYMM"); //날짜 변환 Formatter
		
		for(int i=1;i<9;i++) { //최근 8개월의  TripChallenge 가입자 수 조회
			String date = LocalDate.now().minusMonths(i).format(formatter);
			result.put(date,participationDAO.getParticipationCntByDate(date)); //날짜별 TripChallenge 조회
		}
		return result; //결과 return
	}

	@Override
	public User getUserInfoByAdmin(String userId) throws Exception {
		User user = userDAO.getUserAllInfo(userId);
		if(user.getEcoChallengeId()==null) {
			return userDAO.getUserInfoByAdminWithNoEco(userId);
		}
		return userDAO.getUserInfoByAdmin(userId);
	}

	@Override
	public int updateUserByAdmin(User user) throws Exception {
		return userDAO.updateUserByAdmin(user);
	}

	@Override
	public Map<String, Integer> getUserCntByEcoChallenge() throws Exception {
		Map<String, Integer> result = new HashMap<String, Integer>();
		List<EcoChallenge> ecoChallengeList = ecoChallengeDAO.getEcoChallengeList();
		
		for(EcoChallenge e : ecoChallengeList) {
			List<User> userList = userDAO.getUserByEcoChallenge(e.getEcoChallengeId());
			result.put(e.getEcoChallengeId(), userList.size());
		}
		
		return result;
	}

	@Override
	public LinkedHashMap<String, Integer> getUserCntByTripChallenge() throws Exception {
		LinkedHashMap<String, Integer> result = new LinkedHashMap<String, Integer>();
		List<TripChallenge> tripChallengeList = tripChallengeDAO.getTripChallengeListByAdmin();
		
		for(TripChallenge t : tripChallengeList) {
			List<Participation> participationList = participationDAO.getParticipationCntByTripChallenge(t.getTripChallengeId());
			result.put(t.getTripChallengeId(), participationList.size());
		}
		
		return result;
	}

	@Override
	public int getUserCntByEcoChallengeById(String ecoChallengeId) throws Exception {
		List<User> userList = userDAO.getUserByEcoChallenge(ecoChallengeId);
		return userList.size();
	}

	@Override
	public int getUSerCntByTripChallengeById(String tripChallengeId) throws Exception {
		List<Participation> participationList = participationDAO.getParticipationCntByTripChallenge(tripChallengeId);
		return participationList.size();
	}

	@Override
	public LinkedHashMap<String, Double> getUserCntByEcoChallengeType(int totalUserCnt) throws Exception {
		LinkedHashMap<String,Double> result = new LinkedHashMap<String, Double>(); //결과 값 담을 LinkedHashMap
		double rest = totalUserCnt; //아무 에코 챌린지에 참여안한 사람 수
		
		//모든 EcoChallenge 타입 가져오기
		List<String> typeList = ecoChallengeDAO.getEcoChallengeType();
		
		for(String type : typeList) {
			//챌린지 타입 별 user수 조회
			List<User> userList = userDAO.getUserByEcoChallengeType(type);
			rest-=userList.size();
			//전체 user에서 해당 타입 챌린지 참여 user 퍼센트 
			result.put(type, (double)userList.size()/(double)totalUserCnt*100.0);
		}
		result.put("기타", rest);
		
		return result;
	}

	@Override
	public int updateTripChallengeImage(TripChallenge tripChallenge) throws Exception {
		return tripChallengeDAO.updateTripChallengeImage(tripChallenge);
	}

	@Override
	public int updateEcoChallengeImage(EcoChallenge ecoChallenge) throws Exception {
		return ecoChallengeDAO.updateEcoChallengeImage(ecoChallenge);
	}

	@Override
	public int updateUserParticipationCountWithVolunteer(List<User> userList) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		// 에코 챌린지 목표 횟수
		int totalCount = ecoChallengeDAO.getEcoChallengeDetail(userList.get(0).getEcoChallengeId()).getTotalCount();
		
		for(User u: userList) {
			map.put("count", ""+u.getUserAge());
			map.put("userId", u.getUserId());
			
			//조건 충족 시 우대 이율 업데이트
			if(u.getParticipationCount()<totalCount && u.getParticipationCount()+u.getUserAge()>=totalCount) {
				accountDAO.updatePrimeRate(u.getUserId());
			}
			userDAO.updateUserParticipationCount(map);
		}
		return userList.size();
	}

	@Override
	public int updateUserParticipationCountWithPublicTransportaion(String ecoChallengeId) throws Exception {
		List<User> userList = userDAO.getUserByEcoChallenge(ecoChallengeId);
		int totalCount = ecoChallengeDAO.getEcoChallengeDetail(ecoChallengeId).getTotalCount();
		
		for(User user : userList) {
			List<Payment> paymentList = paymentDAO.getPublicTransportationUsageByUserId(user.getUserId());
			
			if(paymentList.size()>=totalCount) {
				accountDAO.updatePrimeRate(user.getUserId());
			}
		}
		
		return userList.size();
	}
}
