package com.entity;
public class PurchaseOrder {
	private String orderId;
	private String planId;
	private int userIdC;
	private String orderDate;
	private String MoneyType;
	private String address;
	private int totalMoney;
	private String mark;
	private String state;
	private int userIdS;
	
	private String names;
	private String namec;
	
	
	public PurchaseOrder(String orderId, String planId, int userIdC,
			String orderDate, String moneyType, String address, int totalMoney,
			String mark, String state, int userIdS, String names, String namec) {
		super();
		this.orderId = orderId;
		this.planId = planId;
		this.userIdC = userIdC;
		this.orderDate = orderDate;
		MoneyType = moneyType;
		this.address = address;
		this.totalMoney = totalMoney;
		this.mark = mark;
		this.state = state;
		this.userIdS = userIdS;
		this.names = names;
		this.namec = namec;
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
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public int getUserIdC() {
		return userIdC;
	}
	public void setUserIdC(int userIdC) {
		this.userIdC = userIdC;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getMoneyType() {
		return MoneyType;
	}
	public void setMoneyType(String moneyType) {
		MoneyType = moneyType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getUserIdS() {
		return userIdS;
	}
	public void setUserIdS(int userIdS) {
		this.userIdS = userIdS;
	}
	public PurchaseOrder(String orderId, String planId, int userIdC,
			String orderDate, String moneyType, String address, int totalMoney,
			String mark, String state, int userIdS) {
		super();
		this.orderId = orderId;
		this.planId = planId;
		this.userIdC = userIdC;
		this.orderDate = orderDate;
		MoneyType = moneyType;
		this.address = address;
		this.totalMoney = totalMoney;
		this.mark = mark;
		this.state = state;
		this.userIdS = userIdS;
	}

	public PurchaseOrder(String orderId, String moneyType, String address,
			String state) {
		super();
		this.orderId = orderId;
		MoneyType = moneyType;
		this.address = address;
		this.state = state;
	}
	public PurchaseOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
