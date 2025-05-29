<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Reports</title>
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
        select,
        input[type="number"],
        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .input-group {
            display: none; /* Hidden by default */
        }
        input[type="submit"] {
            background-color: #17a2b8;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #138496;
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
        <h1>Generate Product Reports</h1>
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <div class="message <%= message.contains("Invalid") ? "error-message" : "" %>">
                <%= message %>
            </div>
        <% } %>
        <form action="ReportServlet" method="post">
            <label for="reportType">Select Report Type:</label>
            <select id="reportType" name="reportType" onchange="toggleReportFields()">
                <option value="">-- Select Report --</option>
                <option value="priceGreaterThan">Products with Price Greater Than</option>
                <option value="byCategory">Products in a Specific Category</option>
                <option value="topNByQuantity">Top N Products by Quantity</option>
            </select>

            <div id="priceThresholdGroup" class="input-group">
                <label for="priceThreshold">Price Threshold:</label>
                <input type="number" id="priceThreshold" name="priceThreshold" step="0.01">
            </div>

            <div id="categoryGroup" class="input-group">
                <label for="category">Category Name:</label>
                <input type="text" id="category" name="category">
            </div>

            <div id="limitGroup" class="input-group">
                <label for="limit">Number of Top Products (N):</label>
                <input type="number" id="limit" name="limit">
            </div>

            <input type="submit" value="Generate Report">
        </form>
        <a href="index.jsp" class="back-link">Back to Home</a>

        <script>
            function toggleReportFields() {
                var reportType = document.getElementById("reportType").value;
                document.getElementById("priceThresholdGroup").style.display = "none";
                document.getElementById("categoryGroup").style.display = "none";
                document.getElementById("limitGroup").style.display = "none";

                // Clear previous values to avoid sending irrelevant data
                document.getElementById("priceThreshold").value = "";
                document.getElementById("category").value = "";
                document.getElementById("limit").value = "";

                if (reportType === "priceGreaterThan") {
                    document.getElementById("priceThresholdGroup").style.display = "block";
                    document.getElementById("priceThreshold").setAttribute("required", "required");
                    document.getElementById("category").removeAttribute("required");
                    document.getElementById("limit").removeAttribute("required");
                } else if (reportType === "byCategory") {
                    document.getElementById("categoryGroup").style.display = "block";
                    document.getElementById("category").setAttribute("required", "required");
                    document.getElementById("priceThreshold").removeAttribute("required");
                    document.getElementById("limit").removeAttribute("required");
                } else if (reportType === "topNByQuantity") {
                    document.getElementById("limitGroup").style.display = "block";
                    document.getElementById("limit").setAttribute("required", "required");
                    document.getElementById("priceThreshold").removeAttribute("required");
                    document.getElementById("category").removeAttribute("required");
                } else {
                     // No report type selected, remove all required attributes
                    document.getElementById("priceThreshold").removeAttribute("required");
                    document.getElementById("category").removeAttribute("required");
                    document.getElementById("limit").removeAttribute("required");
                }
            }
            // Call on page load to set initial state
            window.onload = toggleReportFields;
        </script>
    </div>
</body>
</html>
