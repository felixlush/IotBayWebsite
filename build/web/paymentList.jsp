<%-- 
    Document   : paymentList
    Created on : 16/05/2024, 9:55:06 PM
    Author     : mcmic
--%>

<%@page import="iot.isd.model.User"%>
<%@page import="iot.isd.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iot.isd.model.Payment"%>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Payments List</h1>
        
        <%
//            HttpSession session = request.getSession();
//            User user = (User)session.getAttribute("user");
//            DBManager manager = (DBManager) session.getAttribute("manager");
//            ArrayList<Payment> paymentList = manager.getPaymentList(email);
        %>
        <h1>Payment List</h1>
    <table border="1">
        <tr>
            <th>Payment ID</th>
            <th>Card Name</th>
            <th>Card Number</th>
            <th>Payment Method</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Order ID</th>
            <th>Email</th>
        </tr>
        <%
            User user = (User)session.getAttribute("user");
            String email = user.email;
            
            
            ArrayList<Payment> paymentList = null;
            try {
               DBManager manager = (DBManager) session.getAttribute("manager");
                paymentList = manager.getPaymentList(email);
            } catch (SQLException e) {
                // Handle exceptions
                e.printStackTrace();
            }
            
            // Iterate over the paymentList and display each payment
            for (Payment payment : paymentList) {
        %>
            <tr>
                <td><%= payment.getPaymentId() %></td>
                <td><%= payment.getCardName() %></td>
                <td><%= payment.getCardNumber() %></td>
                <td><%= payment.getPaymentMethod() %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getDate() %></td>
                <td><%= payment.getOrderId() %></td>
                <td><%= payment.getEmail() %></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
        
        
        
        
    </body>
</html>
