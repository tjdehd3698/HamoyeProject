package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Payment {
	private String paymentId;
	private String userId;
	private String category;
	private String restaurantName;
	private String restaurantId;
	private int price;
	private Date paymentDate;
	private User user;
	private Restaurant restaurant;

}
