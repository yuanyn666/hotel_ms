package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.DepotProduct;
import com.entity.Stiorage;
import com.entity.StiorageDetail;

public interface StiorageDao {
	public int addDepotProduct(Stiorage s);
	public int addDepotProductDetail(StiorageDetail sd);
	
	public List<Stiorage> FindStiorag(Map<String, String> map);
	public List<StiorageDetail>FindStiorageDetail(String id);
	
	public DepotProduct findDepotProduct(String productId);
	public int updateDepotProduct(DepotProduct d);
	public int updateOrders(String orderId);
}
