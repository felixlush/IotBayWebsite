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
        <!-- Search Form for Product Categories -->
        <form action="getProductByCategoryServlet" method="get" class="search-form">
            <label for="category">Enter a category:</label>
            <input type="text" name="category" id="searchString" placeholder="Type a category (e.g., Electronics)" />
            <button type="submit">Search</button>
        </form>
        <div class="product-grid">
            <% List<Product> products = (List<Product>) session.getAttribute("products");
               if (products != null) {
                   for (Product product : products) {
            %>
            <div class="product">
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                <h3><%= product.getName() %></h3>
                <p>$<%= product.getPrice() %></p>
<!--                <p>Category: <%= product.getCategory() %></p> -->
                <!-- form to purchase product -->
            </div>
            <%
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
