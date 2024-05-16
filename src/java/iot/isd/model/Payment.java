/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iot.isd.model;

import java.sql.Date;
import java.util.Random;

/**
 *
 * @author mcmic
 */
public class Payment {
    private String paymentId;
    private String cardName;
    private String paymentMethod;
    private String cardNumber;
    private double amount;
    private String paymentDate;
    
    
    public Payment(String paymetId, String cardName, String cardNumber, String paymentMethod, double amount, String paymentDate){
        this.paymentId = paymentId;
        this.cardName = cardName;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.paymentDate = paymentDate;
    }
    
    public static String generatePaymentId() {
       int i = new Random().nextInt(1000);
       String s = String.valueOf(i);  
        return s;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }
//    public String getOrderId() {
//        return orderId;
//    }
//
//    public void setOrderId(String orderId) {
//        this.orderId = orderId;
//    }
    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public String getCardDetails() {
        return cardNumber;
    }

    public void setCardDetails(String cardNumber) {
        this.cardNumber = cardNumber;
    }
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    public String getDate() {
        return paymentDate;
    }

    public void setDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
            
}
