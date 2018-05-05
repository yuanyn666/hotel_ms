package com.entity;
//盘点
public class ProductBill {
	private String billId;
	private int userId;
	private int jainMoney;
	private String datatime;
	public ProductBill(int jainMoney, String datatime) {
		super();
		this.jainMoney = jainMoney;
		this.datatime = datatime;
	}
	public ProductBill(String billId, int userId, int jainMoney, String datatime) {
		super();
		this.billId = billId;
		this.userId = userId;
		this.jainMoney = jainMoney;
		this.datatime = datatime;
	}
	public String getDatatime() {
		return datatime;
	}
	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getJainMoney() {
		return jainMoney;
	}
	public void setJainMoney(int jainMoney) {
		this.jainMoney = jainMoney;
	}

	public ProductBill() {
		super();
	}
}
