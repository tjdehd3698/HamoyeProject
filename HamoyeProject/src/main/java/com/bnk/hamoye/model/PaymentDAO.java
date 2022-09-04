package com.bnk.hamoye.model;

import java.util.List;

import com.bnk.hamoye.domain.Payment;

public interface PaymentDAO {
	List<Payment> getPublicTransportationUsageByUserId(String userId) throws Exception; //회원의 대중교통 사용 내역 조회
}
