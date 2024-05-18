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
        <link rel="stylesheet" href="styles/main.css">
        <title>Edit Customer</title>
    </head>
    <body>
        <% 
            String passErr = (String)session.getAttribute("passErr");
            String editedUser = (String)session.getAttribute("editedUser");
        %>
        <h1>Edit User <%=(editedUser != null ? editedUser : "")%></h1>
        <form action="EditCustomerServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" placeholder="Enter name" id="name" name="name" required><br>
            <label for="password">Password:</label>
            <input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" id="password" name="password" required><br>
            <label for="phone">Address</label>
            <input type="text" placeholder="EnterAddress" id="address" name="address" required><br>
            <Label for="acrtivated">Activated:</label>
            <select name="status" id="status">
                <option value="True">True</option>
                <option value="False">False</option>
            </select> <br><br>
            <input type="hidden" name="email" value="<%=request.getParameter("email")%>">
            <button type="submit">Edit</button>
        </form>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
