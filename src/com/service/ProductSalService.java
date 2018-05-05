package com.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductSalDao;
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

@Service
public class ProductSalService {//商品的销售 客人消费  高辉
	@Autowired
	private ProductSalDao dao;

	public ProductSalDao getDao() {
		return dao;
	}

	public void setDao(ProductSalDao dao) {
		this.dao = dao;
	}
	public List<DepotProduct> SelectProduct(Map map) {
		return dao.SelectProduct(map);
	}
	public int InsertSpend(Spend spend) {
		return dao.InsertSpend(spend);
	}
	public List<LiveInfo> SelectLiveInfo(String roomId) {
		return dao.SelectLiveInfo(roomId);
	}
	public int InsertSpendInfo(SpendInfo info) {
		return dao.InsertSpendInfo(info);
	}
	public int UpdateDepotProduct(SpendInfo f2) {
		return dao.UpdateDepotProduct(f2);
	}
	public int InsertBreak(CustomerBreak bk) {
		return dao.InsertBreak(bk);
	}//给损坏主表录入数据
	public int InsertBreakInfo(BreakDetai brinfo) {
		return dao.InsertBreakInfo(brinfo);
	}//给客人消费细表录入数据

	public List<SpendInfo> SerchProductSalInfo(String spendId) {
		return dao.SerchProductSalInfo(spendId);
	}
	public List<Spend> SerchProductSalByChar(Map<String,Object> map) {
		return dao.SerchProductSalByChar(map);
	}
	public List<CustomerBreak> SerchBreakChar(Map<String,Object> map) {
		return dao.SerchBreakChar(map);
	}//查看损坏（按条件）
	public List<BreakDetai> SerchBreakInfo(String spendId) {
		return dao.SerchBreakInfo(spendId);
	}//查看损坏明细
	public List<Spend> SerchProductSalById(String liveid) {
		return dao.SerchProductSalById(liveid);
	}//查看某个客人的消费记录（添加消费的时候查看记录）
	public int InsertSpendProdut(SpendProdut Sp) {
		return dao.InsertSpendProdut(Sp);
	}//录入商品总结
	public List<SpendProdut>SerchSpendProdut(Map<String, String> map) {
		return dao.SerchSpendProdut(map);
	} //查询商品售卖总结
	public int selectjin(String productid) {
		return dao.selectjin(productid);
	}//根据商品的id查询商品的进价
	public List<ProductBill> SelectProductBill(String time) {
		return dao.SelectProductBill(time);
	}//根据当天时间查看是不是已经有盈利了
	public int InsertProductBill(ProductBill bill) {
		return dao.InsertProductBill(bill);
	}//录入盈利表
	public int UpdateProductBill(ProductBill bill) {
		return dao.UpdateProductBill(bill);
	}//修改盈利表
	public List<ProductBill> SelectProductBill2(Map map) {
		return dao.SelectProductBill2(map);
	}//查看盈利表的数据
	public List<Bad> SelectBad(Map map) {
		return dao.SelectBad(map);
	}//查看顺坏基本表数据
	public int AddBad(Bad bad) {
		return dao.AddBad(bad);
	}//添加顺坏基本表数据
	public int UpdateBad(Bad bad) {
		return dao.UpdateBad(bad);
	}//修改顺坏基本表数据
	public int deleteBad(int id) {
		return dao.deleteBad(id);
	}//三处顺坏基本表数据
	public int totalComm(Map map) {
		return dao.totalComm(map);
	}//按条件查询消费表的总条数
	public int totalComm2(Map map) {
		return dao.totalComm2(map);
	}//按条件查询损坏表的总条数
	public int totalComm3(Map map) {
		return dao.totalComm3(map);
	}//按条件查询损坏表的总条数
	public List<Bad> SelectBad2(Map map) {
		return dao.SelectBad2(map);
	}//所有的损坏 客人损坏
	public int totalComm4(Map map) {
		return dao.totalComm4(map);
	}//按条件查询所有的商品的总条数
	public List<CustomerBreak> SerchBreakById(String liveid) {
		return dao.SerchBreakById(liveid);
	}//查看某个客人的消费记录（添加消费的时候查看记录）


	@Transactional//开启事务 客人消费
	public int zonr(String Spnedid,String liveid,String mark,int userId,String [] productId,String [] zj,String [] outDepotPrice){
		int a=0;
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date());
		if(mark==null){
			mark="";
		}
		Spend sp=new Spend(Spnedid,liveid,userId,mark,time);//以后那个操作人用session获取（点击登陆的时候把登录对象存到session）
		int i=InsertSpend(sp);//录入客人消费主表
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String info="info"+df2.format(new Date());//生成细表单号
		List<Integer>sum=new ArrayList<Integer>();
		for (int j = 0; j < productId.length; j++) {
			sum.add(Integer.parseInt(zj[j])/Integer.parseInt(outDepotPrice[j]));
		}

