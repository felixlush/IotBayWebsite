<%@page import="java.util.List"%>
<%@page import="iot.isd.model.LogEntry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Account - IOT Bay</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <% 
            User user = (User)session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp"); // Redirects to login if user is not in session
            }
        %>
        
        <%@ include file="header.jsp" %>
        
        <div class="main">
            <h2>User Profile</h2>
            <div class="user-table-container">
                <a href="editUser.jsp">
                    <button class="edit-button">Edit Profile</button>
                </a>
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th> <!-- Consider security implications of displaying passwords -->
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>*******</td> <!-- It's safer to mask the password -->
                            <td>${user.address}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <h2>User Logs</h2>
            <div class="user-table-container">
                <div class="search-container">
                    <form action="SearchUserLogsServlet" method="get">
                        <input type="date" name="searchDate" placeholder="Select a date">
                        <button type="submit">Search</button>
                    </form>
                </div>
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Email</th>
                            <th>Login Time</th>
                            <th>Logout Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<LogEntry> logs = (List<LogEntry>) request.getAttribute("logs");
                            if (logs == null) {
                                logs = (List<LogEntry>) session.getAttribute("logs");
                            }
                            if (logs != null){
                                for (LogEntry log : logs) {
                        %>
                        <tr>
                            <td><%= log.getDate() %></td>
                            <td><%= log.getEmail() %></td>
                            <td><%= log.getLoginTime() %></td>
                            <td><%= log.getLogoutTime() %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="2">No logs found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>                    
                </table>
            </div>
            <a href="deleteUserServlet">
                    <button style="">Delete Account</button>
            </a>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
