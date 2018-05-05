package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.DepotProduct;
import com.entity.ProductBill;
import com.entity.ProductInfo;
import com.entity.ReturnProduct;
import com.entity.ReturnProductDetail;
import com.service.ReturnProductService;

@Controller
public class ReturnProductController {
	@Resource
	private ReturnProductService service;

	@RequestMapping("/FindProducts")
	@ResponseBody
	public List<ProductInfo> findpro()
	{
		List<ProductInfo> list = service.findproducts();
		return list;
	}

	@RequestMapping("/returnDan")
	public String dan(Model d,Model t)
	{
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String returnId="TH"+df2.format(new Date());
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String returnDate = time.format(new Date());
		d.addAttribute("returnId", returnId);
		t.addAttribute("returnDate",returnDate);
		return "ReturnProduct";
	}

	@RequestMapping("/adReturnProduct")
	public String addPlan(HttpServletRequest request)
	{
		String UserId = request.getParameter("UserId");

		String returnId = request.getParameter("returnId");
		String returnDete = request.getParameter("returnDete");
		String mark = request.getParameter("mark");
		if (mark=="") {
			mark="无";
		}
		ReturnProduct p = new ReturnProduct(returnId,returnDete,"人民币",Integer.parseInt(UserId),Integer.parseInt(UserId),mark);
		service.AddReturnProduct(p);


		String productId[] = request.getParameterValues("productId");
		String returnNum[] = request.getParameterValues("returnNum");
		String price[] = request.getParameterValues("price");
		String totalMoney[] = request.getParameterValues("totalMoney");
		String returnMoney[] = request.getParameterValues("returnMoney");
		List<Integer> list2=new ArrayList<Integer>();
		int ying=0;
		for (int i = 0; i < productId.length; i++) {
			ReturnProductDetail pu = new ReturnProductDetail(returnId,productId[i],Integer.parseInt(returnNum[i]),Integer.parseInt(price[i]),Integer.parseInt(totalMoney[i]),Integer.parseInt(returnMoney[i]));
			service.AddReturnProductDetail(pu);
			DepotProduct de= service.findDetProduct(productId[i]);
			DepotProduct depo = new DepotProduct(productId[i],de.getDepotNum()-Integer.parseInt(returnNum[i]),Integer.toString(Integer.parseInt(de.getTotalMoney())-Integer.parseInt(returnNum[i])*Integer.parseInt(price[i])));
			service.updateDeProduct(depo);
			list2.add(Integer.parseInt(returnMoney[i])-Integer.parseInt(totalMoney[i]));
		}
		for (int i = 0; i < list2.size(); i++) {
			ying+=list2.get(i);
		}

		SimpleDateFormat df3=new SimpleDateFormat("yyyy-MM-dd");
		String time3=df3.format(new Date());
		List<ProductBill> list5=service.SelectProductBill(time3);
		if(list5.size()!=0){
			ProductBill bill=new ProductBill(ying,time3);
			service.UpdateProductBill(bill);
		}else{
			SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
			String aa="bill"+df2.format(new Date());
			ProductBill bill=new ProductBill(aa,Integer.parseInt(UserId),ying,time3);
			int r=service.InsertProductBill(bill);
			System.out.println("r"+r);
		}
		List<ProductBill> list6=service.SelectProductBill(time3);
		for (int i = 0; i < list6.size(); i++) {
			System.out.println(list6.get(i).getJainMoney());
		}
		return "OK";
	}


	@RequestMapping("/FindReturnsProduct")
	@ResponseBody//
	public List<ReturnProduct> FindReturn(HttpServletRequest request)
	{
		Map<String, String> map=new HashMap<String, String>();
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		if(begin==""&&end!=""){
			begin="2016-01-01";
		}
		if(begin!=""&&end==""){
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			end=time;
		}
		map.put("begin", begin);
		map.put("end", end);
		List<ReturnProduct> list = service.FindsRetProduct(map);
		return list;
	}
	@RequestMapping("/FindReturnsProductDetail")
	@ResponseBody
	public List<ReturnProductDetail> FindPDetail(HttpServletRequest request)
	{
		String returnId = request.getParameter("id");
		List<ReturnProductDetail> list = service.FindsRetProductDetail(returnId);
		return list;
	}
}
