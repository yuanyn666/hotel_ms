package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DepotInfoDao;
import com.entity.DepotInfo;
import com.entity.DepotProduct;
@Service
public class DepotInfoService {
	@Autowired
	private DepotInfoDao dao;
	//查找所有
	public List<DepotInfo>findAllD(){
		return dao.findAllD();
	}
	//查找id
	public DepotInfo findByIdDe(String depotId) {
		return dao.findByIdDe(depotId);
	}
	//修改
	public int updateDepotInfo(DepotInfo d) {
		return dao.updateDepotInfo(d);
	}
	//添加
	public int insertDepotInfo(DepotInfo d) {
		return dao.insertDepotInfo(d);
	}
	//删除
	public int deleteDepotInfo(String id) {
		return dao.deleteDepotInfo(id);
	}


}
