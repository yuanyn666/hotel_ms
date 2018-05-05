package com.dao;

import java.util.List;

import com.entity.DepotProduct;

public interface DepotProductDao {
	//查找所有
	public List<DepotProduct>findAllDepotProduct();

	//根据类别查
	public List<DepotProduct> findProducttype(String producttype);


}
