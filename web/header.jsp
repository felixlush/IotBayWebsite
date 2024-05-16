<%-- 
    Document   : header
    Created on : 16/05/2024, 9:16:56 AM
    Author     : thebigmoney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
        <body>
            <header>
                <h1>Welcome to IOT Bay!</h1>
<!--                <img src="/Resources/iotLogo.png" alt="alt"/>-->
                <nav>
                    <a href="index.jsp">Home</a>
                    <a href="products.html">Products</a>
                    <a href="orders.html">My Orders</a>
                    <% if (user != null) { %>
                        <a href="LogoutController">Logout</a>
                        <a href="userAccount.jsp">My Account</a>
                    <% } else { %>
                        <a href="login.jsp">User Login</a>
                        <a href="register.jsp">Register</a>
                    <% } %>
                    <a href="admin/login.html">Staff Portal</a>
                </nav>
            </header>
        </body>
</html>
