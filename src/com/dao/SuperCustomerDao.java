package com.dao;

import java.util.List;

import com.entity.SuperCustomer;

public interface SuperCustomerDao {
	//增加会员
	public int insertSuper(SuperCustomer superCus);
	//删除会员
	public int deleteSuper(String SuperId);
	//修改会员
	public int updateSuper(SuperCustomer superCus);
	//查找会员
	public List<SuperCustomer> findAllSuper();
	//根据会员卡号精确查找
	public SuperCustomer findBySuperId(String SuperId);
	//根据会员卡号模糊查找
	public List<SuperCustomer> findBySpId(String spId);
	//会员充值
	public int insertMoney(SuperCustomer sp);
}
