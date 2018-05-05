package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.PurchaseOrder;
import com.entity.PurchasePay;
import com.entity.PurchasePayDetail;
import com.entity.PurchasePlan;

public interface PurchasePayDao {
	
	public int AddPurchasePay(PurchasePay p);
	public int AddPurchasePayDetail(PurchasePayDetail p);
	
	public List<PurchasePay> FindPurchasePay(Map<String, String> map);
	public List<PurchasePayDetail> FindPurchasePayDetail(String payId);
	public int updatePay(PurchasePay p); 
	public int updateOrder(PurchaseOrder po);
}
