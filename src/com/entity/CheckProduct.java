package com.entity;

//商品盘点
public class CheckProduct {
	private String checkProId;
	private int userId;
	private int userIdS;
	private String depotPId;
	private String payId;
	private String returnId;
	private int totalMoney;

	public String getCheckProId() {
		return checkProId;
	}

	public void setCheckProId(String checkProId) {
		this.checkProId = checkProId;
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

	public String getDepotPId() {
		return depotPId;
	}

	public void setDepotPId(String depotPId) {
		this.depotPId = depotPId;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getReturnId() {
		return returnId;
	}

	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public CheckProduct(String checkProId, int userId, int userIdS,
						String depotPId, String payId, String returnId, int totalMoney) {
		super();
		this.checkProId = checkProId;
		this.userId = userId;
		this.userIdS = userIdS;
		this.depotPId = depotPId;
		this.payId = payId;
		this.returnId = returnId;
		this.totalMoney = totalMoney;
	}

	public CheckProduct() {
		super();
	}

	@Override
	public String toString() {
		return "CheckProduct [checkProId=" + checkProId + ", depotPId="
				+ depotPId + ", payId=" + payId + ", returnId=" + returnId
				+ ", totalMoney=" + totalMoney + ", userId=" + userId
				+ ", userIdS=" + userIdS + "]";
	}

}
