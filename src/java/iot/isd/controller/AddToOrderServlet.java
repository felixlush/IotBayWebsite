/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.Order;
import iot.isd.model.Product;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thebigmoney
 */
public class AddToOrderServlet extends HttpServlet {

            
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming using GET or change to doPost if using POST form method
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        
        
        if (productName.equals("") || productName == null) {
            // This means productName was not sent correctly from the form
            System.out.println("Error: Product name is null");
        } else {
            System.out.println("Product Name");
        }
        
        User user = (User)session.getAttribute("user");
        String userEmail = "";
        String userAddress = "";

        if (user != null){
            userEmail = user.getEmail();
            userAddress = user.getAddress();
        }
        
        
        List<Order> currentOrder = (List<Order>)session.getAttribute("currentOrder");
        

        
        Double totalPrice = quantity * productPrice;
        Date dateNow = new Date(System.currentTimeMillis());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormat.format(dateNow);

        DBManager manager = (DBManager) session.getAttribute("manager");
        
        
//        addOrder(String email, String address, int productId, String productName, int quantity, double totalPrice, String date)
        Order newOrder = new Order(userEmail, currentDate, userAddress, productId, productName, totalPrice, quantity);
        
        if (currentOrder == null){
            currentOrder = new ArrayList<>();
        }
        currentOrder.add(newOrder);
        session.setAttribute("currentOrder", currentOrder);

        // Forward to purchaseProduct.jsp
        request.getRequestDispatcher("order.jsp").forward(request, response);
    
    }
    
}
