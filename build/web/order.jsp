<%-- 
    Document   : order.jsp
    Created on : 16/05/2024, 6:35:03 PM
    Author     : thebigmoney
--%>

<%@page import="iot.isd.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="iot.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Account - IOT Bay</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <% 
            User user = (User)session.getAttribute("user");
            
//            if (user == null) {
//                response.sendRedirect("login.jsp"); 
//            }
        %>
        <%@ include file="header.jsp" %>
        <jsp:include page="/orderServlet" flush="true" />
        <div class="main">
            <h2>Current Order</h2>
            <div class="user-table-container">
                <a href="confirmOrder.jsp">
                    <button class="edit-button">Checkout</button>
                </a>
        <form action="UpdateOrdersServlet" method="post">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Total Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Order> currentOrder = (List<Order>) session.getAttribute("currentOrder");
                        if (currentOrder != null && !currentOrder.isEmpty()){
                            for (Order order : currentOrder) {
                    %>
                    <tr>
                        <td><%= order.getProductId() %></td>
                        <td><%= order.getProductName() %></td>
                        <td>$<%= order.getPrice() %></td>
                        <td>
                            <input type="hidden" name="productId" value="<%= order.getProductId() %>" />
                            <input type="number" name="quantity" min="1" value="<%= order.getQuantity() %>" />
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4">No orders found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>                    
            </table>
            <input type="submit" value="Update All Orders" />
        </form>

            </div>
            
            <h2>Past Orders</h2>
            <div class="user-table-container">
                <div class="search-container">
                    <form action="orderServlet" method="get">
                        <input type="date" name="searchDate" placeholder="Select a date">
                        <button type="submit">Search</button>
                    </form>
                </div>
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Date</th>
                            <th>Product ID</th>
                            <th>Price</th>
                            <th>Address</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Order> orders = (List<Order>) request.getAttribute("orders");
                            if (orders == null) {
                                orders = (List<Order>) session.getAttribute("orders");
                            }
                            if (orders != null){
                                for (Order order : orders) {
                        %>
                        <tr>
                            <td><%= order.getOrderId() %></td>
                            <td><%= order.getEmail() %></td>
                            <td><%= order.getDate() %></td>
                            <td><%= order.getProductId()%></td>
                            <td><%= order.getPrice() %></td>
                            <td><%= order.getAddress() %></td>
                            <td><%= order.getQuantity() %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="2">No orders found.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>                    
                </table>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
