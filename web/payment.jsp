<%-- 
    Document   : payment
    Created on : 16/05/2024, 3:51:42 PM
    Author     : mcmic
--%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="iot.isd.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iot.isd.model.User"%>
<%@ page import="iot.isd.controller.PaymentServlet"%>
<%@ page import="iot.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <% 
            String cardErr = (String) session.getAttribute("cardErr");
            String nameErr = (String) session.getAttribute("nameErr");
            //Payment newPayment = (Payment)session.getAttribute("newPayment");
            User user = (User)session.getAttribute("user");
    %>
    
    
    <body>
        
        <h1>Payment Details</h1>
        <div class="user-table-container">
            <h2>Saved Payment Details</h2> 
<!--            <form action="editPayment.jsp" method="post">-->
        <table class="user-table">
        <tr>
            <th>Select</th>
            <th>Cardholder Name</th>
            <th>Card Number</th>
            <th>Payment Method</th>
        </tr>
        <%
            
            Payment newPayment = (Payment)session.getAttribute("newPayment");
//            List<Payment> currentPayment = (List<Payment>)session.getAttribute("currentPayment");
//                if (currentPayment != null && !currentPayment.isEmpty()){
//                    for (Payment payment : currentPayment) {
            if (newPayment != null){
        %>
          
        <tr>
            <form action="PaymentServlet" method="post">
                <td>
                    <input type="hidden" name="paymentId" value="<%= newPayment.getCardName()%>">
                    <input type="hidden" name="paymentId" value="<%= newPayment.getCardNumber()%>">
                    <input type="hidden" name="paymentId" value="<%= newPayment.getPaymentMethod()%>">
                    <input type="submit" class="custom-logout-button" style="margin-top: 60px;" value="Pay With This Card">
                 
                </td> 
               
                <td><%= newPayment.getCardName() %></td>
                <td><%= newPayment.getCardNumber() %></td>
                <td><%= newPayment.getPaymentMethod() %></td>
            </form>
            
            <td>
            <form action="EditPaymentServlet" method="post">
                <input type="hidden" name="paymentId" value="<%= newPayment.getPaymentId()%>">
                <input type="hidden" name="cardNumber" value="<%= newPayment.getCardNumber()%>">
                <input type="hidden" name="cardName" value="<%= newPayment.getCardName()%>">
                <input type="hidden" name="paymentMethod" value="<%= newPayment.getPaymentMethod()%>">
                <input type="submit" value="Edit">
            </form>
            </td>
            <td>
            <form action="DeletePayment" method="post">
                <input type="hidden" name="cardNumber" value="<%= newPayment.getCardNumber()%>">
                <input type="submit" value="Delete">
            </form>
            </td>
            </tr>
            
        <%
            
          } else {
        %>
        <tr>No current payment information available</tr>
        
        </table>
        <%                    
          }
        %>
        
    <h1>Payment List</h1>
    <table class="user-table">
        <tr>
            <th>Payment ID</th>
            <th>Card Name</th>
            <th>Card Number</th>
            <th>Payment Method</th>
            <th>Amount</th>
            <th>Date</th>
            <th>User</th>
        </tr>
        <%
            //User user = (User)session.getAttribute("user");
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
                <td><%= payment.getEmail() %></td>
            </tr>
        <%
            }
        }
        %>
        <a href="order.jsp" class="custom-button" style="margin-top: 60px;">Return</a>
    </table>

            
            </div>
    

           
    
<!--            <a href="PaymentServlet" class="custom-logout-button" style="margin-top: 60px;">Pay</a> -->
                
                
        
    </body>
</html>