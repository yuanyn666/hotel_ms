package com.entity;

//房间类型表
public class RoomType {
	private int roomTypeId;
	private String roomType;
	private int roomPrice;
	private int money;
	private int bookMoney;
	private String roomMark;

	public int getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getBookMoney() {
		return bookMoney;
	}

	public void setBookMoney(int bookMoney) {
		this.bookMoney = bookMoney;
	}

	public String getRoomMark() {
		return roomMark;
	}

	public void setRoomMark(String roomMark) {
		this.roomMark = roomMark;
	}

	public RoomType(int roomTypeId, String roomType, int roomPrice, int money,
					int bookMoney, String roomMark) {
		super();
		this.roomTypeId = roomTypeId;
		this.roomType = roomType;
		this.roomPrice = roomPrice;
		this.money = money;
		this.bookMoney = bookMoney;
		this.roomMark = roomMark;
	}

	public RoomType() {
		super();
	}

	@Override
	public String toString() {
		return "RoomType [bookMoney=" + bookMoney + ", money=" + money
				+ ", roomMark=" + roomMark + ", roomPrice=" + roomPrice
				+ ", roomType=" + roomType + ", roomTypeId=" + roomTypeId + "]";
	}

}
