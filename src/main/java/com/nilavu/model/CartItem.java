package com.nilavu.model;

public class CartItem {
    private int cartItemId;
    private int cartId;
    private int productId;
    private int quantity;
    private String productName;
    private String categoryName;
    private double price;
	public CartItem(int cartItemId, int cartId, int productId, int quantity, String productName, String categoryName,
			double price) {
		super();
		this.cartItemId = cartItemId;
		this.cartId = cartId;
		this.productId = productId;
		this.quantity = quantity;
		this.productName = productName;
		this.categoryName = categoryName;
		this.price = price;
	}
	public CartItem() {
		super();
	}
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", cartId=" + cartId + ", productId=" + productId + ", quantity="
				+ quantity + ", productName=" + productName + ", categoryName=" + categoryName + ", price=" + price
				+ "]";
	}
	
}
