<%@page import="iot.isd.model.Product"%>
<%@page import="java.util.List"%>
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
    <jsp:include page="/ConnServlet" flush="true" />
    <jsp:include page="/FeaturedProductsServlet" flush="true" />
    <%@include file="header.jsp"%>

    <div class="main">
        <h2>Featured Products</h2>
        <div class="product-grid">
            <% 
                List<Product> products = (List<Product>) session.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    int count = 0; // Initialize counter to track the number of displayed products
                    for (Product product : products) {
                        if (count >= 3) break; // Stop the loop after displaying three products
            %>
            <div class="product">
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                <h3><%= product.getName() %></h3>
                <p>$<%= product.getPrice() %></p>
                <form action="purchaseProductPageServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getID() %>">
                    <input type="hidden" name="productName" value="<%= product.getName() %>">
                    <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
                    <input type="hidden" name="productImage" value="<%= product.getImageUrl() %>">
                    <input type="submit" class="buy-btn" value="Buy Now">
                </form>
            </div>
            <%
                        count++; // Increment the counter each time a product is displayed
                    }
                } else {
            %>
            <p>No products found.</p>
            <%
                }
            %>
        </div>
    </div>

    <%@include file="footer.jsp"%>

</body>
</html>
