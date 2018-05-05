package com.entity;

public class ReturnProductDetail {
	private String returnId;
	private String productId;
	private int returnNum;
	private int price;
	private int totalMoney;
	private int returnMoney;
	public String getReturnId() {
		return returnId;
	}
	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getReturnNum() {
		return returnNum;
	}
	public void setReturnNum(int returnNum) {
		this.returnNum = returnNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getReturnMoney() {
		return returnMoney;
	}
	public void setReturnMoney(int returnMoney) {
		this.returnMoney = returnMoney;
	}
	public ReturnProductDetail(String returnId, String productId,
			int returnNum, int price, int totalMoney, int returnMoney) {
		super();
		this.returnId = returnId;
		this.productId = productId;
		this.returnNum = returnNum;
		this.price = price;
		this.totalMoney = totalMoney;
		this.returnMoney = returnMoney;
	}
	public ReturnProductDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
}
