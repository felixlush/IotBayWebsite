<%-- 
    Document   : welcome
    Created on : 26 Mar 2024, 10:34:47 am
    Author     : thebigmoney
--%>
<%@page import="iot.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    boolean isRegister = request.getParameter("name") != null;
    
    String name = "", address = "";
    
    if (isRegister){
        name = request.getParameter("name");
        address = request.getParameter("address");  
    }
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <div class="main-container">
            <img src="https://i.pinimg.com/736x/33/4e/06/334e063ae9f247704b37549b4b0f47d1.jpg" width="500" alt="IoT Logo"/>
            <div class="details-container">
                <%
                    if (isRegister){ %>
                        <div>
                            <p>Thanks for registering <%= name %></p>
                            <p>Address: <%= address %></p>
                            <p>Email: <%= email %></p>
                        </div>
                    <% } else { %>
                        <div>
                            <p>Welcome back: <%= email%>
                        </div>
                <%}%>
            </div>
            <div>
                <a href="index.jsp" class="custom-button">Home</a>
<!--                <a href="main.jsp" class="custom-button" style="margin-top: 60px;">Main</a>-->
            </div>
        </div>
        <%
            if (isRegister){
                User user = new User(name, email, password, address);
                session.setAttribute("user", user);
            }
        %>
    </body>
</html>
