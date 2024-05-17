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
    <% User user = (User) session.getAttribute("user"); %>
    <%@ include file="header.jsp" %>
    <div class="main">
        <h1>Edit and Confirm Your Order</h1>
        <div class="order-details">
            <form action="confirmOrderServlet" method="post">
                <% 
                    List<Order> orders = (List<Order>) session.getAttribute("currentOrder");
                    double total = 0;
                    int totalQuantity = 0;
                    
                    if (user == null){
                        user = new User("Anon", "No Email Provided", "No Address Provided");
                    }

                    if (orders != null && !orders.isEmpty()) {
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
                        <% for (int i = 0; i < orders.size(); i++) {
                            Order order = orders.get(i);
                        %>
                        <tr>
                            <td><%= order.getProductId() %></td>
                            <td><%= order.getProductName() %></td>
                            <td>
                                <input type="hidden" name="productId<%= i %>" value="<%= order.getProductId() %>" />
                                <input type="hidden" name="quantity<%= i %>" value="<%= order.getQuantity() %>" />
                                <%= order.getQuantity() %>
                            </td>
                            <td>$<%= order.getPrice() * order.getQuantity() %>
                                <input type="hidden" name="totalPrice<%= i %>" value="<%= order.getPrice() * order.getQuantity() %>" />
                            </td>
                        </tr>
                        <% total += order.getPrice() * order.getQuantity();
                           totalQuantity += order.getQuantity();
                        %>
                        <% } %>
                    </tbody>
                </table>
                <input type="hidden" name="numItems" value="<%= orders.size() %>" />
                <p>Total Quantity: <%= totalQuantity %></p>
                <p>Total Price: $<%= total %></p>
                <% } else { %>
                <p>No orders found.</p>
                <% } %>
                <button type="submit" class="confirm-button">Confirm Order</button>
            </form>
                <td>
                    <a href="CancelOrderServlet" class="button"> Cancel Order </a>
                </td>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
