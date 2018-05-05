package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RoomInfoStartType;
import com.entity.LiveInfo;
import com.entity.RoomInfo;

@Service
public class RoomInfoStartTypeService {

	@Autowired
	private RoomInfoStartType roomInfoStartType;

	public RoomInfoStartType getRoomInfoStartType() {
		return roomInfoStartType;
	}

	public void setRoomInfoStartType(RoomInfoStartType roomInfoStartType) {
		this.roomInfoStartType = roomInfoStartType;
	}

	// 查询遍历显示客房
	public List<RoomInfo> findAllRoomIST() {
		return roomInfoStartType.findAllRoomInfoAll();
	}
	//根据房间状态 查找显示 房间
	public List<RoomInfo> findAllRoomInfoS(Map<String, Object> map){
		return roomInfoStartType.findAllRoomInfo(map);

	}

	// 获取根据 房间类型获取房间数量
	public int findByStartidS() {
		return roomInfoStartType.findByStartid();
	}

	public int findByStartid1S() {
		return roomInfoStartType.findByStartid1();
	}

	public int findByStartid2S() {
		return roomInfoStartType.findByStartid2();
	}

	public int findByStartid3S() {
		return roomInfoStartType.findByStartid3();
	}

	public int findByStartid4S() {
		return roomInfoStartType.findByStartid4();
	}

	public int findByStartid5S() {
		return roomInfoStartType.findByStartid5();
	}
	//查询在住人信息
	public List<LiveInfo> findLiveInfoAllS(){
		return roomInfoStartType.findLiveInfoAll();
	}

}
