/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iot.isd.controller;

import iot.isd.model.Payment;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mcmic
 */
@WebServlet(name = "PaymentList", urlPatterns = {"/PaymentList"})
public class PaymentList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        // Retrieve the email parameter from the request
        String email = user.email;
        
        // Get the list of payments for the given email
        ArrayList<Payment> paymentList = null;
        try {
            
            DBManager manager = (DBManager) session.getAttribute("manager");
            paymentList = manager.getPaymentList(email);
        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
        }
        
        // Set the paymentList as an attribute in the request
        request.setAttribute("paymentList", paymentList);
        
        // Forward the request to the paymentList.jsp to display the payment list
        request.getRequestDispatcher("paymentList.jsp").forward(request, response);
    }
}

    

