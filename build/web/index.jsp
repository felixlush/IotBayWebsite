<%-- 
    Document   : index
    Created on : 26 Mar 2024, 10:23:34 am
    Author     : thebigmoney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HomePage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user"); %>
        <div class="main-container">
            <div class="header">
                <h2>Welcome to IOT Bay!</h2>
                <img src="https://i.pinimg.com/736x/33/4e/06/334e063ae9f247704b37549b4b0f47d1.jpg" width="500" alt="IoTLogo"/>               
            </div>
            <% if (user == null || user.loggedin == false ) { %>
                <div class="option-card">
                    <div class="option">
                        <a href="login.jsp" class="custom-button">Login</a>
                        <p>Already have an account?<p>
                    </div>
                    <div class="option">
                        <a href="register.jsp" class="custom-button">Register</a>
                        <p>New to IoT Bay?<p>
                    </div>
                </div>
            <% } else { %>
                <p>You are currently logged in as ${user.email}</p>
                <div class="option-card">
                    <div class="option">
                        <a href="main.jsp" class="custom-button">Account Details</a>
                    </div>
                    <div class="option">
                        <a href="logout.jsp" class="custom-logout-button">Logout</a>
                    </div>
                </div>
            <% } %>
            <a href="/WebApplication1/ConnServlet">Initialize DB Connection</a>
        </div>
        <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>

