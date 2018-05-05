package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.ProductInfo;
import com.entity.PurchasePlan;
import com.entity.PurchasePlanDetail;

public interface PurchasePlanDao {
	public List<ProductInfo> findproduct();
	
	public int AddPurchasePlan(PurchasePlan p);
	public int AddPurchasePlanDetail(PurchasePlanDetail pu);
	
	public List<PurchasePlan> FindPurchasePlan(Map<String, String> map);
	public List<PurchasePlanDetail>FindPurchasePlanDetail(String planId);
	
	public int daletePurDetail(String planId);
}
