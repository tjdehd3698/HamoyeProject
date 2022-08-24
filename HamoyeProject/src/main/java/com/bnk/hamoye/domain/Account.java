package com.bnk.hamoye.domain;

import java.sql.Date;
import java.util.Random;

import lombok.Data;

@Data
public class Account {
	private String accountNumber;
	private Date createDate;
	private String purpose;
	private String incomeSource;
	private int balance;
	private double primeRate;
	
	public void makeAccountNumber() {
		if(accountNumber!=null) return;
		Random random = new Random();
		String newNumber ="112-";
		
        for(int i=0;i<10;i++) {
        	if(i==4||i==8) newNumber+="-";
        	newNumber+=(random.nextInt(9));
        }
        this.accountNumber = newNumber;
	}
}
