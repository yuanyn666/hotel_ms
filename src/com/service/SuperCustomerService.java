package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SuperCustomerDao;
import com.entity.SuperCustomer;

@Service
public class SuperCustomerService {
	@Autowired
	private SuperCustomerDao scd;
	//增加会员
	public int insertSuper(SuperCustomer superCus){
		return scd.insertSuper(superCus);
	}
	//删除会员
	public int deleteSuper(String SuperId){
		return scd.deleteSuper(SuperId);
	}
	//修改会员
	public int updateSuper(SuperCustomer superCus){
		return scd.updateSuper(superCus);
	}
	//查找会员
	public List<SuperCustomer> findAllSuper(){
		return scd.findAllSuper();
	}
	//根据会员卡号精确查找
	public SuperCustomer findBySuperId(String SuperId){
		return scd.findBySuperId(SuperId);
	}
	//根据会员卡号模糊查找
	public List<SuperCustomer> findBySpId(String spId){

		return scd.findBySpId(spId);
	}
	//会员充值
	public int insertMoney(SuperCustomer sp){
		return scd.insertMoney(sp);
	}
}
