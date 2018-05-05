package com.entity;
//入住信息表
public class LiveInfo {
	private String liveId;
	private int roomId;
	private int liveMoney;
	private int customerTypeId;
	private String customerName;
	private String customerSex;
	private String cardType;
	private String cardId;
	private String phone;
	private String address;
	private int liveNum;
	private String liveTime;
	private int liveDays;
	private String payType;
	private int userIdnumber;
	private String mark;
	private Users users;
	private CustomerType customerType;
	private RoomType roomType;
	private int state;
	private int newRoomId;//新增
	private int newLiveMoney;//新增

	private String cTypeName;//新增

	private String names;//新增

	public String getcTypeName() {
		return cTypeName;
	}
	public void setcTypeName(String cTypeName) {
		this.cTypeName = cTypeName;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}


	public int getNewRoomId() {
		return newRoomId;
	}
	public void setNewRoomId(int newRoomId) {
		this.newRoomId = newRoomId;
	}
	public int getNewLiveMoney() {
		return newLiveMoney;
	}
	public void setNewLiveMoney(int newLiveMoney) {
		this.newLiveMoney = newLiveMoney;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public CustomerType getCustomerType() {
		return customerType;
	}
	public void setCustomerType(CustomerType customerType) {
		this.customerType = customerType;
	}
	public String getLiveId() {
		return liveId;
	}
	public void setLiveId(String liveId) {
		this.liveId = liveId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getLiveMoney() {
		return liveMoney;
	}
	public void setLiveMoney(int liveMoney) {
		this.liveMoney = liveMoney;
	}
	public int getCustomerTypeId() {
		return customerTypeId;
	}
	public void setCustomerTypeId(int customerTypeId) {
		this.customerTypeId = customerTypeId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerSex() {
		return customerSex;
	}
	public void setCustomerSex(String customerSex) {
		this.customerSex = customerSex;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLiveNum() {
		return liveNum;
	}
	public void setLiveNum(int liveNum) {
		this.liveNum = liveNum;
	}
	public String getLiveTime() {
		return liveTime;
	}
	public void setLiveTime(String liveTime) {
		this.liveTime = liveTime;
	}
	public int getLiveDays() {
		return liveDays;
	}
	public void setLiveDays(int liveDays) {
		this.liveDays = liveDays;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getUserIdnumber() {
		return userIdnumber;
	}
	public void setUserIdnumber(int userIdnumber) {
		this.userIdnumber = userIdnumber;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public LiveInfo(String liveId, int roomId, int liveMoney,
					int customerTypeId, String customerName, String customerSex,
					String cardType, String cardId, String phone, String address,
					int liveNum, String liveTime, int liveDays, String payType,
					int userIdnumber, String mark) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.customerTypeId = customerTypeId;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.userIdnumber = userIdnumber;
		this.mark = mark;
	}
	public LiveInfo() {
		super();
	}
	@Override
	public String toString() {
		return "LiveInfo [address=" + address + ", cardId=" + cardId
				+ ", cardType=" + cardType + ", customerName=" + customerName
				+ ", customerSex=" + customerSex + ", customerTypeId="
				+ customerTypeId + ", liveDays=" + liveDays + ", liveId="
				+ liveId + ", liveMoney=" + liveMoney + ", liveNum=" + liveNum
				+ ", liveTime=" + liveTime + ", mark=" + mark + ", payType="
				+ payType + ", phone=" + phone + ", roomId=" + roomId
				+ ", userIdnumber=" + userIdnumber + "]";
	}
	public LiveInfo(String liveId, int roomId, int liveMoney,
					int customerTypeId, String customerName, String customerSex,
					String cardType, String cardId, String phone, String address,
					int liveNum, String liveTime, int liveDays, String payType,
					int userIdnumber, String mark, Users users,
					CustomerType customerType) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.customerTypeId = customerTypeId;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.userIdnumber = userIdnumber;
		this.mark = mark;
		this.users = users;
		this.customerType = customerType;
	}
	public LiveInfo(String liveId, int liveMoney, int liveDays) {
		super();
		this.liveId = liveId;
		this.liveMoney = liveMoney;
		this.liveDays = liveDays;
	}
	public LiveInfo(String liveId, int roomId, int liveMoney,
					int customerTypeId, String customerName, String customerSex,
					String cardType, String cardId, String phone, String address,
					int liveNum, String liveTime, int liveDays, String payType,
					int userIdnumber, String mark, Users users,
					CustomerType customerType, RoomType roomType) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.customerTypeId = customerTypeId;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.userIdnumber = userIdnumber;
		this.mark = mark;
		this.users = users;
		this.customerType = customerType;
		this.roomType = roomType;
	}
	public LiveInfo(String liveId, int roomId, int liveMoney,
					int customerTypeId, String customerName, String customerSex,
					String cardType, String cardId, String phone, String address,
					int liveNum, String liveTime, int liveDays, String payType,
					int userIdnumber, String mark, Users users,
					CustomerType customerType, RoomType roomType, int state) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.customerTypeId = customerTypeId;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.userIdnumber = userIdnumber;
		this.mark = mark;
		this.users = users;
		this.customerType = customerType;
		this.roomType = roomType;
		this.state = state;
	}
	public LiveInfo(String liveId, int roomId, int liveMoney,
					int customerTypeId, String customerName, String customerSex,
					String cardType, String cardId, String phone, String address,
					int liveNum, String liveTime, int liveDays, String payType,
					int userIdnumber, String mark, int state) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.customerTypeId = customerTypeId;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.userIdnumber = userIdnumber;
		this.mark = mark;
		this.state = state;
	}


	//新增
	public LiveInfo(int roomId, int newRoomId, int liveMoney, int newLiveMoney) {
		super();
		this.roomId = roomId;
		this.newRoomId = newRoomId;
		this.liveMoney = liveMoney;
		this.newLiveMoney = newLiveMoney;
	}
	public LiveInfo(String liveId, int roomId, int liveMoney, String cTypeName,
					String customerName, String customerSex, String cardType,
					String cardId, String phone, String address, int liveNum,
					String liveTime, int liveDays, String payType, String mark,
					String names, int state) {
		super();
		this.liveId = liveId;
		this.roomId = roomId;
		this.liveMoney = liveMoney;
		this.cTypeName = cTypeName;
		this.customerName = customerName;
		this.customerSex = customerSex;
		this.cardType = cardType;
		this.cardId = cardId;
		this.phone = phone;
		this.address = address;
		this.liveNum = liveNum;
		this.liveTime = liveTime;
		this.liveDays = liveDays;
		this.payType = payType;
		this.mark = mark;
		this.names = names;
		this.state = state;
	}


}
