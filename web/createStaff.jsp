<%-- 
    Document   : register
    Created on : 26 Mar 2024, 10:24:13 am
    Author     : thebigmoney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String nameErr = (String) session.getAttribute("nameErr");
            User user = (User) session.getAttribute("user");
        %>
        <div class="main">
            <%@include file="header.jsp" %>
            
            <div class="login-form-container">
                <h1>Create new Staff member</h1>
                <p><span class="message error-message"><%=(existErr != null ? existErr : "")%></span></p>
                <form action="CreateStaffServlet" method="post">
                    <table id="form_table">
                        <tr>
                            <td>Email Address:</td>
                            <td><input type="text" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" name="email" required></td> 
                        </tr>
                        <tr>
                            <td>Full Name:</td>
                            <td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" name="name" required></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" name="password" required></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" placeholder="<%=(passErr != null ? passErr : "Enter address")%>" name="address" required></td>
                        </tr>
                        <tr>
                            <td>Position:</td>
                            <td><input type="text" placeholder="Enter address" name="position" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <button type="submit"> Create </button>
                            </td>
                            <td>
                                <a href="CancelServlet" class="button"> Cancel </a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
                            <jsp:include page="/connServlet" flush ="true"/>
            <%@include file="footer.jsp" %>
                
        </div>
    </body>
</html>
