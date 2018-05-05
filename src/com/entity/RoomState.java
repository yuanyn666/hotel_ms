package com.entity;

//房间状态表
public class RoomState {
	private int roomStateId;
	private String roomState;

	public int getRoomStateId() {
		return roomStateId;
	}

	public void setRoomStateId(int roomStateId) {
		this.roomStateId = roomStateId;
	}

	public String getRoomState() {
		return roomState;
	}

	public void setRoomState(String roomState) {
		this.roomState = roomState;
	}

	public RoomState(int roomStateId, String roomState) {
		super();
		this.roomStateId = roomStateId;
		this.roomState = roomState;
	}

	public RoomState() {
		super();
	}

	@Override
	public String toString() {
		return "RoomState [roomState=" + roomState + ", roomStateId="
				+ roomStateId + "]";
	}

}
