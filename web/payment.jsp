<%-- 
    Document   : payment
    Created on : 16/05/2024, 3:51:42 PM
    Author     : mcmic
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="iot.isd.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iot.isd.model.User"%>
<%@ page import="iot.isd.controller.PaymentServlet"%>
<%@ page import="iot.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        
        <h1>Payment Details</h1>
        <div class="main-container">
            <h2>Saved Payment Details</h2> 
<!--            <form action="editPayment.jsp" method="post">-->
        <table border="0">
        <tr>
            <th>Select</th>
            <th>Cardholder Name</th>
            <th>Card Number</th>
            <th>Payment Method</th>
        </tr>
        <%
            User user = (User)session.getAttribute("user");
            String email = user.email;
            
            
            ArrayList<Payment> paymentList = null;
            try {
               DBManager manager = (DBManager) session.getAttribute("manager");
                paymentList = manager.getPaymentList(email);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            int index = 0;
            for (Payment payment : paymentList) {
        %>
          
        <tr>
            <form action="PaymentServlet" method="post">
                <td>
                    <input type="radio" name="selectedPayment" value="<%= payment.getCardNumber() %>"onclick="document.getElementById('selectedCardNumber').value=this.value">
            
                </td> 
               
                <td><%= payment.getCardName() %></td>
                <td><%= payment.getCardNumber() %></td>
                <td><%= payment.getPaymentMethod() %></td>
            </form>
            
            <td>
            <form action="EditPaymentServlet" method="post">
                <input type="hidden" name="paymentId" value="<%= payment.getPaymentId()%>">
                <input type="hidden" name="cardNumber" value="<%= payment.getCardNumber()%>">
                <input type="hidden" name="cardName" value="<%= payment.getCardName()%>">
                <input type="hidden" name="paymentMethod" value="<%= payment.getPaymentMethod()%>">
                <input type="submit" value="Edit">
            </form>
            </td>
            <td>
            <form action="DeletePayment" method="post">
                <input type="hidden" name="cardNumber" value="<%= payment.getCardNumber()%>">
                <input type="submit" value="Delete">
            </form>
            </td>
            </tr>
            
        <%
            index++;
                    
          }
        %>
    </table>

        
   <div class="form-card">
        <h2>Create New Payment Details</h2> 
        <form action="AddPaymentServlet" method="post">
            <table>
                <tr>
                <td>Select Payment Method:</td>
                <td><select name ="paymentMethod">
                    <option>Mastercard</option>
                    <option>Visa</option>
                    <option>Amex</option>
                </select> </td>
                </tr>
<!--                <br/><br/>-->
                
                <tr><td>Cardholder Name:</td><td><input type="text" placeholder="Enter Cardholder Name" name="cardName" required="true"></td></tr>
                <tr><td>Card Number:</td><td><input type="text" placeholder="Enter Card Number" name="cardNumber" required="true"></td></tr>
<!--                <tr><td>Payment Amount:</td><td><input type="text" placeholder="Enter Amount" name="amount" required="true"></td></tr>-->
            </table>
               
           
                <a href="main.jsp">Cancel</a>
                <input type="submit" value="Add Payment Method">
                
                </form>
           </div>
            
            </div>
    
            <form action="PaymentServlet" method="post">
                <input type="hidden" id="selectedCardNumber" name="selectedCardNumber" value="">
                <input type="submit" class="custom-logout-button" style="margin-top: 60px;" value="Pay">
            </form>
    
           
    
<!--            <a href="PaymentServlet" class="custom-logout-button" style="margin-top: 60px;">Pay</a> -->
                
                
        
    </body>
</html>