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
    <% Product product = (Product)session.getAttribute("selectedProduct"); %>
    <%@include file="header.jsp"%>
    <jsp:include page="/ConnServlet" flush="true" />
    <jsp:include page="/FeaturedProductsServlet" flush="true" />
                

    <div class="main">
        <div class="product-table-container">
            <div class="header-container">
                <h2>Edit Product</h2>
                <img src="<%=product.getImageUrl()%>" alt="Product Image" class="product-image">
            </div>
            <form action="ProductEditServlet" method="post">
                <table class="product-table">
                    <tr>
                        <th>ID</th>
                        <td>
                            <input type="text" value="<%=product.getID()%>" disabled>
                            <input type="hidden" name="productId" value="<%=product.getID()%>">
                        </td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td>
                            <input type="text" name="productName" value="<%=product.getName()%>">
                        </td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td>
                            <input type="text" name="productCategory" value="<%=product.getCategory()%>">
                        </td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>
                            <input type="text" name="productPrice" value="<%=product.getPrice()%>">
                        </td>
                    </tr>
                    <tr>
                        <th>Quantity</th>
                        <td>
                            <input type="text" name="productQuantity" value="<%=product.getQuantity()%>">
                        </td>
                    </tr>
                    <tr>
                        <th>Image URL</th>
                        <td>
                            <input type="text" name="productImage" value="<%=product.getImageUrl()%>">
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Update Product">
            </form>
        </div>
    </div>



    <%@include file="footer.jsp"%>
</body>
</html>
