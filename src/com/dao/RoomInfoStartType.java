package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.LiveInfo;
import com.entity.RoomInfo;

public interface RoomInfoStartType {

	public List<RoomInfo> findAllRoomInfoAll();
	public List<RoomInfo> findAllRoomInfo(Map<String, Object> map);

	// 查找所有的房间
	public int findByStartid();

	// 查找空房间
	public int findByStartid1();

	// 已预订
	public int findByStartid2();

	// 已入住
	public int findByStartid3();

	// 未住满
	public int findByStartid4();

	// 查找脏房间
	public int findByStartid5();
	//查询房间入住人信息
	public List<LiveInfo> findLiveInfoAll();
}
