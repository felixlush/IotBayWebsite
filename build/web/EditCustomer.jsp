<%-- 
    Document   : EditCustomer
    Created on : 16/05/2024, 6:56:54 PM
    Author     : henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/MyCSS.css">
        <title>Edit Customer</title>
    </head>
    <body>
        <% 
            String nameErr = (String)session.getAttribute("nameErr");
            String passErr = (String)session.getAttribute("passErr");
            String editedUser = (String)session.getAttribute("editedUser");
        %>
        <%@ include file="header.jsp" %>
        <h1>Create New User <%=(editedUser != null ? editedUser : "")%></h1>
        <form action="EditCustomerServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" required><br>
            <label for="password">Password:</label>
            <input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" id="password" name="password" required><br>
            <label for="phone">Address</label>
            <input type="text" placeholder="EnterAddress" id="address" name="address" required><br>
            <input type="hidden" name="email" value="<%=request.getParameter("email")%>">
            <button type="submit">Edit</button>
        </form>
        <%@include file="footer.jsp" %>  
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
