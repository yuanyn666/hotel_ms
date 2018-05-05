package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.DepotProduct;
import com.entity.Stiorage;
import com.entity.StiorageDetail;
import com.service.StiorageService;

@Controller
public class StiorageController {
	@Resource
	private StiorageService service;
	
	@RequestMapping("/addStiorage")
	public String add(String[] productId,String[] productSum,String[] buyPrice,String godownId,String stiorageId,String orderId,String Depotime,String mark,String UserId,String userId1)
	{
		Stiorage s = new Stiorage(stiorageId,Integer.parseInt(UserId),orderId,Depotime,godownId,Integer.parseInt(userId1),mark);
		service.addDepotProduct(s);
		service.updateOrders(orderId);
		for (int i = 0; i < productId.length; i++) {
			StiorageDetail sd = new StiorageDetail(stiorageId,productId[i],Integer.parseInt(productSum[i]));
			service.addDepotProductDetail(sd);
			DepotProduct d = service.findDepotProduct(productId[i]);
			DepotProduct depo = new DepotProduct(productId[i],Integer.parseInt(productSum[i])+d.getDepotNum(),Integer.toString(Integer.parseInt(productSum[i])*Integer.parseInt(buyPrice[i])+Integer.parseInt(d.getTotalMoney())));
			service.updateDepotProduct(depo);
		}
		return "OK";
	}
	
	
	
	@RequestMapping("/FindsStiorage")
	@ResponseBody//
	public List<Stiorage> FindStior(HttpServletRequest request)
	{
		Map<String, String> map=new HashMap<String, String>();
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String spanid = request.getParameter("spanid");
		if(begin==""&&end!=""){
			begin="2016-01-01";
		}
		if(begin!=""&&end==""){
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			end=time;
		}
		map.put("spanid", spanid);
		map.put("begin", begin);
		map.put("end", end);
		List<Stiorage> list = service.FindStiorage(map);
		
		return list;
	}
	@RequestMapping("/FindsStiorageDetail")
	@ResponseBody
	public List<StiorageDetail> FindStiorDetail(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		List<StiorageDetail> list = service.FindStiorageDetail(id);
		return list;
	}
	
	
}
