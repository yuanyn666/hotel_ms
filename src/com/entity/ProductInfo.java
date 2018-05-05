package com.entity;

//商品基本信息表
public class ProductInfo {
	private String productId;
	private String productName;
	private String productAddress;
	private int buyPrice;
	private int retailoPrice;
	private String productSort;
	private int state;
	private String ProductUction;
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
	public String getProductAddress() {
		return productAddress;
	}
	public void setProductAddress(String productAddress) {
		this.productAddress = productAddress;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getRetailoPrice() {
		return retailoPrice;
	}
	public void setRetailoPrice(int retailoPrice) {
		this.retailoPrice = retailoPrice;
	}
	public String getProductSort() {
		return productSort;
	}
	public void setProductSort(String productSort) {
		this.productSort = productSort;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getProductUction() {
		return ProductUction;
	}
	public void setProductUction(String productUction) {
		ProductUction = productUction;
	}
	public ProductInfo(String productId, String productName,
					   String productAddress, int buyPrice, int retailoPrice,
					   String productSort, int state, String productUction) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productAddress = productAddress;
		this.buyPrice = buyPrice;
		this.retailoPrice = retailoPrice;
		this.productSort = productSort;
		this.state = state;
		ProductUction = productUction;
	}
	public ProductInfo() {
		super();
	}




}
