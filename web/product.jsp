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
    

    
    <%
        boolean isStaff = false;
        if (user != null && user.getType().equals("CUSTOMER") == false) {
            isStaff = true;
        }
       
    %>
                

    <div class="main">
        <div class="searchForm-container">
            <h2>Products</h2>
            <form action="ProductSearchServlet" method="get">
                <input type="text" name="search" placeholder="Search products by category">
                <input type="submit" value="Search">
            </form>
        </div>
        
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
                    <p>Category: <%= product.getCategory() %></p>
                    <form action="purchaseProductPageServlet" method="post">
                        <input type="hidden" name="productId" value="<%= product.getID() %>">
                        <input type="hidden" name="productName" value="<%= product.getName() %>">
                        <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
                        <input type="hidden" name="productImage" value="<%= product.getImageUrl() %>">
                        <input type="submit" class="buy-btn" value="Buy Now">
                    </form>
                    <%
                    if (isStaff) {
                    %>
                    <h3>Staff Controls</h3>
                    <div class="button-box">
                        <form action="ProductDeleteServlet" method="post">
                            <input type="hidden" name="productId" value="<%= product.getID() %>">
                            <input type="submit" class="delete-btn" value="Delete product">
                        </form>
                        <form action="ProductSelectServlet" method="post">
                            <input type="hidden" name="productId" value="<%= product.getID() %>">
                            <input type="submit" class="edit-btn" value="Edit product">
                        </form>
                    </div>
                    <%
                    }
                    %>
                </div>
            <%
                    }
            %>
        </div>
        <%
        if (isStaff) {
        %>
            <h3>Staff Product Creation Portal</h3>
            <form action="ProductCreateServlet" method="post">
                <input type="text" name="productId" placeholder="ID">
                <input type="text" name="productName" placeHolder="Name">
                <input type="text" name="productType" placeHolder="Category">
                <input type="text" name="productPrice" placeHolder="Price">
                <input type="text" name="productQuantity" placeHolder="Quantity">
                <input type="text" name="productImage" placeHolder="Image URL">
                <input type="submit" value="Create new product">
            </form>
        <%
        }
        %>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
