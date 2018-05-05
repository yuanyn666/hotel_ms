package com.dao;

import java.util.List;

import com.entity.DepotProduct;
import com.entity.ProductInfo;

public interface ProductInfoDao {
	public int insertP(ProductInfo p);//添加
	public int insertD(DepotProduct d);//添加

	public int deleteP(String id);//删除
	public int updateP(ProductInfo p);//修改

	public int updateState(String productId);//修改状态

	public int updateStateT(String productId);//修改状态
	public List<ProductInfo>findAllP1();//查找下架商品
	public List<ProductInfo> findNameT(String productName);//根据productName查找

	public List<ProductInfo>findAllP();//查找所有
	public ProductInfo findByIdP(String id);//根据id查找
	public List<ProductInfo> findName(String productName);//根据productName查找
}
