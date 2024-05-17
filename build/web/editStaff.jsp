<%-- 
    Document   : editStaff
    Created on : 16/05/2024, 6:45:57 PM
    Author     : julio
--%>

<%@page import="iot.isd.model.User"%>
<%@page import= "iot.isd.controller.EditStaffServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>
        <%  User user = (User) session.getAttribute("user");
            User userToUpdate = (User) session.getAttribute("staffUserUpdated");
            String updateMessage = (String) session.getAttribute("update");
        %>
        
        <%@include file="header.jsp" %>
        <div class="main">
            <h1>Edit your details</h1>
            <div class ="user-table-container">
                <h3>Edit Your Information: <span class="message error-message"> <%=(updateMessage != null ? updateMessage : "")%></span></h3>
                <form method="post" action="FinaliseStaffUpdatesServlet">
                    <table class="user-table" id="update-user-form">
                        <tr>
                            <td>Full Name:</td>
                            <td><input type="text" name="name" value="${userToUpdate.getName()}"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" value="${userToUpdate.getEmail()}"></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="text" name="password" value="${userToUpdate.getPassword()}"></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td><input type="text" name="address" value="${userToUpdate.getAddress()}"></td>
                        </tr>
                        <tr>
                            <td>Position:</td>
                            <td><input type="text" name="position" value="${userToUpdate.getPosition()}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input class="button" type="submit" value="Update">
                            </td>
                        </tr>
                    </table
                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>