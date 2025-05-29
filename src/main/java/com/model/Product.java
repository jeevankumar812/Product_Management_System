package com.model;

/**
 * Product.java
 * This class is a simple POJO (Plain Old Java Object)
 * that represents a product in the inventory.
 * It holds product details like ID, name, category, price, and quantity.
 */
public class Product {
    private int productID;
    private String productName;
    private String category;
    private double price;
    private int quantity;

    // Default constructor
    public Product() {
    }

    // Parameterized constructor
    public Product(int productID, String productName, String category, double price, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    // Getter and Setter methods for all properties

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product [productID=" + productID + ", productName=" + productName + ", category=" + category
                + ", price=" + price + ", quantity=" + quantity + "]";
    }
}
