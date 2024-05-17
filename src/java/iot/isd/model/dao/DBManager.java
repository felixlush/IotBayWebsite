/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package iot.isd.model.dao;

import iot.isd.model.LogEntry;
import iot.isd.model.Order;
import iot.isd.model.Product;
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
//    System.out.println("Finding User");
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

//        return new User(DBname, DBemail, DBpassword, DBaddress);

        return new User(DBname, DBemail, DBpassword, DBaddress,"CUSTOMER","ACTIVE");

    }         
    return null;   
}

//Add a user-data into the database   

public void addUser(String email, String password, String name, String address, String type) throws SQLException {                   //code for add-operation       
    String sql = "INSERT INTO USERS (email, password, name, address, TYPE) VALUES ('" 
                  + email + "', '"  
                  + password + "', '" 
                  + name + "', '"
                    + address + "', '"
                  + type + "')";
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
    String cmd = "UPDATE USERS SET NAME='" + name + "',PASSWORD='" + password + "',ADDRESS='" + address + "'WHERE EMAIL='" + email + "'";
    st.executeUpdate(cmd);
}

public List<LogEntry> searchLogsByDate(String date, String email) throws SQLException{
    String sql = "SELECT * FROM USER_LOGS WHERE USER_EMAIL = ? AND ACCESS_DATE = ?";
    
    PreparedStatement pst = conn.prepareStatement(sql);
    
    pst.setString(1, email);
    pst.setString(2, date);
    
    ResultSet rs = pst.executeQuery();
    List<LogEntry> results = new ArrayList<>();
    
    while (rs.next()) {
        String log_email = rs.getString("USER_EMAIL");
        String logDate = rs.getString("ACCESS_DATE");
        String loginTime = rs.getString("LOGIN_TIME");
        String logoutTime = rs.getString("LOGOUT_TIME");
        results.add(new LogEntry(log_email, logDate, loginTime, logoutTime));
    }

    return results;
}

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   String cmd = "DELETE FROM USERS WHERE EMAIL='" + email + "'";
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
            logs.add(new LogEntry(log_email, logDate, loginTime, logoutTime));
        }
    } catch (SQLException e) {
        // Handle exceptions appropriately
        e.printStackTrace();
    }

    return logs;
}

public void addStaff(String name, String email, String password, String address, String position) throws SQLException {                   //code for add-operation       
    String sql = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, ADDRESS, POSITION) VALUES ('" 
                  + name + "', '"  
                  + email + "', '" 
                  + password + "', '" 
                  + address + "', '"
                  + "Staff" + "')";
    st.executeUpdate(sql);   
}

public void updateStaff(String name, String email, String password, String address, String position) throws SQLException {
    String cmd = "UPDATE USERS SET "
            + "NAME='" + name + "', "
            + "EMAIL='" + email + "', "
            + "PASSWORD='" + password + "', "
            + "ADDRESS='" + address + "', "
            + "POSITION='" + position + "' "
            + "WHERE EMAIL='" + email + "'";
           
    st.executeUpdate(cmd);
}      

public void deleteStaff(String email) throws SQLException{       
   String cmd = "DELETE FROM Users WHERE EMAIL='" + email + "'";
   st.executeUpdate(cmd);
}

public void deactivateStaff(String email) throws SQLException {
    String cmd = "UPDATE USERS SET STATUS='INACTIVE' WHERE EMAIL='" + email + "'";
    st.executeUpdate(cmd);
}
public void reactivateStaff(String email) throws SQLException {
    String cmd = "UPDATE USERS SET STATUS='ACTIVE' WHERE EMAIL='" + email + "'";
    st.executeUpdate(cmd);
}

