package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;

public interface RoomInfoDao {

	//查看房间状态
	public List<RoomState> findAllRS();

	//增加房间类型
	public int insertRT(RoomType rt);
	//删除房间类型
	public int deleteRT(int roomTypeId);
	//修改房间类型
	public int updateRT(RoomType rt);
	//根据编号查找房间类型
	public RoomType findRTById(int roomTypeId);
	//查看所有房间类型
	public List<RoomType> findAllRT();

	//增加房间信息
	public int insertRoom(RoomInfo room);
	//删除房间信息
	public int deleteRoom(int roomId);
	//修改房间信息
	public int updateRoom(RoomInfo room);
	//根据房间编号查找房间信息
	public RoomInfo findRoomById(int roomId);
	//查看所有房间信息
	public List<RoomInfo> findAllRoom();
	//按楼栋查询房间信息
	public List<RoomInfo> findByBuild(int Build);
	//按楼栋，楼层查询房间信息
	public List<RoomInfo> findbyBF(int Build,int floor);
	//按房类查询房间信息
	public List<RoomInfo> findbyRoomType(Map<String, Object> map);
	//按房态查询房间信息
	public List<RoomInfo> findbyRoomState(int roomStateId);

	//查看在住账单
	public List<RoomInfo> findLiveBill(int roomId);

	//查询某楼栋和某楼层所在的最大房间号
	public String findRoomId(int build,int floor);
}
