package com.entity;

public class PurchasePlanDetail {
	private String planId;
	private String productId;
	private String productName;
	private int productSum;
	private int buyPrice;
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
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
	public PurchasePlanDetail(String planId, String productId,
			String productName, int productSum, int buyPrice) {
		super();
		this.planId = planId;
		this.productId = productId;
		this.productName = productName;
		this.productSum = productSum;
		this.buyPrice = buyPrice;
	}
	public PurchasePlanDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
