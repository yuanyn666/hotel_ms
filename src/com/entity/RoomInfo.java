package com.entity;

//房间信息表
public class RoomInfo {
	private int roomId;
	private int roomTypeId;
	private String roomTypeName;// 新增
	private int floor;
	private int roomStateId;
	private String roomStateName;// 新增
	private String roomPhone;
	private int roomBuild;
	private int stateTime;
	//
	private RoomState roomState;//新增

	//
	private RoomType RoomType;
	private RoomState roomstate;
	private LiveInfo liveinfo;

	public RoomState getRoomState() {
		return roomState;
	}

	public void setRoomState(RoomState roomState) {
		this.roomState = roomState;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	public RoomType getRoomType() {
		return RoomType;
	}

	public void setRoomType(RoomType roomType) {
		RoomType = roomType;
	}

	public RoomState getRoomstate() {
		return roomstate;
	}

	public void setRoomstate(RoomState roomstate) {
		this.roomstate = roomstate;
	}

	public LiveInfo getLiveinfo() {
		return liveinfo;
	}

	public void setLiveinfo(LiveInfo liveinfo) {
		this.liveinfo = liveinfo;
	}
	public String getRoomStateName() {
		return roomStateName;
	}

	public void setRoomStateName(String roomStateName) {
		this.roomStateName = roomStateName;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getRoomStateId() {
		return roomStateId;
	}

	public void setRoomStateId(int roomStateId) {
		this.roomStateId = roomStateId;
	}

	public String getRoomPhone() {
		return roomPhone;
	}

	public void setRoomPhone(String roomPhone) {
		this.roomPhone = roomPhone;
	}

	public int getRoomBuild() {
		return roomBuild;
	}

	public void setRoomBuild(int roomBuild) {
		this.roomBuild = roomBuild;
	}

	public int getStateTime() {
		return stateTime;
	}

	public void setStateTime(int stateTime) {
		this.stateTime = stateTime;
	}

	public RoomInfo(int roomId, int roomTypeId, int floor, int roomStateId,
					String roomPhone, int roomBuild, int stateTime) {
		super();
		this.roomId = roomId;
		this.roomTypeId = roomTypeId;
		this.floor = floor;
		this.roomStateId = roomStateId;
		this.roomPhone = roomPhone;
		this.roomBuild = roomBuild;
		this.stateTime = stateTime;
	}

	public RoomInfo() {
		super();
	}

	public RoomInfo(int roomId, int roomTypeId, String roomTypeName, int floor,
					int roomStateId, String roomStateName, String roomPhone,
					int roomBuild, int stateTime) {
		super();
		this.roomId = roomId;
		this.roomTypeId = roomTypeId;
		this.roomTypeName = roomTypeName;
		this.floor = floor;
		this.roomStateId = roomStateId;
		this.roomStateName = roomStateName;
		this.roomPhone = roomPhone;
		this.roomBuild = roomBuild;
		this.stateTime = stateTime;
	}
	public RoomInfo(int roomId, int roomTypeId, int floor, int roomStateId,
					String roomPhone, int roomBuild, int stateTime, RoomType roomType,
					RoomState roomstate) {
		super();
		this.roomId = roomId;
		this.roomTypeId = roomTypeId;
		this.floor = floor;
		this.roomStateId = roomStateId;
		this.roomPhone = roomPhone;
		this.roomBuild = roomBuild;
		this.stateTime = stateTime;
		RoomType = roomType;
		this.roomstate = roomstate;
	}

	//
	public RoomInfo(int roomId, RoomType roomType) {
		super();
		this.roomId = roomId;
		RoomType = roomType;
	}
	public RoomInfo(int roomId, RoomType roomType, RoomState roomstate) {
		super();
		this.roomId = roomId;
		RoomType = roomType;
		this.roomstate = roomstate;
	}
	public RoomInfo(int roomId, int roomTypeId, int floor, int roomStateId,
					String roomPhone, int roomBuild, int stateTime, RoomType roomType,
					RoomState roomstate, LiveInfo liveinfo) {
		super();
		this.roomId = roomId;
		this.roomTypeId = roomTypeId;
		this.floor = floor;
		this.roomStateId = roomStateId;
		this.roomPhone = roomPhone;
		this.roomBuild = roomBuild;
		this.stateTime = stateTime;
		RoomType = roomType;
		this.roomstate = roomstate;
		this.liveinfo = liveinfo;
	}
	public RoomInfo(int roomId, int roomStateId, RoomType roomType) {
		super();
		this.roomId = roomId;
		this.roomStateId = roomStateId;
		RoomType = roomType;
	}

	//新增
	public RoomInfo(int roomId, int roomTypeId, RoomType roomType, int floor,
					int roomStateId, RoomState roomState, String roomPhone,
					int roomBuild, int stateTime) {
		super();
		this.roomId = roomId;
		this.roomTypeId = roomTypeId;
		this.RoomType = roomType;
		this.floor = floor;
		this.roomStateId = roomStateId;
		this.roomState = roomState;
		this.roomPhone = roomPhone;
		this.roomBuild = roomBuild;
		this.stateTime = stateTime;
	}

	//新增
	public RoomInfo(int roomId, RoomType roomType, LiveInfo liveinfo) {
		super();
		this.roomId = roomId;
		this.RoomType = roomType;
		this.liveinfo = liveinfo;
	}

}
