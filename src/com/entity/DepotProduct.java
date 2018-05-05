package com.entity;

public class DepotProduct {
	private String depotPId;
	private String productId;
	private String productType;
	private int depotNum;
	private String totalMoney;
	
	private String depotId;
	private String depotName;
	private String productName;
	
	private String depotPrice;
	private int outDepotPrice;
	private int jainMoney;
	private int minDepotNum;
	private int maxDepotNum;
	
	public String getDepotName() {
		return depotName;
	}
	public void setDepotName(String depotName) {
		this.depotName = depotName;
	}
	public String getDepotPId() {
		return depotPId;
	}
	public void setDepotPId(String depotPId) {
		this.depotPId = depotPId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public int getDepotNum() {
		return depotNum;
	}
	public void setDepotNum(int depotNum) {
		this.depotNum = depotNum;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getDepotId() {
		return depotId;
	}
	public void setDepotId(String depotId) {
		this.depotId = depotId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDepotPrice() {
		return depotPrice;
	}
	public void setDepotPrice(String depotPrice) {
		this.depotPrice = depotPrice;
	}
	public int getOutDepotPrice() {
		return outDepotPrice;
	}
	public void setOutDepotPrice(int outDepotPrice) {
		this.outDepotPrice = outDepotPrice;
	}
	public int getJainMoney() {
		return jainMoney;
	}
	public void setJainMoney(int jainMoney) {
		this.jainMoney = jainMoney;
	}
	public int getMinDepotNum() {
		return minDepotNum;
	}
	public void setMinDepotNum(int minDepotNum) {
		this.minDepotNum = minDepotNum;
	}
	public int getMaxDepotNum() {
		return maxDepotNum;
	}
	public void setMaxDepotNum(int maxDepotNum) {
		this.maxDepotNum = maxDepotNum;
	}
	
	
	public DepotProduct(String depotPId, String productId, String productType,
			int depotNum, String totalMoney, String depotId, String depotPrice,
			int outDepotPrice, int jainMoney, int minDepotNum, int maxDepotNum) {
		super();
		this.depotPId = depotPId;
		this.productId = productId;
		this.productType = productType;
		this.depotNum = depotNum;
		this.totalMoney = totalMoney;
		this.depotId = depotId;
		this.depotPrice = depotPrice;
		this.outDepotPrice = outDepotPrice;
		this.jainMoney = jainMoney;
		this.minDepotNum = minDepotNum;
		this.maxDepotNum = maxDepotNum;
	}
	public DepotProduct(String depotPId, String productId, String productType,
			int depotNum, String totalMoney, String depotId,
			String productName, String depotPrice, int outDepotPrice,
			int jainMoney, int minDepotNum, int maxDepotNum) {
		super();
		this.depotPId = depotPId;
		this.productId = productId;
		this.productType = productType;
		this.depotNum = depotNum;
		this.totalMoney = totalMoney;
		this.depotId = depotId;
		this.productName = productName;
		this.depotPrice = depotPrice;
		this.outDepotPrice = outDepotPrice;
		this.jainMoney = jainMoney;
		this.minDepotNum = minDepotNum;
		this.maxDepotNum = maxDepotNum;
	}
	public DepotProduct(String productId, int depotNum, String totalMoney) {
		super();
		this.productId = productId;
		this.depotNum = depotNum;
		this.totalMoney = totalMoney;
	}
	public DepotProduct() {
		super();
	}
	
	
	

}
