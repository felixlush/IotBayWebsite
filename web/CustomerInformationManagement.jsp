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
        <link rel="stylesheet" href="styles/MyCSS.css">
        <title>Customer Information Management</title>
    </head>
    
    <body>
        <%String deletedUser = (String)session.getAttribute("deletedUser");%>
        <%@ include file="header.jsp" %>
        <h1>Customer Management <%=(deletedUser != null ? deletedUser : "")%></h1>
        <a href="CreateCustomer.jsp"><button class="button">Create Customer</button></a>
        <form action="CustomerInformationManagementServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" placeholder="Enter name" id="name" name="name"><br>
            <label for="name">Email:</label>
            <input type="text" placeholder="Enter email" id="email" name="email"><br>
            <button type="submit">List Customers</button>
        </form>
        <% ArrayList<User> listOfUsers = (ArrayList<User>)session.getAttribute("listOfUsers");%>

        
        <table>
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
                <% for (User user : listOfUsers) { %>
                <tr>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getName()%></td>
                    <td><%=user.getPassword()%></td>
                    <td><%=user.getAddress()%></td>
                    <td><%=user.getActivated()%></td>
                    <td><form action="EditCustomerServlet" method="post"><input type="hidden" name="email" value="<%=user.getEmail()%>"><button type="submit">Edit</button></form></td>
                    <td><form action="DeleteCustomer" method="post"><input type="hidden" name="email" value="<%=user.getEmail()%>"><button type="submit">Delete</button></form></td>
                </tr>
                <% } %>
            <% } %>
        </table>
        <%@include file="footer.jsp" %>  
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
