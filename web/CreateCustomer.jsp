<%-- 
    Document   : CreateCustomer
    Created on : 14/05/2024, 10:43:52 PM
    Author     : henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/MyCSS.css">
        <title>Create new user</title>
    </head>
    <body>
        <% 
            String emailErr = (String)session.getAttribute("emailErr");
            String nameErr = (String)session.getAttribute("nameErr");
            String passErr = (String)session.getAttribute("passErr");
            String createdUser = (String)session.getAttribute("createdUser");
            User user = new User("a@gmail.com", "a", "a", "a");
        %>
        <%@ include file="header.jsp" %>
        <h1>Create New User <%=(createdUser != null ? createdUser : "")%></h1>
        <form action="CreateCustomerServlet" method="post">
            <label for="email">Email:</label>
            <input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" id="email" name="email" required><br>
            <label for="name">Name:</label>
            <input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" required><br>
            <label for="password">Password:</label>
            <input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" id="password" name="password" required><br>
            <label for="address">Address</label>
            <input type="text" placeholder="Enter Address" id="address" name="address" required><br>
            <button type="submit">Create</button>
        </form>
        <%@include file="footer.jsp" %>  
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