public List<User> getStaffList(String searchString) throws SQLException {
    
    List<User> staffList = new ArrayList<>();
    String query;
    if (searchString == null || searchString.equals("")){
        //Access database return all USERS where type == STAFF
      query = "SELECT * FROM USERS WHERE POSITION != 'user'";
    } else {
        query = "SELECT * FROM USERS WHERE POSITION IS NOT NULL AND NAME ='"+searchString+"'";
    }
        
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            st = conn.prepareStatement(query);
            // st.setString(1, email);
            rs = st.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String position = rs.getString("position");
                String status = rs.getString("status");
                staffList.add(new User(name, email, password, address, position, status));
            }
          
        }catch (SQLException e) {
            // Handle exceptions appropriately
            e.printStackTrace();
        }return staffList;
        
    } 

public List<Product> getFeaturedProducts(String searchString) throws SQLException{
    ArrayList<Product> featuredProducts = new ArrayList<>();
    
    if (searchString.equals("featured")){
        String sql = "SELECT * FROM Products WHERE PRODUCT_CATEGORY = 'featured'";
        ResultSet rs = st.executeQuery(sql);
    //    pstmt = conn.prepareStatement(sql);
    //    pstmt.setString(1, "featured");

        while (rs.next()) {
            Product product = new Product(
                rs.getInt("PRODUCT_ID"),
                rs.getString("PRODUCT_NAME"),
                rs.getDouble("PRODUCT_PRICE"),
                rs.getInt("PRODUCT_UNITS"),
                rs.getString("PRODUCT_IMAGE"),
                rs.getString("PRODUCT_CATEGORY")
            );
            featuredProducts.add(product);
        }
    }
    
    if (searchString.equals("")){
        String sql = "SELECT * FROM Products";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            Product product = new Product(
                rs.getInt("PRODUCT_ID"),
                rs.getString("PRODUCT_NAME"),
                rs.getDouble("PRODUCT_PRICE"),
                rs.getInt("PRODUCT_UNITS"),    
                rs.getString("PRODUCT_IMAGE"),
                rs.getString("PRODUCT_CATEGORY")
            );
            featuredProducts.add(product);
        }
        System.out.println(featuredProducts.size());
    }
    
    
    return featuredProducts;
}

public Product getProduct(String ID) throws SQLException{
    
    String sql = "SELECT * FROM PRODUCTS WHERE PRODUCT_ID = ?";

    // Create a PreparedStatement
    PreparedStatement pst = conn.prepareStatement(sql);

    // Set the parameters for the PreparedStatement
    pst.setString(1, ID);

    // Execute this query using the PreparedStatement
    ResultSet rs = pst.executeQuery();
    
    if (rs.next()){
        System.out.println("Found Product");
        int id = rs.getInt("PRODUCT_ID");
        String name = rs.getString("PRODUCT_NAME");
        double price = rs.getDouble("PRODUCT_PRICE");
        int units = rs.getInt("PRODUCT_UNITS");
        String category = rs.getString("PRODUCT_CATEGORY");
        String image = rs.getString("PRODUCT_IMAGE");
        return new Product(id, name, price, units, image, category);
    } 
    return null;
    
}

public void deleteProduct(String ID) throws SQLException{
    String sql = "DELETE FROM PRODUCTS WHERE PRODUCT_ID = ?";
    PreparedStatement pst = conn.prepareStatement(sql);
    pst.setString(1, ID);
    pst.executeUpdate();
}

public void addOrder(String email, String address, int productId, int quantity, double totalPrice, String date) throws SQLException {

    // SQL INSERT statement
    String sql = "INSERT INTO ORDERS (ORDER_EMAIL, order_date, address, PRODUCT_ID, ORDER_QUANTITY, PRICE, PAID) VALUES (?, ?, ?, ?, ?, ?, ?)";

    // Using PreparedStatement to avoid SQL Injection
    PreparedStatement pst = conn.prepareStatement(sql);
    pst.setString(1, email);
    pst.setString(2, date);
    pst.setString(3, address);
    pst.setInt(4, productId);
    pst.setInt(5, quantity);
    pst.setDouble(6, totalPrice);
    pst.setBoolean(7, true);

    // Execute the update
    pst.executeUpdate();
}


