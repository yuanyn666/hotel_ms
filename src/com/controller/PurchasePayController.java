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
import com.entity.PurchasePay;
import com.entity.PurchasePayDetail;
import com.service.PurchasePayService;
@Controller
public class PurchasePayController {
	@Resource
	private PurchasePayService service;

	@RequestMapping("/addPurchasePay")
	public String add(HttpServletRequest requset)
	{
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String payId="FK"+df2.format(new Date());
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String payTime = time.format(new Date());
		String mark = requset.getParameter("mark");
		if (mark=="") {
			mark="无";
		}
		int payMoney = Integer.parseInt(requset.getParameter("payMoney"));
		String userid = requset.getParameter("UserId");
		String useridc = requset.getParameter("userId1");
		PurchasePay p = new PurchasePay(payId,payTime,payMoney,"无",Integer.parseInt(userid),Integer.parseInt(useridc),"未付款",mark);
		service.AddPurchasePay(p);

		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddHHmmss");
		String payDetaId="FKMX"+df.format(new Date());
		String orderId = requset.getParameter("id");
		PurchasePayDetail pu = new PurchasePayDetail(payDetaId,payId,orderId);
		service.AddPurchasePayDetail(pu);


		PurchaseOrder po = new PurchaseOrder(orderId,"无","无","已生成订单");
		service.updateOrder(po);

		return "OK";
	}

	@RequestMapping("/FindPurPay")
	@ResponseBody
	public List<PurchasePay> Find(HttpServletRequest request)
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
		List<PurchasePay> list = service.FindPurchasePay(map);
		return list;
	}


	@RequestMapping("/FindPayDetail")
	@ResponseBody
	public List<PurchasePayDetail> FindPaDetail(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		List<PurchasePayDetail> list = service.FindPurchasePayDetail(id);
		return list;
	}


	@RequestMapping("/listPayDetail")
	public String ListPaDetail(Model m,String id,Model mo)
	{
		List<PurchasePayDetail> list = service.FindPurchasePayDetail(id);
		m.addAttribute("list",list);
		mo.addAttribute("orderId", id);
		return "PurchasePay";
	}
	@RequestMapping("/listPayD")
	public String ListPaD(Model m,String id,Model mo)
	{
		List<PurchasePayDetail> list = service.FindPurchasePayDetail(id);
		m.addAttribute("list",list);
		mo.addAttribute("orderId", id);
		return "PurchasePay";
	}

	@RequestMapping("/updatePay")
	public String updatePay(String payId,String orderId,HttpServletRequest request) throws UnsupportedEncodingException
	{
		String address = request.getParameter("address");
		String types = request.getParameter("types");
		byte[]b=address.getBytes("ISO-8859-1");
		String addresss = new String(b,"utf-8");

		PurchasePay pp =new PurchasePay(payId,types,"已付款");
		service.updatePay(pp);
		PurchaseOrder po = new PurchaseOrder(orderId,types,addresss,"已付款");
		service.updateOrder(po);
		return "OK";
	}

}
