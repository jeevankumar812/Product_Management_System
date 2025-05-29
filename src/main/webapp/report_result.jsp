<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 900px;
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
        h2 {
            color: #0056b3;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #17a2b8;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .no-results {
            text-align: center;
            color: #666;
            margin-top: 20px;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
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
        <h1>Report Results</h1>
        <% String reportTitle = (String) request.getAttribute("reportTitle"); %>
        <% String message = (String) request.getAttribute("message"); %>

        <% if (message != null) { %>
            <div class="message">
                <%= message %>
            </div>
        <% } else if (reportTitle != null && !reportTitle.isEmpty()) { %>
            <h2><%= reportTitle %></h2>
            <%
                List<Product> reportProducts = (List<Product>) request.getAttribute("reportProducts");
                if (reportProducts != null && !reportProducts.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product product : reportProducts) { %>
                            <tr>
                                <td><%= product.getProductID() %></td>
                                <td><%= product.getProductName() %></td>
                                <td><%= product.getCategory() %></td>
                                <td>&#x20B9;<%= String.format("%.2f", product.getPrice()) %></td>
                                <td><%= product.getQuantity() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <%
                } else {
            %>
                <p class="no-results">No products found for this report criteria.</p>
            <%
                }
            %>
        <% } else { %>
            <p class="no-results">No report generated or invalid criteria.</p>
        <% } %>
        <a href="ReportCriteriaServlet" class="back-link">Generate Another Report</a>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>
