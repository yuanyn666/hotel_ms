package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StiorageDao;
import com.entity.DepotProduct;
import com.entity.Stiorage;
import com.entity.StiorageDetail;

@Service
public class StiorageService {
	@Autowired
	private StiorageDao dao;
	
	public int addDepotProduct(Stiorage s)
	{
		return dao.addDepotProduct(s);
	}
	public int addDepotProductDetail(StiorageDetail sd)
	{
		return dao.addDepotProductDetail(sd);
	}
	public DepotProduct findDepotProduct(String productId)
	{
		return dao.findDepotProduct(productId);
	}
	
	public int updateDepotProduct(DepotProduct d)
	{
		return dao.updateDepotProduct(d);
	}
	
	public int updateOrders(String orderId)
	{
		return dao.updateOrders(orderId);
	}
	public List<Stiorage> FindStiorage(Map<String, String> map)
	{
		return dao.FindStiorag(map);
	}
	
	public List<StiorageDetail>FindStiorageDetail(String id)
	{
		return dao.FindStiorageDetail(id);
	}
}
