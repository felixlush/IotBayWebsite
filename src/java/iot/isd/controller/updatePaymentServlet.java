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
@WebServlet(name = "updatePaymentServlet", urlPatterns = {"/updatePaymentServlet"})
public class updatePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       


            HttpSession session = request.getSession();
//            Payment payment = (Payment) session.getAttribute("payment");
            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String paymentMethod = request.getParameter("paymentMethod");
//            String paymentId = request.getParameter("paymentId");
                int paymentId = 1;
            Double amount = 0.0;
             String paymentDate = request.getParameter("paymentDate");
              String orderId = request.getParameter("orderId");
            String email = request.getParameter("email");
            DBManager manager = (DBManager) session.getAttribute("manager");
            
            Payment payment = new Payment(paymentId, cardName, cardNumber, paymentMethod, amount, paymentDate, orderId, email );

            try {
                if (payment != null){
                    session.setAttribute("payment", payment);
                    manager.updatePayment(paymentId, cardName, cardNumber, paymentMethod, amount, paymentDate, orderId, email);
                    session.setAttribute("updated", "Update was successful");
                    request.getRequestDispatcher("payment.jsp").include(request, response);
//                } else {
//                    session.setAttribute("update", "Update not successful!");
//                    request.getRequestDispatcher("edit.jsp").include(request, response)
                }
                }
                catch (SQLException ex) {
//                Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
            }
            response.sendRedirect("updatePayment.jsp");
            }
    
    }

