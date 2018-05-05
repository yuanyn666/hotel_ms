package com.controller;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Checkout;
import com.entity.DepotProduct;
import com.entity.JiaoJie;
import com.entity.LiveInfo;
import com.entity.ReturnProduct;
import com.entity.ReturnProductDetail;
import com.entity.Spend;
import com.entity.SpendInfo;
import com.service.ProductSalService;

@Controller
public class ProductSalController {//商品的销售 客人消费  高辉
	@Resource
	private ProductSalService service;

	public ProductSalService getService() {
		return service;
	}
	public void setService(ProductSalService service) {
		this.service = service;
	}
	@RequestMapping("/SelectProduct")
	@ResponseBody//转换json对象注解
	public String SelectProduct(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws JsonGenerationException, JsonMappingException, IOException{
		//ObjectMapper om=new ObjectMapper();//转换json对象
		Map<String,Object> map=new HashMap<String,Object>();
		String q=request.getParameter("q");
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		map.put("q",q);
		List<DepotProduct> list=service.SelectProduct(map);
		int total=service.totalComm3(map);//查询总条数
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/Selectt")//先创建消费的单号
	public String Selectt(Model model,@RequestParam("liveId")String liveId,HttpServletRequest req){
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddHHmmss");
		String Spend="Spend"+df.format(new Date());
		model.addAttribute("Spned",Spend);
		//先假想一个消费房间(入住单号)当点击消费的时候把消费账单存入session
		//String aa="RZ25170502501";//取出session
		req.getSession().setAttribute("liveId", liveId);
		String name=null;//保存消费人姓名
		List<LiveInfo>list=service.SelectLiveInfo(liveId);
		for (LiveInfo liveInfo : list) {
			name=liveInfo.getCustomerName();
		}

		model.addAttribute("name",name);
		model.addAttribute("liveid",liveId);
		return "AddProductSal";
	}
	@RequestMapping("/InsertSpend")//录入消费总表
	public String InsertSpend(Model model,HttpServletRequest request){
		String Spnedid=request.getParameter("Spnedid");//单号
		String liveid=request.getParameter("liveid");//房间号
		String mark=request.getParameter("mark");//备注
		int userId=Integer.parseInt(request.getParameter("userId"));//操作人
		String [] productId=request.getParameterValues("productId");//获取所有商品的id
		String [] zj=request.getParameterValues("zj");
		String [] outDepotPrice=request.getParameterValues("outDepotPrice");
		int a=service.zonr(Spnedid, liveid, mark, userId, productId, zj, outDepotPrice);
		//System.out.println(a);
		return "SerchProductSal";
	}
	@RequestMapping("/SerchProductSalInfo")//查看细的消费
	@ResponseBody
	public List<SpendInfo> SerchProductSalInfo(HttpServletRequest request){
		//ObjectMapper om=new ObjectMapper();//转换json对象
		String spendId=request.getParameter("spendId");
		List<SpendInfo> list=service.SerchProductSalInfo(spendId);
		return list;
	}
	@RequestMapping("/SerchProductSalByChar")
	@ResponseBody//所有的消费记录
	public String SerchProductSalByChar(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		String spendId=request.getParameter("spendId");
		String liveId=request.getParameter("liveId");
		String spendName=request.getParameter("spendName");
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
		map.put("spendId", spendId);
		map.put("liveId", liveId);
		map.put("spendName", spendName);
		map.put("begin", begin);
		map.put("end", end);
		int total=service.totalComm(map);//查询总条数
		List<Spend> list=service.SerchProductSalByChar(map);
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/SerchProductSalById")
	@ResponseBody//查看某一个房间的消费记录
	public List<Spend> SerchProductSalById(HttpServletRequest request){
		String aa=(String)request.getSession().getAttribute("liveId");
		List<Spend> list=service.SerchProductSalById(aa);
		return list;
	}
	@RequestMapping("/SerchProductSaHis")
	@ResponseBody//查看某一个房间的消费记录
	public List<Spend> SerchProductSaHis(HttpServletRequest request){
		String aa=(String)request.getSession().getAttribute("mm");
		List<Spend> list=service.SerchProductSalById(aa);
		return list;
	}
	@RequestMapping("/insertjioajie")
	public void insertjioajie(HttpServletRequest request)throws JsonGenerationException, JsonMappingException, IOException{
		int userId=Integer.parseInt(request.getParameter("userId"));
		String mark=request.getParameter("mark");
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date());
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String jioajieid="jj"+df2.format(new Date());//生交接好
		String biaoshi=null;
		String xiuname=null;
		String xiutime=null;
		if(mark==""){
			mark="无";
			biaoshi="无";
			xiuname="无";
			xiutime="无";
		}else{
			biaoshi="有";
			xiuname="无";
			xiutime="无";
		}
		JiaoJie jiaojie=new JiaoJie(jioajieid,userId,mark,time,biaoshi,xiuname,xiutime);
		service.insertjiaojie(jiaojie);
	}

	@RequestMapping("/Serchjiaojie")
	@ResponseBody//所有的交接记录查询
	public String SerchBreak(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		String spendName=request.getParameter("spendName");
		String begin=request.getParameter("begin");
		String end=request.getParameter("end");
		String pan=request.getParameter("pan");
		if(begin==""&&end!=""){
			begin="2016-01-01";
		}
		if(begin!=""&&end==""){
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=df.format(new Date());
			end=time;
		}
		map.put("spendName", spendName);
		map.put("pan", pan);
		map.put("begin", begin);
		map.put("end", end);
		int total=service.totalComm5(map);//查询总条数
		List<JiaoJie> list=service.Serchjiaojie(map);
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();//json
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/SerchjiaojieInfo")//查看细交接
	@ResponseBody
	public List<JiaoJie> SerchjiaojieInfo(HttpServletRequest request){
		//ObjectMapper om=new ObjectMapper();//转换json对象
		String spendId=request.getParameter("spendId");
		List<JiaoJie> list=service.Serchjiaojiexi(spendId);
		return list;
	}
	@RequestMapping("/SerchjiaojieInfo2")//查看细交接
	public void SerchjiaojieInfo2(HttpServletRequest request,Model model){
		//ObjectMapper om=new ObjectMapper();//转换json对象
		String spendId=request.getParameter("spendId");
		List<JiaoJie> list=service.Serchjiaojiexi(spendId);
		request.getSession().setAttribute("hj", spendId);
		for (JiaoJie jiaoJie : list) {
			request.getSession().setAttribute("op", jiaoJie.getNames());
			request.getSession().setAttribute("kl", jiaoJie.getBeizhu());
		}
		model.addAttribute("list",list);
	}
	@RequestMapping("/updatejiaojie")//修改交接
	public void updatejiaojie(HttpServletRequest request,Model model){
		String xiuname=request.getParameter("userId");
		String userId=request.getParameter("id");
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String  xiutime=df.format(new Date());
		JiaoJie jiaojie=new JiaoJie(userId,xiuname, xiutime);
		service.updatejiaojiexi(jiaojie);
	}
	@RequestMapping("/soutime")//接收时间
	public void soutime(HttpServletRequest request){
		String time=request.getParameter("time");
		request.getSession().setAttribute("timeaa", time);//在页面上接收时间，然后
	}
	@RequestMapping("/SerchProductying")//接收时间
	@ResponseBody
	public String SerchProductying(HttpServletRequest request,@RequestParam int page,@RequestParam int rows) throws ParseException,JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		String begin=(String)request.getSession().getAttribute("timeaa");//获取点击存的session
		String time2=(String)request.getSession().getAttribute("timeaa");//获取点击存的session
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date2 = df.parse(time2);
		date2.setDate(date2.getDate()+1);//下一天
		String end=df.format(date2);
		map.put("begin", begin);
		map.put("end", end);
		List<Spend> list=service.SerchProductying(map);
		int total=service.totalComm7(map);//查询总条数
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();//json
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/selectjie")
	@ResponseBody
	public String selectjie(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws ParseException,JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		String begin=(String)request.getSession().getAttribute("timeaa");//获取点击存的session
		String time2=(String)request.getSession().getAttribute("timeaa");//
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");//格式话日期
		Date date2 = df.parse(time2);
		date2.setDate(date2.getDate()+1);//下一天
		String end=df.format(date2);
		map.put("begin", begin);
		map.put("end", end);
		List<Checkout> list=service.selectjie(map);
		int total=service.totalComm8(map);//
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();//json
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/selectjieinfo")
	@ResponseBody
	public List<LiveInfo> selectjieinfo (HttpServletRequest request){
		String liveId=request.getParameter("liveId");
		List<LiveInfo>list=service.SelectLiveInfo(liveId);
		return list;
	}


	@RequestMapping("/selecttui")
	@ResponseBody
	public String selecttui(HttpServletRequest request,@RequestParam int page,@RequestParam int rows)throws ParseException,JsonGenerationException, JsonMappingException, IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		int pageNumber=page==0?1:page;
		int pageSize=rows;
		int a=(pageNumber-1)*pageSize;
		int b=pageSize*pageNumber;
		map.put("a",a);
		map.put("b",b);
		String begin=(String)request.getSession().getAttribute("timeaa");//获取点击存的session
		String time2=(String)request.getSession().getAttribute("timeaa");//
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");//格式话日期
		Date date2 = df.parse(time2);
		date2.setDate(date2.getDate()+1);//下一天
		String end=df.format(date2);
		map.put("begin", begin);
		map.put("end", end);
		List<ReturnProduct> list=service.selecttui(map);
		int total=service.totalComm9(map);//
		Map<String,Object> json=new HashMap<String, Object>();
		json.put("total",total);
		json.put("rows",list);
		String str="";
		ObjectMapper om=new ObjectMapper();//json
		str=om.writeValueAsString(json);
		return str;
	}
	@RequestMapping("/selecttuiming")
	@ResponseBody
	public List<ReturnProductDetail> selecttuiming (HttpServletRequest request){
		String returnId=request.getParameter("returnId");
		List<ReturnProductDetail>list=service.selecttuiming(returnId);
		return list;
	}
}
