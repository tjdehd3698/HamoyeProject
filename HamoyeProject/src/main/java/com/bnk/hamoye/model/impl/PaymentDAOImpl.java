package com.bnk.hamoye.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bnk.hamoye.domain.Payment;
import com.bnk.hamoye.model.PaymentDAO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	private final String NS = "sql.hamoye.payment_mapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Payment> getPublicTransportationUsageByUserId(String userId) throws Exception {
		return sqlSession.selectList(NS+"getPublicTransportationUsageByUserId", userId);
	}

}
