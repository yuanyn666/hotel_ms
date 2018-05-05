package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.DepotInfo;
import com.entity.DepotProduct;
import com.service.DepotInfoService;

@Controller
public class DepotInfoController {
	@Resource
	public DepotInfoService service;
	//查找所有
	@RequestMapping("/findAllD")
	public String findAllD(Model model){
		List<DepotInfo>list=service.findAllD();
		model.addAttribute("list",list);
		return "showDepotInfo";
	}
	//根据id查找
	@RequestMapping("/findByIdDe")
	public String findByIdD(Model model,String depotId){
		DepotInfo d=service.findByIdDe(depotId);
		model.addAttribute("list",d);
		return "updateDepotInfo";
	}
	//修改
	@RequestMapping("/updateDepotInfo")
	public String updateDepotInfo(DepotInfo d){
		service.updateDepotInfo(d);
		return "redirect:findAllD";
	}
	//删除
/*@RequestMapping("/deleteDepotInfo")
public String deleteDepotInfo(String id){
	service.deleteDepotInfo(id);
	return "success";
}*/
//添加
	@RequestMapping("/insertDepotInfo")
	public String insertD(HttpServletRequest request){
		String depotId = request.getParameter("depotId");
		String depotName = request.getParameter("depotName");
		String depotNum = request.getParameter("depotNum");
		DepotInfo d = new DepotInfo(depotId, depotName, Integer.parseInt(depotNum));
		service.insertDepotInfo(d);
		return "redirect:findAllD";
	}
	//编号
	@RequestMapping("/insertDepotInfo1")
	public String getDate(Model model){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhMMss");
		String depotId="CK"+sdf.format(new Date());
		model.addAttribute("list",depotId);
		return "insertDepotInfo";
	}


}
