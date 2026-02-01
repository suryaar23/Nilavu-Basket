package com.nilavu.model;

import java.util.Date;

public class Payment {
    private int paymentId;
    private int orderId;
    private String paymentMode;
    private String paymentStatus;
    private Date paymentDate;
    // getters and setters
    public Payment(int paymentId, int orderId, String paymentMode, String paymentStatus, Date paymentDate) {
		super();
		this.paymentId = paymentId;
		this.orderId = orderId;
		this.paymentMode = paymentMode;
		this.paymentStatus = paymentStatus;
		this.paymentDate = paymentDate;
	}
	public Payment() {
		super();
	}
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", orderId=" + orderId + ", paymentMode=" + paymentMode
				+ ", paymentStatus=" + paymentStatus + ", paymentDate=" + paymentDate + "]";
	}
	
    
}
