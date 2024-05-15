<!DOCTYPE html>
<%@page import="iot.isd.model.User"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IOT Bay Products</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <% User user = (User)session.getAttribute("user"); %>
    <header>
        <h1>Welcome to IOT Bay!</h1>
        <p>Explore our latest products!</p>
    </header>

    <nav>
        <a href="#">Home</a>
        <a href="products.html">Products</a> <!-- Ensure this is the correct link -->
        <a href="orders.html">My Orders</a>
        <% 
            if (user == null) {
        %>
            <a href="login.jsp">User Login</a>
        <% 
            } else {
        %>
            <a href="userAccount.jsp">My Account</a>    
            <a href="logout.jsp">Logout</a>
        <% 
            }
        %>
        <a href="admin/login.html">Staff Portal</a>
    </nav>
    

    <div class="main">
        <h2>Featured Products</h2>
        <div class="product-grid">
            <div class="product">
                <img src="https://example.com/product1.jpg" alt="Product 1">
                <h3>Smart Home Sensor</h3>
                <p>$49.99</p>
                <a href="#" class="buy-btn">Buy Now</a>
            </div>
            <div class="product">
                <img src="https://example.com/product2.jpg" alt="Product 2">
                <h3>Energy Efficient LED Bulb</h3>
                <p>$19.99</p>
                <a href="#" class="buy-btn">Buy Now</a>
            </div>
            <div class="product">
                <img src="https://example.com/product3.jpg" alt="Product 3">
                <h3>Wireless Doorbell Camera</h3>
                <p>$99.99</p>
                <a href="#" class="buy-btn">Buy Now</a>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>© 2024 IOT Bay. All rights reserved.</p>
    </footer>
    <jsp:include page="/ConnServlet" flush="true" />
</body>
</html>
