package com.entity;
public class PurchasePay {
	private String payId;
	private String payTime;
	private int payMoney;
	private String payStyle;
	private int userId;
	private int userIdS;
	private String checkState;
	private String purchasPayOthers;
	
	private String names;
	private String namec;
	private String orderid;
	
	public PurchasePay(String payId, String payTime, int payMoney,
			String payStyle, int userId, int userIdS, String checkState,
			String purchasPayOthers, String names, String namec, String orderid) {
		super();
		this.payId = payId;
		this.payTime = payTime;
		this.payMoney = payMoney;
		this.payStyle = payStyle;
		this.userId = userId;
		this.userIdS = userIdS;
		this.checkState = checkState;
		this.purchasPayOthers = purchasPayOthers;
		this.names = names;
		this.namec = namec;
		this.orderid = orderid;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getNamec() {
		return namec;
	}
	public void setNamec(String namec) {
		this.namec = namec;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	public String getPayStyle() {
		return payStyle;
	}
	public void setPayStyle(String payStyle) {
		this.payStyle = payStyle;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserIdS() {
		return userIdS;
	}
	public void setUserIdS(int userIdS) {
		this.userIdS = userIdS;
	}
	public String getCheckState() {
		return checkState;
	}
	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}
	public String getPurchasPayOthers() {
		return purchasPayOthers;
	}
	public void setPurchasPayOthers(String purchasPayOthers) {
		this.purchasPayOthers = purchasPayOthers;
	}
	public PurchasePay(String payId, String payTime, int payMoney,
			String payStyle, int userId, int userIdS, String checkState,
			String purchasPayOthers) {
		super();
		this.payId = payId;
		this.payTime = payTime;
		this.payMoney = payMoney;
		this.payStyle = payStyle;
		this.userId = userId;
		this.userIdS = userIdS;
		this.checkState = checkState;
		this.purchasPayOthers = purchasPayOthers;
	}
	
	public PurchasePay(String payId, String payStyle, String checkState) {
		super();
		this.payId = payId;
		this.payStyle = payStyle;
		this.checkState = checkState;
	}
	public PurchasePay() {
		super();
	}
	@Override
	public String toString() {
		return "PurchasePay [checkState=" + checkState + ", payId=" + payId
				+ ", payMoney=" + payMoney + ", payStyle=" + payStyle
				+ ", payTime=" + payTime + ", purchasPayOthers="
				+ purchasPayOthers + ", userId=" + userId + ", userIdS="
				+ userIdS + "]";
	}
	
}
