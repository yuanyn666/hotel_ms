package com.entity;
//�˻���
public class ReturnProduct {
	private String returnId;
	private String returnDate;
	private String returnStyle;
	private int userId;
	private int userIdS;
	private String mark;
	public String getReturnId() {
		return returnId;
	}
	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getReturnStyle() {
		return returnStyle;
	}
	public void setReturnStyle(String returnStyle) {
		this.returnStyle = returnStyle;
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
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public ReturnProduct(String returnId, String returnDate,
			String returnStyle, int userId, int userIdS, String mark) {
		super();
		this.returnId = returnId;
		this.returnDate = returnDate;
		this.returnStyle = returnStyle;
		this.userId = userId;
		this.userIdS = userIdS;
		this.mark = mark;
	}
	public ReturnProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
