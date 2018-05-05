package com.entity;

//结算表
public class Checkout {
	private String checkId;
	private String liveId;
	private int realDays;
	private int userId;
	private int money;
	private String remark;
	private String checkTime;
	private String names;
	private int roomId;
	private String customername;
	private String phone;
	
	
	

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

	public String getLiveId() {
		return liveId;
	}

	public void setLiveId(String liveId) {
		this.liveId = liveId;
	}

	public int getRealDays() {
		return realDays;
	}

	public void setRealDays(int realDays) {
		this.realDays = realDays;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public Checkout(String checkId, String liveId, int realDays, int userId,
			int money, String remark, String checkTime) {
		super();
		this.checkId = checkId;
		this.liveId = liveId;
		this.realDays = realDays;
		this.userId = userId;
		this.money = money;
		this.remark = remark;
		this.checkTime = checkTime;
	}

	public Checkout() {
		super();
	}

	@Override
	public String toString() {
		return "Checkout [checkId=" + checkId + ", checkTime=" + checkTime
				+ ", liveId=" + liveId + ", money=" + money + ", realDays="
				+ realDays + ", remark=" + remark + ", userId=" + userId + "]";
	}

	public Checkout(String checkId, String liveId, int realDays, int money,
			String checkTime, String names, int roomId, String customername,
			String phone) {
		super();
		this.checkId = checkId;
		this.liveId = liveId;
		this.realDays = realDays;
		this.money = money;
		this.checkTime = checkTime;
		this.names = names;
		this.roomId = roomId;
		this.customername = customername;
		this.phone = phone;
	}


	

}
