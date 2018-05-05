package com.dao;

import java.util.List;
import java.util.Map;



import com.entity.Bad;
import com.entity.BreakDetai;
import com.entity.Checkout;
import com.entity.CustomerBreak;
import com.entity.DepotProduct;
import com.entity.JiaoJie;
import com.entity.LiveInfo;
import com.entity.ProductBill;
import com.entity.ReturnProduct;
import com.entity.ReturnProductDetail;
import com.entity.Spend;
import com.entity.SpendInfo;
import com.entity.SpendProdut;

public interface ProductSalDao {//高辉
	public List<DepotProduct> SelectProduct(Map map);//所有的商品 客人消费
	public int totalComm3(Map map);//按条件查询所有的商品的总条数
	public List<Bad> SelectBad2(Map map);//所有的损坏 客人损坏
	public int totalComm4(Map map);//按条件查询所有的商品的总条数
	public int InsertSpend(Spend spend);//给客人消费主表录入数据
	public List<LiveInfo> SelectLiveInfo(String roomId);//根据房间的订单编号获取一个对xiang
	public int InsertSpendInfo(SpendInfo info);//给客人消费细表录入数据
	public int UpdateDepotProduct(SpendInfo info);//付款之后修改库存信息
	public int InsertBreak(CustomerBreak bk);//给损坏主表录入数据
	public int InsertBreakInfo(BreakDetai brinfo);//给客人消费细表录入数据
	public List<SpendInfo> SerchProductSalInfo(String spendId);//查看可客人的消费明细
	public List<Spend> SerchProductSalByChar(Map<String,Object> map);//查看可客人的消费（按条件）
	public int totalComm(Map map);//按条件查询消费表的总条数
	public List<CustomerBreak> SerchBreakChar(Map<String,Object> map);//查看损坏（按条件）
	public List<CustomerBreak> SerchBreakById(String liveid);//查看某个客人的损坏记录（添加消费的时候查看记录）
	public int totalComm2(Map map);//按条件查询损坏表的总条数
	public List<BreakDetai> SerchBreakInfo(String spendId);//查看损坏明细
	public List<Spend> SerchProductSalById(String liveid);//查看某个客人的消费记录（添加消费的时候查看记录）
	public int InsertSpendProdut(SpendProdut Sp);//录入商品售卖总结
	public List<SpendProdut>SerchSpendProdut(Map<String, String> map); //查询商品售卖总结
	public int selectjin(String productid);//根据商品的id查询商品的进价
	public List<ProductBill> SelectProductBill(String time);//根据当天时间查看是不是已经有盈利了
	public int InsertProductBill(ProductBill bill);//录入盈利表
	public int UpdateProductBill(ProductBill bill);//修改盈利表
	public List<ProductBill> SelectProductBill2(Map map);//查看盈利表的数据
	public List<Bad> SelectBad(Map map);//查看顺坏基本表数据
	public int AddBad(Bad bad);//添加顺坏基本表数据
	public int UpdateBad(Bad bad);//修改顺坏基本表数据
	public int deleteBad(int id);//三处顺坏基本表数据
	public int insertjiaojie(JiaoJie jiaojie);//录入交接班
	public List<JiaoJie> Serchjiaojie(Map<String,Object> map);//查看jiaojie（按条件）
	public int totalComm5(Map map);//按条件查询交接表的总条数
	public List<JiaoJie> Serchjiaojiexi(String jiaojieid);//查看交接细的
	public int updatejiaojiexi(JiaoJie jiaojie);//修改交接
	public List<ProductBill> SelectProductBill3(Map map);//查看盈利表的数据
	public int totalComm6(Map map);//按条件查询盈利表的总条数
	public List<Spend> SerchProductying(Map<String,Object> map);//按时间查询消费盈利
	public int totalComm7(Map map);//按条件消费盈利总条数

	public List<Checkout> selectjie(Map<String,Object> map);//按天查看结算表的数据
	public int totalComm8(Map map);//查看结算表的条数
	public List<ReturnProduct> selecttui(Map<String,Object> map);//按天查看退货表的数据
	public int totalComm9(Map map);//查看退货表的条数
	public List<ReturnProductDetail>selecttuiming(String returnId);//查看退货明细
}
