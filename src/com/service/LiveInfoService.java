package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LiveInfoDao;
import com.entity.Checkout;
import com.entity.CustomerType;
import com.entity.LiveInfo;
import com.entity.ProductBill;
import com.entity.ReserveInfo;
import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;
import com.entity.Users;
@Service
public class LiveInfoService {
	@Autowired
	//自动注解
	private LiveInfoDao liveInfo;
	//查询房间信息
	public List<RoomInfo> selectInfo(){
		List<RoomInfo> list=liveInfo.selectInfo();
		return list;
	}
	//录入客户信息
	public int insert(LiveInfo live){
		return liveInfo.insert(live);
	}
	//查询房间号以及金额
	public List<RoomInfo> selectA(int roomId){
		return liveInfo.selectA(roomId);
	}
	//查询客户类型
	public List<CustomerType> select(){
		return liveInfo.select();
	}
	//查询房价，房类以及房态
	public List<RoomInfo> selectR(){
		return liveInfo.selectR();
	}
	public List<RoomInfo> selectRE(){
		return liveInfo.selectRE();
	}
	//根据房间号查询房价，房类以及房态
	public List<RoomInfo> selectOne(int roomId){
		return liveInfo.selectOne(roomId);
	}

	//根据房间类型查询房价，房类以及房态
	public List<RoomInfo> selectT(String roomstate){
		return liveInfo.selectT(roomstate);
	}
	//查询房间类型
	public List<RoomType> selectS(){
		return liveInfo.selectS();
	}
	public RoomType findRTypeByIdS(int roomTypeId){
		return liveInfo.findRTypeById(roomTypeId);
	}

	//修改房间类型
	public int update(int roomId){
		return liveInfo.update(roomId);
	}

	//查询住房信息
	public List<LiveInfo> selectL(int roomId){
		return liveInfo.selectL(roomId);
	}
	//根据房间号查找类型
	public List<RoomInfo> selectType(int roomId){
		return liveInfo.selectType(roomId);
	}
	//续房缴费
	public int insertXu(LiveInfo live){
		return liveInfo.insertXu(live);
	}
	//查询房间状态
	public List<RoomState> selectRoom(){
		return liveInfo.selectRoom();
	}
	//修改房间状态
	public int updateR(RoomInfo roominfo){
		return liveInfo.updateR(roominfo);
	}
	//根据房间类型查询房间信息
	public List<RoomInfo> findRoomInfoByIdS(int roomtypeId){
		return liveInfo.findRoomInfoById(roomtypeId);
	}

	//录入预定信息
	public int insertReser(ReserveInfo reserve){
		return liveInfo.insertReser(reserve);
	}
	//修改为预定
	public int updateRe(int roomId){
		return liveInfo.updateRe(roomId);
	}
	//删除房间信息
	public int delete(int roomId){
		return liveInfo.delete(roomId);
	}
	//根据id查询预订信息
	public ReserveInfo selectReserById(int roomId){
		return liveInfo.selectReserById1(roomId);
	}
	//查询预订信息
	public List<ReserveInfo> selectReser(){
		return liveInfo.selectReser();
	}
	//修改预定信息为入住
	public int insertLive(LiveInfo live){
		return liveInfo.insertLive(live);
	}
	//修改房间为净房
	public int updateJing(int roomId){
		return liveInfo.updateJing(roomId);
	}
	//退房查询
	public List<LiveInfo> selectLiveInfo(int roomId){
		return liveInfo.selectLiveInfo(roomId);
	}
	//结算
	public int insertCheck(Checkout check){
		return liveInfo.insertCheck(check);
	}
	//改变入住信息标识
	public int updateBiao(int roomId){
		return liveInfo.updateBiao(roomId);
	}
	//修改房间状态为脏房
	public int updateZang(int roomId){
		return liveInfo.updateZang(roomId);
	}

	//根据房间号查找入住信息
	public LiveInfo findByRoomId(int roomId){
		return liveInfo.findByRoomId(roomId);
	}

	//更换房间
	public int updateLive(LiveInfo live){
		return liveInfo.updateLive(live);
	}

	public List<ProductBill> SelectProductBill(String time) {
		return liveInfo.SelectProductBill(time);
	}//根据当天时间查看是不是已经有盈利了
	public int InsertProductBill(ProductBill bill) {
		return liveInfo.InsertProductBill(bill);
	}//录入盈利表
	public int UpdateProductBill(ProductBill bill) {
		return liveInfo.UpdateProductBill(bill);
	}//修改盈利表
	public List<ProductBill> SelectProductBill2() {
		return liveInfo.SelectProductBill2();
	}//查看盈利表的数据
	//查询退房
	/*public List<RoomInfo> selectTui(){
		return liveInfo.selectTui();
	}*/
	public List<RoomState> selectRoomA(int roomId){
		return liveInfo.selectRoomA(roomId);
	}

	public List<RoomInfo> selectRrr(){
		return liveInfo.selectRrr();
	}
	//在住信息
	public List<LiveInfo> selectLiveInfoS(Map<String,Object> map){
		return liveInfo.selectLiveInfoS(map);
	}
	//查询在住总人数
	public int total(Map map){
		return liveInfo.total(map);
	}

	public List<Checkout> checkSelect(Map<String,Object> map){
		return liveInfo.checkSelect(map);
	}
	//按条件查询消费表的总条数
	public int totalComm(Map map){
		return liveInfo.totalComm(map);
	}

}
