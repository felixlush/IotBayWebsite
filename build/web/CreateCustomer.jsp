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
        <link rel="stylesheet" href="styles/main.css">
        <title>Create new customer</title>
    </head>
    <body>
        <% 
            String emailErr = (String)session.getAttribute("emailErr");
            String nameErr = (String)session.getAttribute("nameErr");
            String passErr = (String)session.getAttribute("passErr");
            String createdUser = (String)session.getAttribute("createdUser");
            User user = (User)session.getAttribute("user");
        %>
        <%@ include file="header.jsp" %>
        <div class="login-form-container">
            <h1>Create New User <%=(createdUser != null ? createdUser : "")%></h1>
            <form action="CreateCustomerServlet" method="post">
                <table id="form_table">
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" id="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" required></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" id="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" placeholder="Enter Address" id="address" name="address" required><td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button class="button" type="submit">Create</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <%@include file="footer.jsp" %>  
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
