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
import java.sql.SQLException;
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
public class orderServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String searchString = request.getParameter("searchString");
        User user = (User)session.getAttribute("user");
        DBManager manager = (DBManager)session.getAttribute("manager");
        String userEmail;
        
        if (manager == null || user == null) {
            // Handle the error appropriately
            response.sendRedirect("index.jsp"); // Redirect to an error page or log the issue
            System.out.println("manager null");
            return;
        }
        
        if (searchString == null){
            searchString = "";
        }
        
        if (user == null){
            userEmail = "";
        }
        
        try {
            List<Order> orders = manager.getUserOrders(searchString, user.getEmail());            
            session.setAttribute("orders", orders);
        } catch (SQLException ex) {
            Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
