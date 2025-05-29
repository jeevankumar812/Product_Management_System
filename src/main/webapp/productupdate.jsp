<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #0056b3;
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            display: grid;
            gap: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #ffc107;
            color: #333;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e0a800;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Product Details</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Failed") || message.contains("not found") ? "error-message" : "" %>">
                <%= message %>
            </div>
        <% } %>

        <% Product product = (Product) request.getAttribute("product"); %>

        <form action="UpdateProductServlet" method="post">
            <label for="productID">Product ID:</label>
            <input type="number" id="productID" name="productID" value="<%= (product != null) ? product.getProductID() : "" %>" required>

            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" value="<%= (product != null) ? product.getProductName() : "" %>" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= (product != null) ? product.getCategory() : "" %>" required>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" value="<%= (product != null) ? product.getPrice() : "" %>" required>

            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="<%= (product != null) ? product.getQuantity() : "" %>" required>

            <input type="submit" value="Update Product">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>
