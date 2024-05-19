/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iot.isd.controller;

import iot.isd.model.Order;
import iot.isd.model.Payment;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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
        //Payment payment = (Payment)session.getAttribute("payment");
        //int paymentId = payment.getPaymentId();
        //int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        User user = (User)session.getAttribute("user");
        Validator validator = new Validator();
        String email = request.getParameter("email");
        //int orderId = Integer.parseInt(request.getParameter("orderId"));
        String cardNumber = request.getParameter("cardNumber");
        String cardName = request.getParameter("cardName");
        double price = Double.parseDouble(request.getParameter("price"));
        String paymentMethod = request.getParameter("paymentMethod");
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        
        Date dateNow = new Date(System.currentTimeMillis());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String paymentDate = dateFormat.format(dateNow);
        
        if (!validator.validateCardNumber(cardNumber)) {
            System.out.println("Card number Error");
            session.setAttribute("cardErr", "Error: Credit card format incorrect");
            request.getRequestDispatcher("addPayment.jsp").include(request, response);
        } else if (!validator.validateName(cardName)) {      
            System.out.println("Card name Error");            
            session.setAttribute("nameErr", "Error: Name format incorrect");       
            request.getRequestDispatcher("addPayment.jsp").include(request, response);
        } else {   
            
        try { 
            
            List<Payment> currentPayment = (List<Payment>)session.getAttribute("currentPayment");
            
            manager.addPayment(cardName, cardNumber, paymentMethod, price, email, paymentDate);
            //Payment payment = (Payment)session.getAttribute("payment");
            //int paymentId = payment.getPaymentId();
            Payment newPayment = new Payment(cardName, cardNumber, paymentMethod, price, paymentDate, email);
            
//            if (currentPayment == null){
//            currentPayment = new ArrayList<>();
//        }
//        currentPayment.add(newPayment);
        session.setAttribute("newPayment", newPayment);
            
            
            request.getRequestDispatcher("payment.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
 
    }
}
