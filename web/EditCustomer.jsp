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
            User user = (User)session.getAttribute("user");
        %>
        <%@ include file="header.jsp" %>
        <div class="login-form-container">
            <h1>Edit User <span class="success-message"><%=(editedUser != null ? editedUser : "")%></span></h1>
            <form action="EditCustomerServlet" method="post">
                <table if="form-table">
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" placeholder="Enter name" id="name" name="name" required></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" id="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" placeholder="Enter Address" id="address" name="address" required></td>
                    </tr>
                    <tr>
                        <td><br>Activated:</td>
                        <td>
                            <br>
                            <select name="status" id="status">
                                <option value="ACTIVE">Active</option>
                                <option value="INACTIVE">Inactive</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><br><input type="hidden" name="email" value="<%=request.getParameter("email")%>"></td>
                        <td><br><button class="button" type="submit">Edit</button></td>
                        <td><br><a href="CustomerInformationManagement.jsp" class="button">Cancel</a>
                    </tr>
                </table>
            </form>
        </div>
        <%@include file="footer.jsp" %> 
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
