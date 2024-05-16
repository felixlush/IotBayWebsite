/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.model.dao;

import iot.isd.model.Payment;
import iot.isd.model.User;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {
    
private Connection conn;
private final Statement st;
   
public DBManager(Connection conn) throws SQLException {    
   this.conn = conn;
   st = conn.createStatement();   
}

//Find user by email and password in the database   
public User findUser(String email, String password) throws SQLException {   
    System.out.println("Finding User");
    String sql = "SELECT * FROM USERS WHERE email = ? AND password = ?";

    // Create a PreparedStatement
    PreparedStatement pst = conn.prepareStatement(sql);

    // Set the parameters for the PreparedStatement
    pst.setString(1, email);
    pst.setString(2, password);

    // Execute this query using the PreparedStatement
    ResultSet rs = pst.executeQuery();

    if (rs.next()){
        String DBemail = rs.getString("EMAIL");
        String DBpassword = rs.getString("PASSWORD");
        String DBname = rs.getString("NAME");
        String DBaddress = rs.getString("ADDRESS");
        return new User(DBname, DBemail, DBpassword, DBaddress);
    }         
    return null;   
}

//Add a user-data into the database   
public void addUser(String email, String password, String name, String address) throws SQLException {                   //code for add-operation       
    String sql = "INSERT INTO USERS (email, password, name, address) VALUES ('" 
                  + email + "', '"  
                  + password + "', '" 
                  + name + "', '" 
                  + address + "')";
    st.executeUpdate(sql);   
}

public void checkConnection(){
    System.out.print(this.conn);
}

public void listTables() throws SQLException {
    DatabaseMetaData dbMetaData = conn.getMetaData();
    ResultSet rs = dbMetaData.getTables(null, null, "%", new String[] {"TABLE"});
    if (!rs.next()) {System.out.println("No Tables");}
    while (rs.next()) {
        System.out.println("Table: " + rs.getString(3)); // Assuming table name is in the third column
    }
}

//update a user details in the database   
public void updateUser( String email, String name, String password, String address) throws SQLException {
    String cmd = "UPDATE IOTUSER Users SET NAME='" + name + "',PASSWORD='" + password + "',ADDRESS='" + address + "'WHERE EMAIL='" + email + "'";
    st.executeUpdate(cmd);
}       

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   String cmd = "DELETE FROM IOTUSER.Users WHERE EMAIL='" + email + "'";
   st.executeUpdate(cmd);
}

//public void logLogin(String email, LocalDate date, LocalTime time, String type) throws SQLException{
//    System.out.println("Adding to log");
//    String sql = "INSERT INTO USER_LOGS (USER_EMAIL, DATE, TIME, TYPE) VALUES (?, ?, ?, ?)";
//    try (PreparedStatement pst = conn.prepareStatement(sql)) {
//        pst.setString(1, email);
//        pst.setDate(2, java.sql.Date.valueOf(date));
//        pst.setTime(3, java.sql.Time.valueOf(time));
//        pst.setString(4, type);
//        int affectedRows = pst.executeUpdate();
//        if (affectedRows == 0) {
//            throw new SQLException("Creating log failed, no rows affected.");
//        }
//    }
//    System.out.println("Log added");
//}

public void logLogin(String email, LocalDate date, LocalTime time, String type) throws SQLException{
    Date dateFormatted = java.sql.Date.valueOf(date);
    Time timeFormatted = java.sql.Time.valueOf(time);
    String cmd = "INSERT INTO USER_LOGS (USER_EMAIL, DATE, TIME, TYPE) VALUES ('"
                  + email + "', '"  
                  + dateFormatted + "', '" 
                  + timeFormatted + "', '" 
                  + type + "')";
    st.executeUpdate(cmd);
}

public void addPayment(String paymentId, String cardName, String cardNumber, String paymentMethod, Double amount, String paymentDate, String orderId, String email) throws SQLException {                   //code for add-operation       
  st.executeUpdate("INSERT INTO ISDUSER.PAYMENTS " + "VALUES ('" + paymentId + "', '" + cardName + "', '" + cardNumber + "', '" + paymentMethod + "', " + amount +", '" + paymentDate + "', '" + orderId + "', '" + email +"')");

}



public void updatePayment(String cardName, String cardNumber, String paymentMethod) throws SQLException {
            String query = "UPDATE ISDUSER.PAYMENTS SET cardName = ?, cardNumber = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            // Set parameter values for the columns to update
            pst.setString(2, cardName);
            pst.setString(3, cardNumber);
            // Execute the update query
            pst.executeUpdate();
        }
}
        
public ArrayList<Payment> getPaymentList (String email) throws SQLException{
    
    ArrayList<Payment> paymentList = new ArrayList<>();
    String query;
    query = "SELECT * FROM ISDUSER.PAYMENTS WHERE EMAIL = '" + email + "'";
    
    PreparedStatement pst = conn.prepareStatement(query);
    
    ResultSet rs = pst.executeQuery();
    
    while (rs.next()){
        String paymentId = rs.getString(1);
        String cardName = rs.getString(2);
        String cardNumber = rs.getString(3);
        String paymentMethod = rs.getString(4);
        Double amount = rs.getDouble(5);
        String date = rs.getString(6);
        String orderId = rs.getString(7);
        String Email = rs.getString(8);
        paymentList.add(new Payment(paymentId,cardName,cardNumber,paymentMethod,amount,date,orderId,Email));
    }
    return paymentList;
}



public void deletePayment(String cardNumber) throws SQLException{       
   String cmd = "DELETE FROM ISDUSER.PAYMENTS WHERE CARDNUMBER='" + cardNumber + "'";
   st.executeUpdate(cmd);
}
    

    public Payment findPayment(String cardNumber, String cardName) throws SQLException {       
   String fetch = "select * from ISDUSER.PAYMENTS where CARDNUMBER = '" + cardNumber + "' and CARDNAME='" + cardName + "'";
   ResultSet rs = st.executeQuery(fetch);
   
   while (rs.next()) {
       String cardNum = rs.getString(3);
       String cardNam = rs.getString(2);
       if(cardNumber.equals(cardNumber) && cardName.equals(cardName)) {
           String paymentId = rs.getString(1);
           String paymentMethod = rs.getString(4);
           Double amount = rs.getDouble(5);
           String paymentDate = rs.getString(6);
           String orderId = rs.getString(7);
           String email = rs.getString(8);
           return new Payment(paymentId,cardNum,cardNam,paymentMethod,amount,paymentDate,orderId,email);
       }
   }
   return null;   
}   

 

}
