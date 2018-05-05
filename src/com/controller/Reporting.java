package com.controller;

import java.io.IOException;
import java.security.interfaces.DSAKey;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.ProductBill;
import com.entity.SpendProdut;
import com.service.ProductSalService;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
public class Reporting {//盈利  折线图  高辉
	@Resource
	private ProductSalService service;

	public ProductSalService getService() {
		return service;
	}
	public void setService(ProductSalService service) {
		this.service = service;
	}
	@RequestMapping("/ProductReporting")//返回商品的消费总结
	@ResponseBody
	public List<SpendProdut> ProductReporting(HttpServletRequest request){
		Map<String, String> map=new HashMap<String, String>();
		String begin=request.getParameter("begin");
		String end=request.getParameter("end");
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
		List<SpendProdut> list=service.SerchSpendProdut(map);
		return list;
	}
	@RequestMapping("/SelectProductBill2")//查看盈利
	@ResponseBody
	public List<ProductBill> SelectProductBill2(HttpServletRequest request){
		Map<String, String> map=new HashMap<String, String>();
		Date dd=new Date();
		dd.setMonth(dd.getMonth()+1);//设置格式化时间为下一个月
		Date ff=new Date();
		ff.setMonth(dd.getMonth()-1);//设置格式化时间为上一个月
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");

		String begin=request.getParameter("begin");
		String end=request.getParameter("end");
		if(begin==""&&end==""){
			begin=df.format(new Date());
			end=df.format(dd);//默认为当月时间
		}
		if(begin!=""&&end==""){
			end=df.format(dd);//默认为当月时间
		}
		if(begin==""&&end!=""){
			begin=df.format(ff);//默认为当月时间
		}
		map.put("begin", begin);
		map.put("end", end);
		List<ProductBill> list=service.SelectProductBill2(map);
		return list;
	}

	@RequestMapping("/SelectProductBill3")//表格细化盈利
	@ResponseBody
	public String SelectProductBill3(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		Date dd=new Date();
		dd.setMonth(dd.getMonth()+1);//设置格式化时间为下一个月
		Date ff=new Date();
		ff.setMonth(dd.getMonth()-1);//设置格式化时间为上一个月
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");

		String begin=request.getParameter("begin2");
		String end=request.getParameter("end2");
		if(begin==null||begin==""&&end==null||end==""){
			begin=df.format(new Date());
			end=df.format(dd);//默认为当月时间
		}
		if(begin!=null||begin!=""&&end==null||end==""){
			end=df.format(dd);//默认为当月时间
		}
		if(begin==null||begin==""&&end!=null||end!=""){
			begin=df.format(ff);//默认为当月时间
		}
		map.put("begin", begin);
		map.put("end", end);
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		List<ProductBill> list=service.SelectProductBill3(map);
		int total=service.totalComm6(map);//查询总条数
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();
		str=om.writeValueAsString(json);
		return str;
	}

}

