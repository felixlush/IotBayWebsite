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
    <%@include file="header.jsp"%>
    <jsp:include page="/ConnServlet" flush="true" />
    <jsp:include page="/FeaturedProductsServlet" flush="true" />

    <div class="main">
        <h2>Products</h2>
        <div class="product-grid">
            <%
                List<Product> products = (List<Product>) session.getAttribute("products");
                if (products != null)
                    for (Product product : products) {
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
                    }
            %>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
