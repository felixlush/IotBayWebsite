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
            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String paymentMethod = request.getParameter("paymentMethod");
            DBManager manager = (DBManager) session.getAttribute("manager");
            //Payment payment = new Payment(cardName, cardNumber, paymentMethod );

            try {
                //if (user != null){
                    //session.setAttribute("user", user);
                    manager.updatePayment(cardName, cardNumber, paymentMethod);
                    session.setAttribute("updated", "Update was successful");
                    request.getRequestDispatcher("updatePayment.jsp").include(request, response);
//                } else {
//                    session.setAttribute("update", "Update not successful!");
//                    request.getRequestDispatcher("edit.jsp").include(request, response);
                }
             catch (SQLException ex) {
//                Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
            }
            response.sendRedirect("updatePayment.jsp");

    }
}
