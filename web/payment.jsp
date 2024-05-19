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
        <%@ include file="header.jsp" %>
        <div class="main">
            <h1>Payment Details</h1>
            <div class="user-table-container">
                <h2>Saved Payment Details</h2> 
    <!--            <form action="editPayment.jsp" method="post">-->
            <table class="user-table">
            <tr>
                <th>Pay</th>
                <th>Cardholder Name</th>
                <th>Card Number</th>
                <th>Payment Method</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%

                Payment newPayment = (Payment)session.getAttribute("newPayment");
    //            List<Payment> currentPayment = (List<Payment>)session.getAttribute("currentPayment");
    //                if (currentPayment != null && !currentPayment.isEmpty()){
    //                    for (Payment payment : currentPayment) {
                if (newPayment != null){
            %>

            <tr>

                    <td>
                        <form action="PaymentServlet" method="post">
                        <input type="hidden" name="cardName" value="<%= newPayment.getCardName()%>">
                        <input type="hidden" name="cardNumber" value="<%= newPayment.getCardNumber()%>">
                        <input type="hidden" name="paymentMethod" value="<%= newPayment.getPaymentMethod()%>">
                        <input type="submit" class="custom-logout-button" style="margin-top: 60px;" value="Pay With This Card">
                     </form>
                    </td> 

                    <td><%= newPayment.getCardName() %></td>
                    <td><%= newPayment.getCardNumber() %></td>
                    <td><%= newPayment.getPaymentMethod() %></td>


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
            <a href="/addPayment" class="button"> Cancel </a>
            </table>
            <%                    
              }
            %>
            <form action="PaymentList" method="get">
                <input type="hidden" name="email" value="<%= newPayment.getEmail()%>">
                    <input class="button" type="submit" value="See Payment History">
            </form>
        </div>

    </body>
</html>