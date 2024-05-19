<%-- 
    Document   : addPayment
    Created on : 19/05/2024, 12:23:13 AM
    Author     : mcmic
--%>

<%@page import="iot.isd.model.Order"%>
<%@page import="iot.isd.model.Product"%>
<%@page import="iot.isd.model.User"%>
<%@page import="iot.isd.controller.CheckoutServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Product</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <% User user = (User) session.getAttribute("user");%>
    <%@include file="header.jsp" %>
    <div class="main">
        <% 
            String cardErr = (String) session.getAttribute("cardErr");
            String nameErr = (String) session.getAttribute("nameErr");
            
           
    %>
        <h1>Add your payment information</h1>
        <div class="user-table-container">
            <form action="AddPaymentServlet" method="post">
                <input type="hidden" name="price" value="${price}" />
                 <input type="hidden" name="orderId" value="${orderId}" />
                 <input type="hidden" name="email" value="${email}" />
            <table class="user-table">
                <tr>
                <td>Select Payment Method:</td>
                <td><select name ="paymentMethod">
                    <option>Mastercard</option>
                    <option>Visa</option>
                    <option>American Express</option>
                </select></td>
                </tr>
<!--                <br/><br/>-->
                
                <tr><td>Cardholder Name:</td><td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter Cardholder Name")%>" name="cardName" required="true"></td></tr>
                <tr><td>Card Number:</td><td><input type="text" placeholder="<%=(cardErr != null ? cardErr : "Enter Credit Card Number")%>" name="cardNumber" required="true"></td></tr>
                <tr><td>Payment Amount:</td><td>$${price}</td></tr>
                
            </table>
               
           
                <a href="order.jsp">Cancel</a>
                <input type="submit" value="Add Payment Method">
                
                </form>



        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
