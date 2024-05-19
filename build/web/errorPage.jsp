<%-- 
    Document   : errorPage.jsp
    Created on : 19/05/2024, 3:25:23 PM
    Author     : thebigmoney
--%>

<%@page import="iot.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% User user = (User)session.getAttribute("user"); %>
        <%@include file="header.jsp"%>
        <div class="main">
            <h1>Oops! Looks like something went wrong, we're so sorry!</h1>
            <h2>Please navigate home and try again</h2>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
