package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.DepotProduct;
import com.entity.ProductInfo;
import com.service.ProductInfoService;


@Controller
public class ProductInfoController {
	@Resource
	private ProductInfoService service;
	//查找所有
	@RequestMapping("/findAllP")
	public String findAllP(Model model){
		List<ProductInfo>list=service.findAllP();
		model.addAttribute("list", list);
		return "showProductInfo";
	}
	//查找下架商品
	@RequestMapping("/findAllP1")
	public String findAllP1(Model model){
		List<ProductInfo>list=service.findAllP1();
		model.addAttribute("list", list);
		return "showProductInfoT";
	}

	//根据类型查找
	@RequestMapping("/findName")
	public String findName(Model model,String productName){
		List<ProductInfo> pro=service.findName(productName);
		model.addAttribute("list", pro);
		return "showProductInfo";
	}

	//根据类型查找
	@RequestMapping("/findNameT")
	public String findNameT(Model model,String productName){
		List<ProductInfo> pro=service.findNameT(productName);
		model.addAttribute("list", pro);
		return "showProductInfoT";
	}

	//根据id查找
	@RequestMapping("/findByIdP")
	public String findIdP(Model model,String id){
		ProductInfo pp=service.findByIdP(id);
		model.addAttribute("list", pp);
		return "updateProductInfo";
	}




	//添加
	@RequestMapping("/insertP")
	public String insertP(String productId,String productName,String productAddress,String productSort,String buyPrice,String retailoPrice,String state,String ProductUction ){
		ProductInfo p=  new ProductInfo(productId, productName, productAddress, Integer.parseInt(buyPrice), Integer.parseInt(retailoPrice), productSort, Integer.parseInt(state), ProductUction);
		service.insertP(p);
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String depotPId="KC"+df2.format(new Date());
		String totalMoney ="0";
		String depotId ="1";
		DepotProduct d =new DepotProduct(depotPId,productId,productSort,0,totalMoney,depotId,buyPrice,Integer.parseInt(retailoPrice),Integer.parseInt(retailoPrice)-Integer.parseInt(buyPrice),50,500);
		service.insertD(d);

		return "redirect:findAllP";
	}
	//修改
	@RequestMapping("/updateP")
	public String updateP(ProductInfo p){
		service.updateP(p);
		return "redirect:findAllP";
	}

	//下架
	@RequestMapping("/updateState")
	public String updateState(@RequestParam("productId")String productId){
		service.updateState(productId);
		return "redirect:findAllP";
	}
	//上架
	@RequestMapping("/updateStateT")
	public String updateStateT(@RequestParam("productId")String productId){
		service.updateStateT(productId);
		return "redirect:findAllP1";

	}
	//删除
	@RequestMapping("/deleteP")
	public String deleteP(String id){
		service.deleteP(id);
		return "success";
	}
	//商品编号
	@RequestMapping("/insertProductInfo1")
	public String getDate(Model model, String productSort){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyddHHmmss");
		String productId=sdf.format(new Date());
		model.addAttribute("date", productId);
		return "insertProductInfo";
	}
}
