<%-- 
    Document   : staffList
    Created on : 15/05/2024, 5:39:52 PM
    Author     : julio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="iot.isd.model.LogEntry"%>

<jsp:include page="/StaffListServlet" flush="true" />       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Management - IOT Bay</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <% 
            User user = (User)session.getAttribute("user");
             if (user.email == "admin@uts.edu.") {
                response.sendRedirect("login.jsp"); // Redirects to login if user is not in session
            }
          
        %>
        
    <%@include file="header.jsp" %>
        
        <div class="main">
            <h2>Staff List</h2> 
           
            <div class="user-table-container">
               
                <a href="createStaff.jsp"class="edit-button">Add Account</a>
                <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search by name..">

<table class="user-table">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th> <!-- Consider security implications of displaying passwords -->
            <th>Address</th>
            <th>Position</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <% 
        List<User> staffList = (List<User>) session.getAttribute("staffList");
        if (staffList != null) {
            for (User staff : staffList) {
        %>
        <tr style="background-color: <%= staff.getStatus().equals("INACTIVE") ? "#CCCCCC" : "inherit" %>;">
            <td><%= staff.getName() %></td>
            <td><%= staff.getEmail() %></td>
            <td><%= staff.getPassword() %></td>
            <td><%= staff.getAddress() %></td>
            <td><%= staff.getType() %></td>
            <td><%= staff.getStatus() %></td>
            <td>
                <form action="EditStaffServlet" method="post">
                    <input type="hidden" name="name" value="<%=staff.getName()%>">
                    <input type="hidden" name="email" value="<%=staff.getEmail()%>">
                    <input type="hidden" name="password" value="<%=staff.getPassword()%>">
                    <input type="hidden" name="address" value="<%=staff.getAddress()%>">
                    <input type="hidden" name="type" value="<%=staff.getType()%>">
                    <button type="submit">Edit</button>
                </form>
                <form action="DeleteStaffServlet" method="post">
                    <input type="hidden" name="email" value="<%=staff.getEmail()%>">                         
                    <button type="submit">Delete</button>
                </form>
                <form action="DeactivateStaffServlet" method="post">
                    <input type="hidden" name="email" value="<%=staff.getEmail()%>">                         
                    <button type="submit">Deactivate</button>
                </form> 
                <form action="ReactivateStaffServlet" method="post">
                    <input type="hidden" name="email" value="<%=staff.getEmail()%>">                         
                    <button type="submit">Reactivate</button>
                </form> 
            </td>
        </tr>
        <% 
            }
        } else {
        %>
        <tr>
            <td colspan="7">No Accounts Found</td>
        </tr>
        <% 
        }
        %>
    </tbody>            
</table>

<script>
    function searchTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.querySelector(".user-table");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            tdName = tr[i].getElementsByTagName("td")[0]; // Name column
            tdPosition = tr[i].getElementsByTagName("td")[4]; // Position column
            if (tdName || tdPosition) {
                txtValueName = tdName.textContent || tdName.innerText;
                txtValuePosition = tdPosition.textContent || tdPosition.innerText;
                if (txtValueName.toUpperCase().indexOf(filter) > -1 || txtValuePosition.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>

            </div>
                
                                           
        </body>
        <footer class="footer">
            <p>© 2024 IOT Bay. All rights reserved.</p>
        </footer>
</html>
