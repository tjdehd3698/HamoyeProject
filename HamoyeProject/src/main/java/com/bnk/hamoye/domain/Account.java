package com.bnk.hamoye.domain;

import java.sql.Date;
import java.util.Random;

import lombok.Data;

@Data
public class Account {
	private String accountNumber; // 계좌번호
	private double primeRate; // 우대 이율
	private Date createDate; // 생성 날짜
	private Date matureDate; // 만기 날짜
	private String purpose; // 통장 개설 목적
	private String incomeSource; // 수입원
	private int balance; // 통장 잔고

	public Account() {
		this.primeRate = 0.5;
	}

	public void makeAccountNumber() {
		if (accountNumber != null)
			return;
		Random random = new Random();
		String newNumber = "112-";

		for (int i = 0; i < 10; i++) {
			if (i == 4 || i == 8)
				newNumber += "-";
			newNumber += (random.nextInt(9));
		}

		this.accountNumber = newNumber;
	}
}