		List<String> productids=new ArrayList<String>();//一会保存商品的id
		List<Integer> sums=new ArrayList<Integer>();//一会保存商品的数量
		List<Integer> zjs=new ArrayList<Integer>();//一会保存商品的售卖总价
		List<Integer> jins=new ArrayList<Integer>();//一会保存商品的进价
		int z=0;//盈利
		//盈利的计算就是商品售卖的总价-各个商品的进价*数量
		int n=0;
		for (int j = 0; j < zj.length; j++) {//循环录入细表
			SpendInfo f=new SpendInfo(info+n,Spnedid,productId[j],sum.get(j),Integer.parseInt(zj[j]),time);
			InsertSpendInfo(f);//循环录入细表

			SpendInfo f2=new SpendInfo(productId[j],sum.get(j));
			UpdateDepotProduct(f2);//修改库存

			String spid="spid"+df2.format(new Date());//生成商品消费单号
			SpendProdut Sp=new SpendProdut(spid+n,userId,productId[j],sum.get(j),Integer.parseInt(zj[j]),time);//录入商品消费总结品的实体
			InsertSpendProdut(Sp);

			productids.add(productId[j]);
			sums.add(sum.get(j));//在循环中把数据添加到集合中，根据list的有序可重复的特性
			zjs.add(Integer.parseInt(zj[j]));
			n++;
		}
		for (int k = 0; k < productids.size(); k++) {
			jins.add(selectjin(productids.get(k)));//循环读取到进价
		}
		for (int j = 0; j < jins.size(); j++) {
			z+=zjs.get(j)-(jins.get(j)*sums.get(j));//循环累加获取盈利
		}
		SimpleDateFormat df3=new SimpleDateFormat("yyyy-MM-dd");
		String time3=df3.format(new Date());
		List<ProductBill> list5=SelectProductBill(time3);//先根据时间查询一下看看今天是不是啊已经有盈利了
		if(list5.size()!=0){//如果已经有了就实现修改，如果没有就实现录入
			ProductBill bill=new ProductBill(z,time3);
			UpdateProductBill(bill);//创建一个修改+=盈利的尸体对象
		}else{
			String aa="bill"+df2.format(new Date());//生成盈利编号
			ProductBill bill=new ProductBill(aa,userId,z,time3);//创建一个盈利的尸体对象
			InsertProductBill(bill);
		}
		List<ProductBill> list6=SelectProductBill(time3);
		for (ProductBill productBill : list6) {
			a=productBill.getJainMoney();
		}
		return a;
	}

	@Transactional//开启事务 客人损坏
	public int zonr2(String Spnedid,String liveid,String mark,int userId,String [] productId,String [] sum){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date());
		if(mark==null){
			mark="";
		}
		CustomerBreak sp=new CustomerBreak(Spnedid,liveid,userId,mark,time);//以后那个操作人用session获取
		int i=InsertBreak(sp);//录入损坏主表
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String info="info"+df2.format(new Date());//生成细表单号
		int n=0;
		for (int j = 0; j < sum.length; j++) {//循环录入细表
			BreakDetai f=new BreakDetai(info+n,Spnedid,productId[j],Integer.parseInt(sum[j]));
			InsertBreakInfo(f);
			System.out.println("ok");
			n++;
		}
		return n;
	}
	public int insertjiaojie(JiaoJie jiaojie) {
		return dao.insertjiaojie(jiaojie);
	}//录入交接班
	public List<JiaoJie> Serchjiaojie(Map<String,Object> map) {
		return dao.Serchjiaojie(map);
	}//查看jiaojie（按条件）
	public int totalComm5(Map map) {
		return dao.totalComm5(map);
	}//按条件查询交接表的总条数
	public List<JiaoJie> Serchjiaojiexi(String jiaojieid) {
		return dao.Serchjiaojiexi(jiaojieid);
	}//查看交接细的
	public int updatejiaojiexi(JiaoJie jiaojie) {
		return dao.updatejiaojiexi(jiaojie);
	}//修改交接
	public List<ProductBill> SelectProductBill3(Map map) {
		return dao.SelectProductBill3(map);
	}//查看盈利表的数据
	public int totalComm6(Map map) {
		return dao.totalComm6(map);
	}//按条件查询盈利表的总条数
	public List<Spend> SerchProductying(Map<String,Object> map) {
		return dao.SerchProductying(map);
	}//按时间查询消费盈利
	public int totalComm7(Map map) {
		return dao.totalComm7(map);
	}//按条件消费盈利总条数

	public List<Checkout> selectjie(Map<String,Object> map) {
		return dao.selectjie(map);
	}//按天查看结算表的数据
	public int totalComm8(Map map) {
		return dao.totalComm8(map);
	}//查看结算表的条数
	public List<ReturnProduct> selecttui(Map<String,Object> map) {
		return dao.selecttui(map);
	}//按天查看退货表的数据
	public int totalComm9(Map map) {
		return dao.totalComm9(map);
	}//查看退货表的条数
	public List<ReturnProductDetail>selecttuiming(String returnId) {
		return dao.selecttuiming(returnId);
	}//查看退货明细
}
