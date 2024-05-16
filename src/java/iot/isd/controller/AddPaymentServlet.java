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
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "AddPaymentServlet", urlPatterns = {"/AddPaymentServlet"})
public class AddPaymentServlet extends HttpServlet {

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        //Validator validator = new Validator();
        String orderId = null;
        String paymentId = Payment.getPaymentId();
        String email = user.email;
//        String email = (String)session.getAttribute("email");
        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        double amount = 0;
        String paymentMethod = request.getParameter("paymentMethod");
        DBManager manager = (DBManager) session.getAttribute("manager");
        String paymentDate = null;
        
        try {            
            manager.addPayment(paymentId, cardName, cardNumber, paymentMethod, amount, paymentDate, orderId, email);
            //Payment payment = new Payment(paymentId, cardName, cardNumber, paymentMethod, amount, paymentDate, orderId, email);
            //session.setAttribute("payment", payment);
            request.getRequestDispatcher("payment.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }
}
