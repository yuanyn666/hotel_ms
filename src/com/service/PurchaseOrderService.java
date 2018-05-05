package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PurchaseOrderDao;
import com.entity.PurchaseOrder;
import com.entity.PurchaseOrderDetail;
import com.entity.PurchasePlan;

@Service
public class PurchaseOrderService {
	@Autowired
	private PurchaseOrderDao dao;
	
	public int AddPurchaseOrder(PurchaseOrder p)
	{
		return dao.AddPurchaseOrder(p);
	}
	public int AddPurchaseOrderDetail(PurchaseOrderDetail p)
	{
		return dao.AddPurchaseOrderDetail(p);
	}
	public int updatePurchasePlan(String planId)
	{
		return dao.updatePurchasePlan(planId);
	}
	
	public List<PurchaseOrder> FindPurchaseOrder(Map<String, String> map)
	{
		return dao.FindPurchaseOrder(map);
	}
	public List<PurchaseOrderDetail>FindPurchaseOrderDetail(String id)
	{
		return dao.FindPurchaseOrderDetail(id);
	}
	public int deleteFindPurchaseOrderDetail(String id)
	{
		return dao.deleteFindPurchaseOrderDetail(id);
	}
}
