<%-- 
    Document   : payment
    Created on : 16/05/2024, 3:51:42 PM
    Author     : mcmic
--%>
<%@ page import="iot.isd.controller.PaymentServlet"%>
<%@ page import="iot.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Fill out payment form</h1>
        
        <form action="PaymentServlet" method="post">
            <table>
                <select name ="paymentMethod">
                    <option>Mastercard</option>
                    <option>Visa</option>
                    <option>Amex</option>
                </select>
                <br/><br/>
                
                <tr><td>Cardholder Name:</td><td><input type="text" placeholder="Enter Cardholder Name" name="cardName" required="true"></td></tr>
                <tr><td>Card Number:</td><td><input type="text" placeholder="Enter Card Number" name="cardNumber" required="true"></td></tr>
                <tr><td>Payment Amount:</td><td><input type="text" placeholder="Enter Amount" name="amount" required="true"></td></tr>
            </table>
                
            <div>
                <a href="main.jsp">Cancel</a>
                
                <input type="submit" value="Pay">
            </div>
            
        </form>
    </body>
</html>