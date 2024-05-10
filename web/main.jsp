<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
            if (user == null) {
                throw new IllegalStateException("User not set in session");
            }
        %>
    <div class="main-container">
        <h2>User Profile</h2>
        
        <div class="panel_div">
            <a class="button" href="MainServlet?email='<%=user.getEmail()%>'&password='<%=user.getPassword()%>'"> Main </a>
            <a class="button" href="LogoutController"> Logout </a>
        </div>
        
        <table class="user-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.address}</td>
                </tr>
            </tbody>
        </table>
        <a href="index.jsp" class="custom-button" style="margin-top: 60px;">Home</a>
        <a href="LogoutController" class="custom-logout-button" style="margin-top: 60px;">Logout</a> 
    </div>
    </body>
</html>

