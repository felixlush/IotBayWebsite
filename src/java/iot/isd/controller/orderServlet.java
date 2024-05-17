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
public class orderServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String searchString = request.getParameter("searchString");
        String productId = request.getParameter("productId");
        int productIdInt = 0;
        List<Order> orders = new ArrayList<>();

        if (productId != null) {
            try {
                productIdInt = Integer.parseInt(productId);
            } catch (NumberFormatException e) {
                // Handle incorrect number format if necessary
//                Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, "Invalid product ID format", e);
            }
        }

        User user = (User) session.getAttribute("user");
        DBManager manager = (DBManager) session.getAttribute("manager");

        if (manager == null || user == null) {
            // Log this condition, very important to know why this happens
            Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, "Manager or User is null");
            response.sendRedirect("index.jsp"); // Redirect to home page or login page
            return; // Important to return after sending a redirect to stop further execution
        }

        if (searchString == null) {
            searchString = "";
        }
        

        

        try {
            orders = manager.getUserOrders(searchString, productIdInt, user.getEmail());
            System.out.println(orders.size());
            session.setAttribute("orders", orders);
//            request.getRequestDispatcher("order.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(orderServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }

    }

}
