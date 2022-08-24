package com.bnk.hamoye.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Account {
	private String accountNumber;
	private Date createDate;
	private String purpose;
	private String incomeSource;
	private int balance;
	private double primeRate;
}
