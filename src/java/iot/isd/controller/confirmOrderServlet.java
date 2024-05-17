/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.Order;
import iot.isd.model.User;
import iot.isd.model.dao.DBManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class confirmOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager)session.getAttribute("manager"); 

        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String orderDate = request.getParameter("orderDate");
        int numItems = Integer.parseInt(request.getParameter("numItems"));
        
        try {
            for (int i = 0; i < numItems; i++) {
                int productId = Integer.parseInt(request.getParameter("productId" + i));
                int quantity = Integer.parseInt(request.getParameter("quantity" + i));
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice" + i));

                manager.addOrder(email, address, productId, quantity, totalPrice, orderDate);
                session.removeAttribute("currentOrder");
            }
            response.sendRedirect("orderConfirmation.jsp"); // Redirect to confirmation page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("orderError.jsp"); // Redirect to error page
        }
    }
}
