package com.entity;
//客人损坏主表
public class CustomerBreak {
	private String breakId;
	private String roomId;
	private int userId;
	private String remark;
	private String breakTime;
	private String customername;
	private String names;
	public CustomerBreak(String breakId, String roomId, String remark,
						 String breakTime, String customername, String names) {
		super();
		this.breakId = breakId;
		this.roomId = roomId;
		this.remark = remark;
		this.breakTime = breakTime;
		this.customername = customername;
		this.names = names;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getBreakId() {
		return breakId;
	}
	public void setBreakId(String breakId) {
		this.breakId = breakId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getBreakTime() {
		return breakTime;
	}
	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}
	public CustomerBreak(String breakId, String roomId, int userId, String remark,
						 String breakTime) {
		super();
		this.breakId = breakId;
		this.roomId = roomId;
		this.userId = userId;
		this.remark = remark;
		this.breakTime = breakTime;
	}
	public CustomerBreak() {
		super();
	}
	@Override
	public String toString() {
		return "CustomerBreak [breakId=" + breakId + ", breakTime=" + breakTime
				+ ", remark=" + remark + ", roomId=" + roomId + ", userId="
				+ userId + "]";
	}

}
