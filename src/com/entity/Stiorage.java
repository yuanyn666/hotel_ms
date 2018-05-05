package com.entity;
public class Stiorage {
	private String stiorageId;
	private int userId;
	private String orderId;
	private String tiorageTime;
	private String DepotId;
	private int userIdS;
	private String Remarks;
	private String names;
	private String namec;
	public String getStiorageId() {
		return stiorageId;
	}
	public void setStiorageId(String stiorageId) {
		this.stiorageId = stiorageId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getTiorageTime() {
		return tiorageTime;
	}
	public void setTiorageTime(String tiorageTime) {
		this.tiorageTime = tiorageTime;
	}
	public String getDepotId() {
		return DepotId;
	}
	public void setDepotId(String depotId) {
		DepotId = depotId;
	}
	public int getUserIdS() {
		return userIdS;
	}
	public void setUserIdS(int userIdS) {
		this.userIdS = userIdS;
	}
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
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
	
	public Stiorage(String stiorageId, int userId, String orderId,
			String tiorageTime, String depotId, int userIdS, String remarks) {
		super();
		this.stiorageId = stiorageId;
		this.userId = userId;
		this.orderId = orderId;
		this.tiorageTime = tiorageTime;
		DepotId = depotId;
		this.userIdS = userIdS;
		Remarks = remarks;
	}
	public Stiorage(String stiorageId, int userId, String orderId,
			String tiorageTime, String depotId, int userIdS, String remarks,
			String names, String namec) {
		super();
		this.stiorageId = stiorageId;
		this.userId = userId;
		this.orderId = orderId;
		this.tiorageTime = tiorageTime;
		DepotId = depotId;
		this.userIdS = userIdS;
		Remarks = remarks;
		this.names = names;
		this.namec = namec;
	}
	public Stiorage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
