<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 800px;
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
        ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }
        li {
            margin-bottom: 15px;
        }
        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: aqua;
            color: black;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            width: 200px; /* Uniform width for buttons */
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Product Management System</h1>
        <ul>
            <li><a href="productadd.jsp">Add New Product</a></li>
            <li><a href="productupdate.jsp">Update Product Details</a></li>
            <li><a href="productdelete.jsp">Delete Product</a></li>
            <li><a href="DisplayProductsServlet">View All Products</a></li>
            <li><a href="ReportCriteriaServlet">Generate Reports</a></li>
        </ul>
    </div>
</body>
</html>
