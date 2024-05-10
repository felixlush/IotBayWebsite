<%-- 
    Document   : editUser.jsp
    Created on : 08/05/2024, 5:05:37 PM
    Author     : thebigmoney
--%>

<%@page import="iot.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            User updated = (User) session.getAttribute("updated");
        %>
        
        <div class="panel_div">
            <a class="button" href="MainServlet?email='<%=user.getEmail()%>'&password='<%=user.getPassword()%>'"> Main </a>
            <a class="button" href="LogoutController'"> Logout </a>
        </div>
        
        <h1>Edit your details</h1>
        
        <h1>Edit Student Information: <span class=""message"> <%=(updated != null ? updated : "")%></span></h1>
        <form method="post" action="UpdateServlet">
            <table id="form-table">
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" name="name value=${user.name}"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="name value=${user.email}"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="name value=${user.password}"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="name value=${user.address}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input class="button" type="submit" value="Update">
                    </td>
                </tr>
            </table
        </form>
    </body>
</html>
