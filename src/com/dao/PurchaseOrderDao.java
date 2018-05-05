package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.PurchaseOrder;
import com.entity.PurchaseOrderDetail;
import com.entity.PurchasePlan;

public interface PurchaseOrderDao {
	
	public int AddPurchaseOrder(PurchaseOrder p);//
	public int AddPurchaseOrderDetail(PurchaseOrderDetail p);//
	public int updatePurchasePlan(String planId);//
	
	public List<PurchaseOrder> FindPurchaseOrder(Map<String, String> map);
	public List<PurchaseOrderDetail>FindPurchaseOrderDetail(String id);
	public int deleteFindPurchaseOrderDetail(String id);
}
