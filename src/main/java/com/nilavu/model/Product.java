package com.nilavu.model;

public class Product {
    private int productId;
    private String productName;
    private double price;
    private int stock;
    private String description;
    private String imageUrl;
    private int categoryId;
    // getters and setters
	public Product(int productId, String productName, double price, int stock, String description, String imageUrl,
			int categoryId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.description = description;
		this.imageUrl = imageUrl;
		this.categoryId = categoryId;
	}
	public Product() {
		super();
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", price=" + price + ", stock="
				+ stock + ", description=" + description + ", imageUrl=" + imageUrl + ", categoryId=" + categoryId
				+ "]";
	}
    
}
