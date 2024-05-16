/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package iot.isd.controller;

import iot.isd.model.Order;
import iot.isd.model.User;
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
        User user = (User) session.getAttribute("user");
        List<Order> orders = (List<Order>) session.getAttribute("currentOrder");

        // Update user details
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        if (user != null) {
            user.setEmail(email);
            user.setAddress(address);
        }

        // Update orders based on the provided quantities
        if (orders != null) {
            int numItems = Integer.parseInt(request.getParameter("numItems"));
            for (int i = 0; i < numItems; i++) {
                int productId = Integer.parseInt(request.getParameter("productId" + i));
                int quantity = Integer.parseInt(request.getParameter("quantity" + i));

                for (Order order : orders) {
                    if (order.getProductId() == productId) {
                        order.setQuantity(quantity);
                        break;
                    }
                }
            }
            session.setAttribute("currentOrder", orders); // Update the session with new order details
        }

        // Redirect back to the confirmation page for review or to another servlet that finalizes the order
        response.sendRedirect("confirmOrder.jsp");
    }
}

