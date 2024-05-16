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
        <title>Payment List</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
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
            <th>User</th>
        </tr>
        <%
            User user = (User)session.getAttribute("user");
            String email = user.email;
            
            
            ArrayList<Payment> paymentList = null;
            try {
               DBManager manager = (DBManager) session.getAttribute("manager");
                paymentList = manager.getPaymentList(email);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
            for (Payment payment : paymentList) {
                if (payment.getDate() != null) {
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
        }
        %>
    </table>
</body>
</html>