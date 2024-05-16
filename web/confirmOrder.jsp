<%@page import="iot.isd.model.Order"%>
<%@page import="iot.isd.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Order - IOT Bay</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <%User user = (User) session.getAttribute("user"); %>
    <%@ include file="header.jsp" %>
    <div class="main">
        <h1>Edit and Confirm Your Order</h1>
        <div class="order-details">
            <form action="confirmOrderServlet" method="post">
                <% 
                    
                    List<Order> orders = (List<Order>) session.getAttribute("currentOrder");
                    double total = 0;
                    int totalQuantity = 0;

                    if (orders != null) {
                %>
                <p>Email: <input type="text" name="email" value="<%= user.getEmail() %>" /></p>
                <p>Address: <input type="text" name="address" value="<%= user.getAddress() %>" /></p>
                <p>Date: <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></p>
                <input type="hidden" name="orderDate" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" />
                <table class="order-summary">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 0; %>
                        <% for (Order order : orders) { %>
                        <tr>
                            <td><%= order.getProductId() %></td>
                            <td><%= order.getProductName() %></td>
                            <td><%= order.getQuantity() %></td>
                            <td>$<%= order.getPrice() %></td>
                        </tr>
                        <% total += order.getPrice() * order.getQuantity(); %>
                        <% totalQuantity += order.getQuantity(); %>
                        <% i++; %>
                        <% } %>
                    </tbody>
                </table>
                <input type="hidden" name="numItems" value="<%= i %>" />
                <p>Total Quantity: <%= totalQuantity %></p>
                <p>Total Price: $<%= total %></p>
                <% } else { %>
                <p>No orders found.</p>
                <% } %>
                <button type="submit" class="confirm-button">Update and Confirm Order</button>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
