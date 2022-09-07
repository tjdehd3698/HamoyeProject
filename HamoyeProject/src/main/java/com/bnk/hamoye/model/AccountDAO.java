package com.bnk.hamoye.model;

import java.util.Map;

import com.bnk.hamoye.domain.Account;

public interface AccountDAO {
	int registerAccount(Account account) throws Exception;//계좌 등록
	int deleteAccount(String userId)  throws Exception; //계좌 삭제
	int updateBalance(Map<String, String> map) throws Exception; //계좌 잔액 수정
	int getAllAcountCnt() throws Exception; //총계좌 수 조회
	int getAccountCntByDate(String date) throws Exception; //날짜별 새로운 계좌 수 조회
	int getBalanceSum() throws Exception; //계좌 총액 조회
	int checkAccount(String accountNumber) throws Exception; // 계좌 있는지 확인
	Account getAccount(String accountNumber) throws Exception; // 계좌번호에 해당하는 계좌 정보 조회
	int updatePrimeRate(String userId) throws Exception; //조건 충족시 회원 계좌 우대이율 변경
}

