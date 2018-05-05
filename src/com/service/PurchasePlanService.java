package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PurchasePlanDao;
import com.entity.ProductInfo;
import com.entity.PurchasePlan;
import com.entity.PurchasePlanDetail;

@Service
public class PurchasePlanService {
	@Autowired
	private PurchasePlanDao dao;

	public List<ProductInfo> findproduct()
	{
		return dao.findproduct();
	}

	public int AddPurchasePlan(PurchasePlan p)
	{
		return dao.AddPurchasePlan(p);
	}

	public int AddPurchasePlanDetail(PurchasePlanDetail pu)
	{
		return dao.AddPurchasePlanDetail(pu);
	}

	public List<PurchasePlan> FindPurchasePlan(Map<String, String> map)
	{
		return dao.FindPurchasePlan(map);
	}

	public List<PurchasePlanDetail>FindPurchasePlanDetail(String planId)
	{
		return dao.FindPurchasePlanDetail(planId);
	}
	public int daletePurDetail(String planId)
{
	return dao.daletePurDetail(planId);
}


}
