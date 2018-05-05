package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReturnProductDao;
import com.entity.DepotProduct;
import com.entity.ProductBill;
import com.entity.ProductInfo;
import com.entity.ReturnProduct;
import com.entity.ReturnProductDetail;

@Service
public class ReturnProductService {
	@Autowired
	private ReturnProductDao dao;
	public List<ProductInfo> findproducts()
	{
		return dao.findproducts();
	}
	public int AddReturnProduct(ReturnProduct p)
	{
		return dao.AddReturnProduct(p);
	}
	public int AddReturnProductDetail(ReturnProductDetail pu)
	{
		return dao.AddReturnProductDetail(pu);
	}
	public int updateDeProduct(DepotProduct d)
	{
		return dao.updateDeProduct(d);
	}
	public DepotProduct findDetProduct(String productId)
	{
		return dao.findDetProduct(productId);
	}

	public List<ReturnProduct> FindsRetProduct(Map<String, String> map)
	{
		return dao.FindsRetProduct(map);
	}
	public List<ReturnProductDetail>FindsRetProductDetail(String returnId)
	{
		return dao.FindsRetProductDetail(returnId);
	}
	public List<ProductBill> SelectProductBill(String time) {
		return dao.SelectProductBill(time);
	}//��ݵ���ʱ��鿴�ǲ����Ѿ���ӯ����
	public int InsertProductBill(ProductBill bill) {
		return dao.InsertProductBill(bill);
	}//¼��ӯ���
	public int UpdateProductBill(ProductBill bill) {
		return dao.UpdateProductBill(bill);
	}//�޸�ӯ���
}
