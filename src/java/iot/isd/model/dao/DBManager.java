/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.model.dao;

import iot.isd.model.LogEntry;
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

public void logLogin(LogEntry logEntry) throws SQLException{
    String email = logEntry.getEmail();
    String accessDate = logEntry.getDate();
    String loginTime = logEntry.getLoginTime();
    String logoutTime = logEntry.getLogoutTime();
    String cmd = "INSERT INTO USER_LOGS (USER_EMAIL, ACCESS_DATE, LOGIN_TIME, LOGOUT_TIME) VALUES ('"
                  + email + "', '"  
                  + accessDate + "', '" 
                  + loginTime + "', '" 
                  + logoutTime + "')";
    st.executeUpdate(cmd);
}

public List<LogEntry> getUserLogs(String email) throws SQLException {
    List<LogEntry> logs = new ArrayList<>();
    String query = "SELECT * FROM USER_LOGS WHERE USER_EMAIL = ?";
    PreparedStatement st = null;
    ResultSet rs = null;

    try {
        st = conn.prepareStatement(query);
        st.setString(1, email);
        rs = st.executeQuery();

        while (rs.next()) {
            String log_email = rs.getString("USER_EMAIL");
            String logDate = rs.getString("ACCESS_DATE");
            String loginTime = rs.getString("LOGIN_TIME");
            String logoutTime = rs.getString("LOGOUT_TIME");
            logs.add(new LogEntry(email, logDate, loginTime, logoutTime));
        }
    } catch (SQLException e) {
        // Handle exceptions appropriately
        e.printStackTrace();
    }

    return logs;
}


 

}
