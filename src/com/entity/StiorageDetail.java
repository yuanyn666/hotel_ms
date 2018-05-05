package com.entity;

public class StiorageDetail {
	private String stiorageId;
	private String productId;
	private int stiorageSum;
	public String getStiorageId() {
		return stiorageId;
	}
	public void setStiorageId(String stiorageId) {
		this.stiorageId = stiorageId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getStiorageSum() {
		return stiorageSum;
	}
	public void setStiorageSum(int stiorageSum) {
		this.stiorageSum = stiorageSum;
	}
	public StiorageDetail(String stiorageId, String productId, int stiorageSum) {
		super();
		this.stiorageId = stiorageId;
		this.productId = productId;
		this.stiorageSum = stiorageSum;
	}
	public StiorageDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
}
