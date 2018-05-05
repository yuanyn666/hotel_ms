package com.entity;
//客人消费主表
public class Spend {
	private String spendId;
	private String liveId;
	private int userId;
	private String mark;
	private String spendTime;
	private String spendName;
	private String customerName;
	public Spend(String spendId, String liveId, String mark, String spendTime,
				 String customerName, String names) {
		super();
		this.spendId = spendId;
		this.liveId = liveId;
		this.mark = mark;
		this.spendTime = spendTime;
		this.customerName = customerName;
		this.names = names;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	private String names;
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public Spend(String spendId, String liveId, int userId, String mark,
				 String spendTime, String spendName) {
		super();
		this.spendId = spendId;
		this.liveId = liveId;
		this.userId = userId;
		this.mark = mark;
		this.spendTime = spendTime;
		this.spendName = spendName;
	}
	public String getSpendName() {
		return spendName;
	}
	public void setSpendName(String spendName) {
		this.spendName = spendName;
	}
	public String getSpendId() {
		return spendId;
	}
	public void setSpendId(String spendId) {
		this.spendId = spendId;
	}
	public String getLiveId() {
		return liveId;
	}
	public void setLiveId(String liveId) {
		this.liveId = liveId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getSpendTime() {
		return spendTime;
	}
	public void setSpendTime(String spendTime) {
		this.spendTime = spendTime;
	}
	public Spend(String spendId, String liveId, int userId, String mark,
				 String spendTime) {
		super();
		this.spendId = spendId;
		this.liveId = liveId;
		this.userId = userId;
		this.mark = mark;
		this.spendTime = spendTime;
	}
	public Spend() {
		super();
	}
	@Override
	public String toString() {
		return "Spend [liveId=" + liveId + ", mark=" + mark + ", spendId="
				+ spendId + ", spendTime=" + spendTime + ", userId=" + userId
				+ "]";
	}

}
