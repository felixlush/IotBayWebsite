<%-- 
    Document   : CustomerInformationManagement
    Created on : 14/05/2024, 10:17:10 PM
    Author     : henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css">
        <title>Customer Information Management</title>
    </head>
    
    <body>
        <%
            String deletedUser = (String)session.getAttribute("deletedUser");
            User user = (User)session.getAttribute("user");
        %>
        <%@ include file="header.jsp" %>
        <div class="login-form-container">
            <h1 class="centerElement">Customer Management <%=(deletedUser != null ? deletedUser : "")%></h1>
            <a href="CreateCustomer.jsp"><button class="button centerButton">Create Customer</button></a><br><br><br>
            <form action="CustomerInformationManagementServlet" method="post">
                <table id="form-table" style="margin-left:auto;margin-right:auto;">
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" placeholder="Enter name" id="name" name="name"><br></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" placeholder="Enter email" id="email" name="email"><br></td>
                    </tr>
                </table>
                <br>
                <button class="button centerButton" type="submit">List Customers</button>
                <p>Press the button above to refresh the results after adding, editing or deleting.</p>
            </form>
        </div>
        <% ArrayList<User> listOfUsers = (ArrayList<User>)session.getAttribute("listOfUsers");%>

        
        <table class="user-table">
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Password</th>
                <th>phone</th>
                <th>Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <% if (listOfUsers != null) { %>
                <% for (User currentUser : listOfUsers) { %>
                <tr>
                    <td><%=currentUser.getEmail()%></td>
                    <td><%=currentUser.getName()%></td>
                    <td><%=currentUser.getPassword()%></td>
                    <td><%=currentUser.getAddress()%></td>
                    <td><%=currentUser.getStatus()%></td>
                    <td><form action="EditCustomerServlet" method="post"><input type="hidden" name="email" value="<%=currentUser.getEmail()%>"><button class="button centerButton" type="submit">Edit</button></form></td>
                    <td><form action="DeleteCustomer" method="post"><input type="hidden" name="email" value="<%=currentUser.getEmail()%>"><button class="button centerButton" type="submit">Delete</button></form></td>
                </tr>
                <% } %>
            <% } else { %>
                <tr>
                    <td>Press the button above to fetch results.</td>
                </tr>
            <% } %>
        </table>
        <br><br>
        <%@include file="footer.jsp" %>  
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
