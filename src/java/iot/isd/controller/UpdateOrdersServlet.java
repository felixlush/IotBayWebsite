package iot.isd.controller;

import iot.isd.model.Order;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UpdateOrdersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String[] productIds = request.getParameterValues("productId");
        String[] quantities = request.getParameterValues("quantity");
        
        List<Order> currentOrders = (List<Order>) session.getAttribute("currentOrder");
        
        if (currentOrders != null && productIds != null && quantities != null) {
            for (int i = 0; i < productIds.length; i++) {
                int productId = Integer.parseInt(productIds[i]);
                int newQuantity = Integer.parseInt(quantities[i]);

                for (Order order : currentOrders) {
                    if (order.getProductId() == productId) {
                        order.setQuantity(newQuantity);
                        break;
                    }
                }
            }
            session.setAttribute("currentOrder", currentOrders);
        }
        
        response.sendRedirect("order.jsp"); // Redirect to refresh the page
    }
}