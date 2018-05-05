package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DepotProductDao;
import com.entity.DepotProduct;

@Service
public class DepotProductService {
	@Autowired
	private DepotProductDao dao;

	//查找所有
	public List<DepotProduct>findAllDepotProduct(){
		return dao.findAllDepotProduct();}

	//根据类别查
	public List<DepotProduct> findProducttype(String producttype) {
		return dao.findProducttype(producttype);
	}

}
