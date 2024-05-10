<%-- 
    Document   : login
    Created on : 26 Mar 2024, 10:24:07 am
    Author     : thebigmoney
--%>

<%@page import="iot.isd.controller.Validator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="iot.isd.model.User"%>
<%@page import="iot.isd.controller.LoginServlet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            Validator validator = new Validator();
            validator.clear(session);
        %>
        <div class="main-container">
            <div class="form-card">
                <h2>Login</h2>
                <span style="color:red;"class="message"> <%=(existErr != null ? existErr : "")%></span>
                <form action="LoginServlet" method="post">
                    <table id="form_table">
                        <tr>
                            <td>Email Address:</td>
                            <td>
                                <input type="text" name="email" placeholder="Enter email" required>
                                <% if (emailErr != null) { %>
                                    <div style="color: red;"> <%= emailErr %> </div>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <input type="password" name="password" placeholder="Enter password" required>
                                <% if (passErr != null) { %>
                                    <div style="color: red;"> <%= passErr %> </div>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <a href="CancelServlet" class="button"> Cancel </a>
                            </td>
                            <td>
                                <input class="button" type="submit" value="Login">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>  
    </body>
</html>
