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
@WebServlet(name = "EditPaymentServlet", urlPatterns = {"/EditPaymentServlet"})
public class EditPaymentServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            Validator validator = new Validator();
            String cardNumber = request.getParameter("cardNumber");
            String cardName = request.getParameter("cardName");
            //String paymentMethod = request.getParameter("paymentMethod");
            DBManager manager = (DBManager) session.getAttribute("manager");
            Payment payment = null;

            try {
                payment = manager.findPayment(cardNumber, cardName);
                if (payment != null){
                    session.setAttribute("payment", payment);
                    request.getRequestDispatcher("updatePayment.jsp").include(request, response);
                } else {
                    session.setAttribute("existErr", "User does not exist in the Database!");
                    request.getRequestDispatcher("payment.jsp").include(request, response);
                }
            } catch (SQLException ex) {
//                Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex.getMessage() == null ? "User does not exists" : "welcome");
            }            

    }


}
