package com.ata.util;

public interface Payment {
	public boolean findByCardNumber(String userID,String cardNumber);
	public String process(Payment Payment);
}
