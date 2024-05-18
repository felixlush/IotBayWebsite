<%-- 
    Document   : updatePayment
    Created on : 16/05/2024, 6:41:32 PM
    Author     : mcmic
--%>
<%@page import="iot.isd.model.User"%>
<%@page import="iot.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
            <%
            //User user = (User) session.getAttribute("user");
            Payment payment = (Payment) session.getAttribute("payment");
            //String cardName = request.getParameter("cardName");
            //String cardNumber = request.getParameter("cardNumber");
            //String paymentMethod = request.getParameter("paymentMethod");
            Payment updated = (Payment) session.getAttribute("updated");
            %>
    <body>
        <h1>Update your payment details</h1>
        
        <form action="updatePaymentServlet" method="post">
            <table>
                <select name ="paymentMethod">
                    <option>Mastercard</option>
                    <option>Visa</option>
                    <option>Amex</option>
                </select>
                <br/><br/>
                
                <tr><td>Cardholder Name:</td><td><input type="text" name="cardName" value="${payment.getCardName()}" required="true"></td></tr>
                <tr><td>Card Number:</td><td><input type="text" name="cardNumber" value="${payment.getCardNumber()}" required="true"></td></tr>
                <input type="hidden" name="paymentId" value="${payment.getPaymentId()}%>">
                <input type="hidden" name="paymentMethod" value="${payment.getPaymentMethod()}%>">
                <input type="hidden" name="paymentDate" value="${payment.getDate()}%>">
                <input type="hidden" name="orderId" value="${payment.getOrderId()}%>">
                <input type="hidden" name="email" value="${payment.getEmail()}%>">
                
            </table>
                
            <div>
                <a href="main.jsp">Cancel</a>
                
                <input type="submit" value="Update">
            </div>
            
        </form>
    </body>
</html>
