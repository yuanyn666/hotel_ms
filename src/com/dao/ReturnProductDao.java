package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.DepotProduct;
import com.entity.ProductBill;
import com.entity.ProductInfo;
import com.entity.ReturnProduct;
import com.entity.ReturnProductDetail;
public interface ReturnProductDao {
	
	public List<ProductInfo> findproducts();
	public int AddReturnProduct(ReturnProduct p);
	public int AddReturnProductDetail(ReturnProductDetail pu);
	public int updateDeProduct(DepotProduct d);
	
	public DepotProduct findDetProduct(String productId);
	public List<ReturnProduct> FindsRetProduct(Map<String, String> map);
	public List<ReturnProductDetail>FindsRetProductDetail(String returnId);
	
	
	public List<ProductBill> SelectProductBill(String time);
	public int InsertProductBill(ProductBill bill);
	public int UpdateProductBill(ProductBill bill);

}
