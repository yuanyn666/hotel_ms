package com.entity;

public class PurchaseOrderDetail {
	private String orderId;
	private String productId;
	private String productName;
	private int productSum;
	private int buyPrice;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductSum() {
		return productSum;
	}
	public void setProductSum(int productSum) {
		this.productSum = productSum;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public PurchaseOrderDetail(String orderId, String productId,
			String productName, int productSum, int buyPrice) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.productSum = productSum;
		this.buyPrice = buyPrice;
	}
	public PurchaseOrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
