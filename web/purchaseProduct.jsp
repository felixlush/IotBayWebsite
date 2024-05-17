<%-- 
    Document   : purchaseProduct
    Created on : 16/05/2024, 4:54:41 PM
    Author     : thebigmoney
--%>

<%@page import="iot.isd.model.Product"%>
<%@page import="iot.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Product</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <%User user = (User) session.getAttribute("user");%>
    <%@include file="header.jsp" %>
    <div class="main">
        <h1>Purchase Your Product</h1>
        <div class="product-details">
            <% 
                
                Product selectedProduct = (Product) session.getAttribute("selectedProduct");
                if (selectedProduct != null) {
            %>
                <div class="product">
                    <img src="<%= selectedProduct.getImageUrl() %>" alt="Image of <%= selectedProduct.getName() %>" style="max-width: 300px;">
                    <h2><%= selectedProduct.getName() %></h2>
                    <p class="price">$<%= selectedProduct.getPrice() %></p>
                    <!-- Additional product details could be added here -->
                    <form action="AddToOrderServlet" method="post">
                        <input type="hidden" name="productId" value="<%= selectedProduct.getID() %>">
                        <input type="hidden" name="productPrice" value="<%= selectedProduct.getPrice() %>">
                        <input type="hidden" name="productName" value="<%= selectedProduct.getName() %>">       
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" min="1" value="1">
                        <br><br>
                        <input type="submit" value="Add to Cart">
                    </form>
                </div>
            <% 
                } else {
            %>
                <p>Product information is not available. Please try again later.</p>
            <% 
                }
            %>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
