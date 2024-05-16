/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.model;

/**
 *
 * @author thebigmoney
 */
public class Order {
    private int orderId;
    private String email;
    private String date;
    private String address;
    private String productName;
    private int productId;
    private Double price;
    private int quantity;

    public Order(int orderId, String email, String date, String address, int productId, Double price, int quantity) {
        this.orderId = orderId;
        this.email = email;
        this.date = date;
        this.address = address;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
    }
    
    public Order(String email, String date, String address, int productId, String productName, Double price, int quantity) {
        this.orderId = orderId;
        this.email = email;
        this.date = date;
        this.address = address;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
    }
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getProductName(){
        return productName;
    }
    


    
    
    
    



}
