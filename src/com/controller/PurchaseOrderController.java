package com.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
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

import com.entity.PurchaseOrder;
import com.entity.PurchaseOrderDetail;
import com.entity.PurchasePlan;
import com.service.PurchaseOrderService;

@Controller
public class PurchaseOrderController {
	@Resource
	private PurchaseOrderService service;

	@RequestMapping("/adPurchaseOrder")
	public String addOrder(HttpServletRequest request)
	{
		int UserId=Integer.parseInt(request.getParameter("UserId"));

		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String orderId="CGD"+df2.format(new Date());
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String orderDate = time.format(new Date());
		String planId = request.getParameter("id");
		String useridc = request.getParameter("userId1");
		PurchaseOrder p = new PurchaseOrder(orderId,planId,UserId,orderDate,"无","无",0,"无","未付款",Integer.parseInt(useridc));
		service.AddPurchaseOrder(p);

		String productId[] = request.getParameterValues("productId");
		String productName[] = request.getParameterValues("productName");
		String productSum[] = request.getParameterValues("productSum");
		String buyPrice[] = request.getParameterValues("buyPrice");
		for (int i = 0; i < productId.length; i++) {
			PurchaseOrderDetail pu = new PurchaseOrderDetail(orderId,productId[i],productName[i],Integer.parseInt(productSum[i]),Integer.parseInt(buyPrice[i]));
			service.AddPurchaseOrderDetail(pu);
		}
		service.updatePurchasePlan(planId);
		return "OK";
	}

	@RequestMapping("/FindPurchaseOrder")
	@ResponseBody//
	public List<PurchaseOrder> FindOrder(HttpServletRequest request)
	{
		Map<String, String> map=new HashMap<String, String>();
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String start = request.getParameter("start");
		String spanid = request.getParameter("spanid");
		if (start==null)
		{
			start="全部";
		}

		if (start.equals("全部"))
		{
			start="";
		}
		if(begin==""&&end!=""){
			begin="2016-01-01";
		}
		if(begin!=""&&end==""){
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			end=time;
		}
		map.put("start",start);
		map.put("spanid",spanid);
		map.put("begin", begin);
		map.put("end", end);
		List<PurchaseOrder> list = service.FindPurchaseOrder(map);
		return list;
	}

	@RequestMapping("/FindOrderDetail")
	@ResponseBody
	public List<PurchaseOrderDetail> FindODetail(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		List<PurchaseOrderDetail> list = service.FindPurchaseOrderDetail(id);
		return list;
	}
	@RequestMapping("/ListOrderDetail")
	public String ListODetail(Model m,String id,Model mo,String st,Model sta) throws UnsupportedEncodingException
	{
		byte[]	b = st.getBytes("ISO-8859-1");
		String	state = new String(b,"utf-8");
		List<PurchaseOrderDetail> list = service.FindPurchaseOrderDetail(id);
		sta.addAttribute("start",state);
		m.addAttribute("list",list);
		mo.addAttribute("orderId", id);
		return "FindPurchaseOrderDetail";
	}

	@RequestMapping("/ListOrderD")
	public String ListOl(Model m,String id,Model mo,Model ruku,Model times)
	{
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String rukudan="RK"+df2.format(new Date());

		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String Depotime = time.format(new Date());
		List<PurchaseOrderDetail> list = service.FindPurchaseOrderDetail(id);
		times.addAttribute("Depotime",Depotime);
		m.addAttribute("list",list);
		ruku.addAttribute("rukudan",rukudan);
		mo.addAttribute("orderId",id);
		return "Stiorage";
	}

	@RequestMapping("/updateOrderDetail")
	public String update(String id,HttpServletRequest request)
	{
		service.deleteFindPurchaseOrderDetail(id);
		String productId[] = request.getParameterValues("productId");
		String productName[] = request.getParameterValues("productName");
		String productSum[] = request.getParameterValues("productSum");
		String buyPrice[] = request.getParameterValues("buyPrice");
		for (int i = 0; i < productId.length; i++) {
			PurchaseOrderDetail pu = new PurchaseOrderDetail(id,productId[i],productName[i],Integer.parseInt(productSum[i]),Integer.parseInt(buyPrice[i]));
			service.AddPurchaseOrderDetail(pu);
		}
		return "OK";
	}
}
