package com.entity;
//会员基本资料表
public class SuperCustomer {
	private String spId;//修改成String
	private String spName;
	private String spSex;
	private String spAddress;
	private String spPhone;
	private String spCardType;
	private String spCardId;
	private String balance;//新增  余额
	private String integration;//新增  积分
	private String newMoney;//新增  增加的金额
	private String newJF;//新增  增加的积分
	private String mark;
	private int state;//标识state


	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getNewMoney() {
		return newMoney;
	}
	public void setNewMoney(String newMoney) {
		this.newMoney = newMoney;
	}
	public String getNewJF() {
		return newJF;
	}
	public void setNewJF(String newJF) {
		this.newJF = newJF;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getIntegration() {
		return integration;
	}
	public void setIntegration(String integration) {
		this.integration = integration;
	}
	public String getSpId() {
		return spId;
	}
	public void setSpId(String spId) {
		this.spId = spId;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public String getSpSex() {
		return spSex;
	}
	public void setSpSex(String spSex) {
		this.spSex = spSex;
	}
	public String getSpAddress() {
		return spAddress;
	}
	public void setSpAddress(String spAddress) {
		this.spAddress = spAddress;
	}
	public String getSpPhone() {
		return spPhone;
	}
	public void setSpPhone(String spPhone) {
		this.spPhone = spPhone;
	}
	public String getSpCardType() {
		return spCardType;
	}
	public void setSpCardType(String spCardType) {
		this.spCardType = spCardType;
	}
	public String getSpCardId() {
		return spCardId;
	}
	public void setSpCardId(String spCardId) {
		this.spCardId = spCardId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}

	public SuperCustomer() {
		super();
	}
	@Override
	public String toString() {
		return "SuperCustomer [mark=" + mark + ", spAddress=" + spAddress
				+ ", spCardId=" + spCardId + ", spCardType=" + spCardType
				+ ", spId=" + spId + ", spName=" + spName + ", spPhone="
				+ spPhone + ", spSex=" + spSex + "]";
	}
	public SuperCustomer(String spName, String spSex, String spAddress,
						 String spPhone, String spCardType, String spCardId, String mark) {
		super();
		this.spName = spName;
		this.spSex = spSex;
		this.spAddress = spAddress;
		this.spPhone = spPhone;
		this.spCardType = spCardType;
		this.spCardId = spCardId;
		this.mark = mark;
	}


	public SuperCustomer(String spId, String spName, String newMoney,
						 String newJF) {
		super();
		this.spId = spId;
		this.spName = spName;
		this.newMoney = newMoney;
		this.newJF = newJF;
	}

	public SuperCustomer(String spId, String spName, String spSex,
						 String spAddress, String spPhone, String spCardType,
						 String spCardId, String balance, String integration, String mark) {
		super();
		this.spId = spId;
		this.spName = spName;
		this.spSex = spSex;
		this.spAddress = spAddress;
		this.spPhone = spPhone;
		this.spCardType = spCardType;
		this.spCardId = spCardId;
		this.balance = balance;
		this.integration = integration;
		this.mark = mark;
	}
	public SuperCustomer(String spId, String spName, String spSex,
						 String spAddress, String spPhone, String spCardType,
						 String spCardId, String balance, String integration, String mark,
						 int state) {
		super();
		this.spId = spId;
		this.spName = spName;
		this.spSex = spSex;
		this.spAddress = spAddress;
		this.spPhone = spPhone;
		this.spCardType = spCardType;
		this.spCardId = spCardId;
		this.balance = balance;
		this.integration = integration;
		this.mark = mark;
		this.state = state;
	}
	public SuperCustomer(String spId, String spName, String spSex,
						 String spAddress, String spPhone, String spCardType,
						 String spCardId, String balance, String integration,
						 String newMoney, String newJF, String mark, int state) {
		super();
		this.spId = spId;
		this.spName = spName;
		this.spSex = spSex;
		this.spAddress = spAddress;
		this.spPhone = spPhone;
		this.spCardType = spCardType;
		this.spCardId = spCardId;
		this.balance = balance;
		this.integration = integration;
		this.newMoney = newMoney;
		this.newJF = newJF;
		this.mark = mark;
		this.state = state;
	}


}
