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

                <nav>
                    <a href="index.jsp">Home</a>
                    <a href="product.jsp">Products</a>
                    <a href="order.jsp">My Orders</a>
                    <% if (user != null) { 
                        if (user.getType().equals("CUSTOMER")) { %>
                            <a href="LogoutController">Logout</a>
                            <a href="userAccount.jsp">My Account</a>
                        <% } else { %>
                            <a href="staffList.jsp">Staff Admin</a>
                            <a href="userAccount.jsp">My Account</a>
                            <a href="LogoutController">Logout</a>
                    <%          }
                        } else { %>
                        <a href="login.jsp">Login</a>
                        <a href="register.jsp">Register</a>
                    <% } %>
                </nav>
            </header>
        </body>
</html>
