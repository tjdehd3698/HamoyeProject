package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	private String paymentId;
	private String detail;
	private int price;
	private Date paymentDate;
	private String userId;
	private User user;
}
