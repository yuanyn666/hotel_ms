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

import com.entity.ProductInfo;
import com.entity.PurchasePlan;
import com.entity.PurchasePlanDetail;
import com.service.PurchasePlanService;

@Controller
public class PurchasePlanController {
	@Resource
	private PurchasePlanService service;

	@RequestMapping("/adPurchasePlan")
	public String addPlan(HttpServletRequest request)
	{
		String UserId = request.getParameter("UserId");
		String planId = request.getParameter("planId");
		String planDate = request.getParameter("planDate");
		String mark = request.getParameter("mark");
		if (mark=="") {
			mark="无";
		}
		PurchasePlan p = new PurchasePlan(planId,planDate,"未审核",Integer.parseInt(UserId),mark);
		service.AddPurchasePlan(p);

		String productId[] = request.getParameterValues("productId");
		String productName[] = request.getParameterValues("productName");
		String productSum[] = request.getParameterValues("productSum");
		String buyPrice[] = request.getParameterValues("buyPrice");
		for (int i = 0; i < productId.length; i++) {
			PurchasePlanDetail pu = new PurchasePlanDetail(planId,productId[i],productName[i],Integer.parseInt(productSum[i]),Integer.parseInt(buyPrice[i]));
			service.AddPurchasePlanDetail(pu);
		}
		return "OK";
	}

	@RequestMapping("/danhao")
	public String dan(Model d,Model t)
	{
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String planId="CGJH"+df2.format(new Date());
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String planDate = time.format(new Date());

		d.addAttribute("planId", planId);
		t.addAttribute("planDate",planDate);
		return "AddPurchasePlan";
	}



	@RequestMapping("/FindPurchasePlan")
	@ResponseBody//
	public List<PurchasePlan> FindPlan(HttpServletRequest request)
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
		List<PurchasePlan> list = service.FindPurchasePlan(map);
		return list;
	}
	@RequestMapping("/FindPlanDetail")
	@ResponseBody
	public List<PurchasePlanDetail> FindPDetail(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		List<PurchasePlanDetail> list = service.FindPurchasePlanDetail(id);
		return list;
	}

	@RequestMapping("/ListPlanDetail")
	public String ListPDetail(Model m,String id,Model mo,String st,Model t) throws UnsupportedEncodingException
	{
		byte[]	b = st.getBytes("ISO-8859-1");
		String	state = new String(b,"utf-8");
		List<PurchasePlanDetail> list = service.FindPurchasePlanDetail(id);
		m.addAttribute("list",list);
		mo.addAttribute("planId", id);
		t.addAttribute("state", state);
		return "FindPurchasePlanDetail";
	}
	@RequestMapping("/updatePlanDetail")
	public String updatePDetail(String id,HttpServletRequest request)
	{
		service.daletePurDetail(id);
		String productId[] = request.getParameterValues("productId");
		String productName[] = request.getParameterValues("productName");
		String productSum[] = request.getParameterValues("productSum");
		String buyPrice[] = request.getParameterValues("buyPrice");

		for (int i = 0; i < productId.length; i++) {
			PurchasePlanDetail pu = new PurchasePlanDetail(id,productId[i],productName[i],Integer.parseInt(productSum[i]),Integer.parseInt(buyPrice[i]));
			service.AddPurchasePlanDetail(pu);
		}
		return "OK";
	}
	@RequestMapping("/FindProduct")
	@ResponseBody
	public List<ProductInfo> findpro()
	{
		List<ProductInfo> list = service.findproduct();
		return list;
	}
}
