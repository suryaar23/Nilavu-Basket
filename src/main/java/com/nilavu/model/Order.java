package com.nilavu.model;

import java.time.LocalDateTime;

public class Order {
    private int orderId;
    private int userId;
    private LocalDateTime orderDate;
    private String status;
    private double totalAmount;
    private String userName;

    // getters and setters
    
	public Order(int orderId, int userId, LocalDateTime orderDate, String status, double totalAmount, String userName) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.orderDate = orderDate;
		this.status = status;
		this.totalAmount = totalAmount;
	}
	public Order() {
		super();
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", userName=" + userName + ", orderDate=" + orderDate + ", status=" + status
				+ ", totalAmount=" + totalAmount + "]";
	}
}
