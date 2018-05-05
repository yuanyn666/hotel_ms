package com.dao;

import java.util.List;

import com.entity.DepotInfo;
import com.entity.DepotProduct;

public interface DepotInfoDao {
	public List<DepotInfo>findAllD();//查找所有
	public DepotInfo findByIdDe(String depotId);//根据depotId查找
	public int updateDepotInfo(DepotInfo d);//修改
	public int insertDepotInfo(DepotInfo d);//添加
	public int deleteDepotInfo(String id);//删除
}
