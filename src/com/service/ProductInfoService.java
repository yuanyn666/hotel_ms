package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductInfoDao;
import com.entity.DepotProduct;
import com.entity.ProductInfo;

@Service
public class ProductInfoService {
	@Autowired
	private ProductInfoDao dao;

	//删除
	public int deleteP(String id) {
		return dao.deleteP(id);
	}

	//查找所有
	public List<ProductInfo> findAllP() {
		return dao.findAllP();
	}
	//查找下架商品
	public List<ProductInfo> findAllP1() {
		return dao.findAllP1();
	}

	//查id
	public ProductInfo findByIdP(String productId) {
		return dao.findByIdP(productId);
	}

	//查name
	public List<ProductInfo> findName(String productName) {
		return dao.findName(productName);
	}
	//查name
	public List<ProductInfo> findNameT(String productName) {
		return dao.findNameT(productName);
	}

	//添加
	public int insertP(ProductInfo p) {
		return dao.insertP(p);
	}

	//添加1
	public int insertD(DepotProduct d){
		return dao.insertD(d);
	}

	//修改
	public int updateP(ProductInfo p) {
		return dao.updateP(p);
	}
	//
	public int updateState(String productId){
		return dao.updateState(productId);
	}
	//
	public int updateStateT(String productId){
		return dao.updateStateT(productId);
	}
}
