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
        <h2>Edit Product</h2>
            <table>
                <tr>
                    <th>
                        <h3>ID</h3>
                    </th>
                    <th>
                        <h3>Name</h3>
                    </th>
                    <th>
                        <h3>Category</h3>
                    </th>
                </tr>
                <tr>
                    <td>
                        <p><%=product.getID()%></p>
                    </td>
                    <td>
                        <p><%=product.getName()%></p>
                    </td>
                    <td>
                        <p><%=product.getCategory()%></p>
                    </td>
                </tr>
            </table>
       
            <form action="ProductEditServlet" method="post">
                <input type="text" placeholder="ID" disabled>
                <input type="text" name="productName" placeHolder="Name">
                <input type="text" name="productType" placeHolder="Category">
                <input type="text" name="productPrice" placeHolder="Price">
                <input type="text" name="productQuantity" placeHolder="Quantity">
                <input type="text" name="productImage" placeHolder="Image URL">
                <input type="hidden" name="productId" value="<%=product.getID()%>">
                <input type="submit" value="Update Product">
            </form>
        
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
