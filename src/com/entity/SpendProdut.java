package com.entity;
//消费商品总结
public class SpendProdut {
	private String productname;
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	private String spendId;
	private int userId;
	private String productId;
	private int productNum;
	private int productMoney;
	private String spendDate;
	public SpendProdut(String productname, int productNum) {
		super();
		this.productname = productname;
		this.productNum = productNum;
	}
	public String getSpendId() {
		return spendId;
	}
	public void setSpendId(String spendId) {
		this.spendId = spendId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getProductMoney() {
		return productMoney;
	}
	public void setProductMoney(int productMoney) {
		this.productMoney = productMoney;
	}
	public String getSpendDate() {
		return spendDate;
	}
	public void setSpendDate(String spendDate) {
		this.spendDate = spendDate;
	}
	public SpendProdut(String spendId, int userId, String productId,
					   int productNum, int productMoney, String spendDate) {
		super();
		this.spendId = spendId;
		this.userId = userId;
		this.productId = productId;
		this.productNum = productNum;
		this.productMoney = productMoney;
		this.spendDate = spendDate;
	}
	public SpendProdut() {
		super();
	}
	@Override
	public String toString() {
		return "SpendProdut [productId=" + productId + ", productMoney="
				+ productMoney + ", productNum=" + productNum + ", spendDate="
				+ spendDate + ", spendId=" + spendId + ", userId=" + userId
				+ "]";
	}

}
