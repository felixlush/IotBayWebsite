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
<%@page import="iot.isd.controller.PaymentList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment List</title>
        <link rel="stylesheet" href="styles/main.css">
        <div class="main-container">
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
            //Payment newPayment = (Payment)session.getAttribute("newPayment");
            //User user = (User)session.getAttribute("user");
            //String email = newPayment.getEmail();
           
            //ArrayList<Payment> paymentList = null;
           
            ArrayList<Payment> paymentList = (ArrayList<Payment>) session.getAttribute("paymentList");
//            try {
//               DBManager manager = (DBManager) session.getAttribute("manager");
//               // paymentList = manager.getPaymentList(email);
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
            if (paymentList != null & !paymentList.isEmpty()){
            for (Payment payment : paymentList) {
//                if (payment.getDate() != null) {
        %>
            <tr>
                <td><%= payment.getPaymentId() %></td>
                <td><%= payment.getCardName() %></td>
                <td><%= payment.getCardNumber() %></td>
                <td><%= payment.getPaymentMethod() %></td>
                <td><%= payment.getAmount() %></td>
                <td><%= payment.getDate() %></td>
                <td><%= payment.getEmail() %></td>
            </tr>
        <%
            }
        }  else { 
        
        %>
        <td>No payments found</td>
         <%
            }        
        %>
        <a href="payment.jsp" class="custom-button" style="margin-top: 60px;">Return</a>
    </table>
</body>
</div>
</html>