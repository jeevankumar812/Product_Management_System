package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Product;

/**
 * ProductDAO.java
 * This class provides methods to interact with the 'Products' table in the database.
 * It handles database connection, adding, updating, deleting, and retrieving product data.
 */
public class ProductDAO {

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/products"; // Replace with your DB URL
    private static final String JDBC_USER = "root"; // Replace with your DB username
    private static final String JDBC_PASSWORD = ""; // Replace with your DB password

    // SQL queries
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO Products (ProductName, Category, Price, Quantity) VALUES (?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products WHERE ProductID = ?";
    private static final String SELECT_ALL_PRODUCTS_SQL = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM Products WHERE ProductID = ?";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE Products SET ProductName = ?, Category = ?, Price = ?, Quantity = ? WHERE ProductID = ?";
    private static final String SELECT_PRODUCTS_BY_PRICE_SQL = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products WHERE Price > ?";
    private static final String SELECT_PRODUCTS_BY_CATEGORY_SQL = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products WHERE Category = ?";
    private static final String SELECT_TOP_N_PRODUCTS_BY_QUANTITY_SQL = "SELECT ProductID, ProductName, Category, Price, Quantity FROM Products ORDER BY Quantity DESC LIMIT ?";


    // Static block to load the JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // For MySQL 8.0+
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver.");
        }
    }

    /**
     * Establishes a connection to the database.
     * @return A Connection object.
     * @throws SQLException If a database access error occurs.
     */
    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    /**
     * Adds a new product to the database.
     * @param product The Product object to be added.
     * @return true if the product was added successfully, false otherwise.
     */
    public boolean addProduct(Product product) {
        boolean rowAffected = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setString(2, product.getCategory());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());

            rowAffected = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAffected;
    }

    /**
     * Retrieves a product by its ID from the database.
     * @param productID The ID of the product to retrieve.
     * @return The Product object if found, null otherwise.
     */
    public Product getProductById(int productID) {
        Product product = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID_SQL)) {
            preparedStatement.setInt(1, productID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String productName = rs.getString("ProductName");
                String category = rs.getString("Category");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                product = new Product(productID, productName, category, price, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    /**
     * Retrieves all products from the database.
     * @return A list of all Product objects.
     */
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String category = rs.getString("Category");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                products.add(new Product(productID, productName, category, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Updates an existing product's details in the database.
     * @param product The Product object with updated details.
     * @return true if the product was updated successfully, false otherwise.
     */
    public boolean updateProduct(Product product) {
        boolean rowAffected = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setString(2, product.getCategory());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setInt(5, product.getProductID());

            rowAffected = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAffected;
    }

    /**
     * Deletes a product from the database based on its ID.
     * @param productID The ID of the product to delete.
     * @return true if the product was deleted successfully, false otherwise.
     */
    public boolean deleteProduct(int productID) {
        boolean rowAffected = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            preparedStatement.setInt(1, productID);

            rowAffected = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAffected;
    }

    /**
     * Retrieves products with a price greater than a specified value.
     * @param priceThreshold The minimum price for products to be retrieved.
     * @return A list of Product objects matching the criteria.
     */
    public List<Product> getProductsByPriceGreaterThan(double priceThreshold) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_PRICE_SQL)) {
            preparedStatement.setDouble(1, priceThreshold);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String category = rs.getString("Category");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                products.add(new Product(productID, productName, category, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Retrieves products belonging to a specific category.
     * @param category The category name to filter products by.
     * @return A list of Product objects matching the category.
     */
    public List<Product> getProductsByCategory(String category) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY_SQL)) {
            preparedStatement.setString(1, category);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String categoryName = rs.getString("Category"); // Use a different variable name
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                products.add(new Product(productID, productName, categoryName, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Retrieves the top N products based on quantity (highest quantity first).
     * @param limit The number of top products to retrieve.
     * @return A list of top N Product objects.
     */
    public List<Product> getTopNProductsByQuantity(int limit) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOP_N_PRODUCTS_BY_QUANTITY_SQL)) {
            preparedStatement.setInt(1, limit);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("ProductID");
                String productName = rs.getString("ProductName");
                String category = rs.getString("Category");
                double price = rs.getDouble("Price");
                int quantity = rs.getInt("Quantity");
                products.add(new Product(productID, productName, category, price, quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
