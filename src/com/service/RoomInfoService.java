package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RoomInfoDao;
import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;
@Service
public class RoomInfoService {

	@Autowired
	private RoomInfoDao rd;

	//查看房间状态
	public List<RoomState> findAllRS(){
		return rd.findAllRS();
	}
	//增加房间类型
	public int insertRT(RoomType rt){
		return 	rd.insertRT(rt);
	}
	//删除房间类型
	public int deleteRT(int roomTypeId){
		return rd.deleteRT(roomTypeId);
	}
	//修改房间类型
	public int updateRT(RoomType rt){
		return rd.updateRT(rt);
	}
	//根据编号查找房间类型
	public RoomType findRTById(int roomTypeId){
		return rd.findRTById(roomTypeId);
	}
	//查看所有房间类型
	public List<RoomType> findAllRT(){
		return rd.findAllRT();
	}

	//增加房间信息
	public int insertRoom(RoomInfo room){
		return rd.insertRoom(room);
	}
	//删除房间信息
	public int deleteRoom(int roomId){
		return rd.deleteRoom(roomId);
	}
	//修改房间信息
	public int updateRoom(RoomInfo room){
		return rd.updateRoom(room);
	}
	//根据房间编号查找房间信息
	public RoomInfo findRoomById(int roomId){
		return rd.findRoomById(roomId);
	}
	//查看所有房间信息
	public List<RoomInfo> findAllRoom(){
		return rd.findAllRoom();
	}

	//按楼栋查询房间信息
	public List<RoomInfo> findByBuild(int Build){
		return rd.findByBuild(Build);
	}
	//按楼栋和楼层查询房间信息
	public List<RoomInfo> findbyBF(int Build,int floor){
		return rd.findbyBF(Build,floor);
	}
	//按房类查询房间信息
	public List<RoomInfo> findbyType(Map<String, Object> map){
		return rd.findbyRoomType(map);
	}
	//按房态查询房间信息
	public List<RoomInfo> findbyRoomState(int roomStateId){
		return rd.findbyRoomState(roomStateId);
	}

	//查看在住账单
	public List<RoomInfo> findLiveBill(int roomId){
		return rd.findLiveBill(roomId);
	}

	//查询某楼栋和某楼层所在的最大房间号
	public String findRoomId(int build,int floor){
		return rd.findRoomId(build, floor);
	}
}
