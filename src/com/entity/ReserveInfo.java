package com.entity;
//预订信息表
public class ReserveInfo {
	private String reserveId;
	private String customerName;
	private String customerPhone;
	private int roomTypeId;
	private int roomId;
	private String endTime;
	private int keepTime;
	private String reserveTime;
	private String remark;
	private int bookMoney;
	private int customerTypeId;
	private int state;
	private int totalMoney;

	private CustomerType customerType;
	private RoomType roomtype;
	public RoomType getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(RoomType roomtype) {
		this.roomtype = roomtype;
	}


	public CustomerType getCustomerType() {
		return customerType;
	}
	public void setCustomerType(CustomerType customerType) {
		this.customerType = customerType;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getCustomerTypeId() {
		return customerTypeId;
	}
	public void setCustomerTypeId(int customerTypeId) {
		this.customerTypeId = customerTypeId;
	}
	public String getReserveId() {
		return reserveId;
	}
	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public int getRoomTypeId() {
		return roomTypeId;
	}
	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getKeepTime() {
		return keepTime;
	}
	public void setKeepTime(int keepTime) {
		this.keepTime = keepTime;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getBookMoney() {
		return bookMoney;
	}
	public void setBookMoney(int bookMoney) {
		this.bookMoney = bookMoney;
	}
	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
	}
	public ReserveInfo() {
		super();
	}

	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney,
					   int customerTypeId) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
		this.customerTypeId = customerTypeId;
	}
	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney,
					   int customerTypeId, int state, int totalMoney) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
		this.customerTypeId = customerTypeId;
		this.state = state;
		this.totalMoney = totalMoney;
	}
	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney,
					   int customerTypeId, int state, int totalMoney,
					   CustomerType customerType) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
		this.customerTypeId = customerTypeId;
		this.state = state;
		this.totalMoney = totalMoney;
		this.customerType = customerType;
	}
	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney,
					   int customerTypeId, int state, int totalMoney, RoomType roomtype,
					   CustomerType customerType) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
		this.customerTypeId = customerTypeId;
		this.state = state;
		this.totalMoney = totalMoney;
		this.roomtype = roomtype;
		this.customerType = customerType;
	}
	public ReserveInfo(String reserveId, String customerName,
					   String customerPhone, int roomTypeId, int roomId, String endTime,
					   int keepTime, String reserveTime, String remark, int bookMoney,
					   int customerTypeId, int state, int totalMoney,
					   CustomerType customerType, RoomType roomtype) {
		super();
		this.reserveId = reserveId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.roomTypeId = roomTypeId;
		this.roomId = roomId;
		this.endTime = endTime;
		this.keepTime = keepTime;
		this.reserveTime = reserveTime;
		this.remark = remark;
		this.bookMoney = bookMoney;
		this.customerTypeId = customerTypeId;
		this.state = state;
		this.totalMoney = totalMoney;
		this.customerType = customerType;
		this.roomtype = roomtype;
	}

}
