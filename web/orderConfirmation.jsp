<%-- 
    Document   : orderConfirmation
    Created on : 17/05/2024, 9:13:13 AM
    Author     : thebigmoney
--%>

<%@page import="iot.isd.model.Order"%>
<%@page import="iot.isd.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <% User user = (User) session.getAttribute("user"); %>
    <%@ include file="header.jsp" %>
    <div class="main">        
            <h1>Thanks for your purchase!<h1>
            <h2>Your order has been confirmed!<h2>
            <button><a href="index.jsp">Continue Shopping</a></button>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>

