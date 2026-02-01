package com.nilavu.model;

public class Cart {
    private int cartId;
    private int userId;
    // getters and setters
	
	public Cart() {
		super();
	}
	public Cart(int cartId, int userId) {
		super();
		this.cartId = cartId;
		this.userId = userId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + "]";
	}
	
}
