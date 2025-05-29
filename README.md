# Product Management System

**Subject Name**: Advanced Java<br>
**Subject Code** : BCS613D<br>
**Name** : K Jeevan Kumar  
**USN** : 4AL22CS067  
**Sem/Section** : VI/B<br> 


---
A comprehensive web application for managing product inventory built with JSP, Servlets, and MySQL following MVC architecture principles.

## 🚀 Features

- **Complete CRUD Operations**: Add, Update, Delete, and Display product details
- **Advanced Search**: Search product records by Product ID (can be extended to Name, Category)
- **Comprehensive Reports**: Generate various reports including:
  - Products with price above a specified amount
  - Products in a specific category
  - Top N products by sales or quantity (assuming sales/quantity data can be derived or added)
- **Input Validation**: Client-side and server-side validation
- **Professional UI**: Bootstrap-based responsive design
- **MVC Architecture**: Clean separation of concerns
- **Database Integration**: MySQL with JDBC connectivity

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- **Java Development Kit (JDK) 8 or higher**
- **Apache Tomcat 9.0 or higher**
- **MySQL Server 5.7 or XAMP Server**
- **MySQL JDBC Driver (mysql-connector-java)**
- **IDE**: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE
- **Web Browser**: Chrome, Firefox, or Edge

## 🛠️ Project Structure

```
ProductWebApp/
├── src/
│   ├── dao/
│   │   └── ProductDAO.java
│   ├── model/
│   │   └── Product.java
│   └── servlet/
│       ├── AddProductServlet.java
│       ├── UpdateProductServlet.java
│       ├── DeleteProductServlet.java
│       ├── DisplayProductsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
├── WebContent/
│   ├── index.jsp
│   ├── productadd.jsp
│   ├── productupdate.jsp
│   ├── productdelete.jsp
│   ├── productdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── WEB-INF/
│   └── web.xml
└── README.md

```

## 🗄️ Database Setup

### 1. Create Database
```sql
CREATE DATABASE IF NOT EXISTS product_inventory;
USE product_inventory;
```

### 2. Create Table
```sql
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL
);
```

### 3. Insert Sample Data
```sql
INSERT INTO Products VALUES 
(101, 'Laptop Pro X', 'Electronics', 1200.00, 50),
(102, 'Mechanical Keyboard', 'Accessories', 75.50, 150),
(103, 'Wireless Mouse', 'Accessories', 25.00, 300),
(104, 'Gaming Monitor 27"', 'Electronics', 350.00, 80),
(105, 'USB-C Hub', 'Peripherals', 40.00, 200);
```

## ⚙️ Installation & Setup
Download all the project files and organize them according to the project structure above.
