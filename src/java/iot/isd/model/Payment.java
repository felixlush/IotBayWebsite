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
    private int paymentId;
    private String cardName;
    private String paymentMethod;
    private String cardNumber;
    private double amount;
    private String paymentDate;
    private String email;
    
    
    
    public Payment(int paymentId, String cardName, String cardNumber, String paymentMethod, double amount, String paymentDate, String email){
        this.paymentId = paymentId;
        this.cardName = cardName;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.email = email;
      
    }
//    public Payment(String cardName, String cardNumber, String paymentMethod, double amount, String paymentDate, String email){
//       
//        this.cardName = cardName;
//        this.paymentMethod = paymentMethod;
//        this.cardNumber = cardNumber;
//        this.amount = amount;
//        this.paymentDate = paymentDate;
//        this.email = email;
      
   // }
    
    public int getPaymentId() {
//       int i = new Random().nextInt(1000);
//       String s = String.valueOf(i);  
//        return s;
          return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
        
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
    public String getCardName(){
        return cardName;
    }
    public void setCardName(){
        this.cardName = cardName;
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
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
            
}