public List<User> getStaffList() throws SQLException {
    
    List<User> staffList = new ArrayList<>();
    String query;
        query = "SELECT * FROM USERS WHERE POSITION IS NOT NULL";      
        PreparedStatement st = null;
        ResultSet rs = null;
        try{
            st = conn.prepareStatement(query);
            // st.setString(1, email);
            rs = st.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String position = rs.getString("position");
                String status = rs.getString("status");
                staffList.add(new User(name, email, password, address, position, status));
            }
          
        }catch (SQLException e) {
        // Handle exceptions appropriately

        }return staffList;
        
} 

//public List<Order> getUserOrders(String searchString, int productId, String userEmail) throws SQLException{
//    ArrayList<Order> orders = new ArrayList<>();
//
//    // Assuming searchString is either empty or a valid date string.
//    String sql = "SELECT * FROM ORDERS WHERE ORDER_EMAIL = ?";
//
//    // Check if the searchString (date) and productId are provided and append to the SQL query accordingly.
//    if (!searchString.isEmpty()) {
//        sql += " AND ORDER_DATE = ?";
//    }
//    if (productId > 0) { // Assuming 0 is an invalid product ID.
//        sql += " AND PRODUCT_ID = ?";
//    }
//
//    try (PreparedStatement pst = conn.prepareStatement(sql)) {
//        int paramIndex = 1;
//        pst.setString(paramIndex++, userEmail); // Set the user email
//
//        if (!searchString.isEmpty()) {
//            pst.setDate(paramIndex++, java.sql.Date.valueOf(searchString)); // Set the order date, assuming searchString is in 'YYYY-MM-DD' format.
//        }
//        if (productId > 0) {
//            pst.setInt(paramIndex++, productId); // Set the product ID
//        }
//
//        try (ResultSet rs = pst.executeQuery()) {
//            while (rs.next()) {
//                Order order = new Order(


public List<Order> getUserOrders(String searchString, String userEmail) throws SQLException{
    ArrayList<Order> orders = new ArrayList<>();

    if (searchString.equals("")){
        String sql = "SELECT * FROM ORDERS WHERE ORDER_EMAIL = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, userEmail);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Order order = new Order(
                rs.getInt("ORDER_ID"),
                rs.getString("ORDER_EMAIL"),
                rs.getString("ORDER_DATE"),
                rs.getString("ADDRESS"),    
                rs.getInt("PRODUCT_ID"),
                rs.getDouble("PRICE"),
                rs.getInt("ORDER_QUANTITY")
            );
                orders.add(order);
            }
    }
    return orders;
}

public List<Product> getProductsByCategory(String category) throws SQLException {
    List<Product> products = new ArrayList<>();
    String sql = "SELECT * FROM Products WHERE PRODUCT_CATEGORY LIKE ?";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, category + '%');  // Using LIKE for partial matches
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("PRODUCT_ID"),
                    rs.getString("PRODUCT_NAME"),
                    rs.getDouble("PRODUCT_PRICE"),
                    rs.getInt("PRODUCT_UNITS"),
                    rs.getString("PRODUCT_IMAGE"),
                    rs.getString("PRODUCT_CATEGORY")
                );
                products.add(product);
            }
        }
    } catch (SQLException ex) {
        System.out.println("Database error: " + ex.getMessage());
        throw ex;
    }
    return products;
}

public List<Product> getTopProducts(String category) throws SQLException {
    List<Product> products = new ArrayList<>();
    String sql = "SELECT 3 FROM Products";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) { 
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("PRODUCT_ID"),
                    rs.getString("PRODUCT_NAME"),
                    rs.getDouble("PRODUCT_PRICE"),
                    rs.getInt("PRODUCT_UNITS"),
                    rs.getString("PRODUCT_IMAGE"),
                    rs.getString("PRODUCT_CATEGORY")
                );
                products.add(product);
            }
        }
    } catch (SQLException ex) {
        System.out.println("Database error: " + ex.getMessage());
        throw ex;
    }
    return products;
}
}