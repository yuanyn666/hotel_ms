package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Checkout;
import com.entity.CustomerType;
import com.entity.LiveInfo;
import com.entity.ProductBill;
import com.entity.ReserveInfo;
import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;
import com.entity.Users;

public interface LiveInfoDao {
	//查询房间
	public List<RoomInfo> selectInfo();
	//添加入住信息
	public int insert(LiveInfo live);
	//根据房间编号查询房间号
	public List<RoomInfo> selectA(int roomId);
	//查询客户类型
	public List<CustomerType> select();
	//查询房价，房类以及房态
	public List<RoomInfo> selectR();
	public List<RoomInfo> selectRE();
	//根据房间号查询房价，房类以及房态
	public List<RoomInfo> selectOne(int roomId);

	//根据房间类型查询房价，房类以及房态
	public List<RoomInfo> selectT(String roomstate);
	//查询房间类型
	public List<RoomType> selectS();
	//根据房间类型id获取信息
	public RoomType findRTypeById(int roomTypeId);
	//修改房间类型
	public int update(int roomId);
	//修改为预定
	public int updateRe(int roomId);
	//查询住房信息
	public List<LiveInfo> selectL(int roomId);
	//根据房间号查找类型
	public List<RoomInfo> selectType(int roomId);
	//续房缴费
	public int insertXu(LiveInfo live);
	//查询房间状态
	public List<RoomState> selectRoom();
	//修改房间状态
	public int updateR(RoomInfo roominfo);


	//
	public List<RoomInfo> findRoomInfoById(int roomtypeId);
	//录入预定信息
	public int insertReser(ReserveInfo reserveinfo);

	//删除房间信息
	public int delete(int roomId);

	//bookReserve
	//查询预订信息
	public ReserveInfo selectReserById1(int roomId);

	//查询预订信息
	public List<ReserveInfo> selectReser();
	//修改预定信息为入住
	public int insertLive(LiveInfo live);
	//修改房间为净房
	public int updateJing(int roomId);
	//退房查询
	public List<LiveInfo> selectLiveInfo(int roomId);
	//结算
	public int insertCheck(Checkout check);
	//改变入住信息标识
	public int updateBiao(int roomId);
	//修改房间状态为脏房
	public int updateZang(int roomId);
	//根据房间号查找入住信息
	public LiveInfo findByRoomId(int roomId);
	//更换房间
	public int updateLive(LiveInfo live);
	public List<ProductBill> SelectProductBill(String time);//根据当天时间查看是不是已经有盈利了
	public int InsertProductBill(ProductBill bill);//录入盈利表
	public int UpdateProductBill(ProductBill bill);//修改盈利表
	public List<ProductBill> SelectProductBill2();//查看盈利表的数据
	/* //查询退房
       public List<RoomInfo> selectTui();*/
	public List<RoomState> selectRoomA(int roomId);
	public List<RoomInfo> selectRrr();

	public List<LiveInfo> selectLiveInfoS(Map<String,Object> map);
	//查询在住总人数
	public int total(Map map);
	//
	public List<Checkout> checkSelect(Map<String,Object> map);
	public int totalComm(Map map);//按条件查询消费表的总条数
}

