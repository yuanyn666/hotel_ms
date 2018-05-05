package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PurchasePayDao;
import com.entity.PurchaseOrder;
import com.entity.PurchasePay;
import com.entity.PurchasePayDetail;
import com.entity.PurchasePlan;

@Service
public class PurchasePayService {
	@Autowired
	private PurchasePayDao dao;
	public int AddPurchasePay(PurchasePay p)
	{
		return dao.AddPurchasePay(p);
	}
	public int AddPurchasePayDetail(PurchasePayDetail p)
	{
		return dao.AddPurchasePayDetail(p);
	}
	public List<PurchasePay> FindPurchasePay(Map<String, String> map)
	{
		return dao.FindPurchasePay(map);
	}
	public List<PurchasePayDetail> FindPurchasePayDetail(String payId)
	{
		return dao.FindPurchasePayDetail(payId);
	}
	public int updatePay(PurchasePay p)
	{
		return dao.updatePay(p);
	}
	public int updateOrder(PurchaseOrder po)
	{
		return dao.updateOrder(po);
	}
	
}
