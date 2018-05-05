package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.SuperCustomer;
import com.service.SuperCustomerService;

@Controller
public class SuperCustomerController {
	@Autowired
	private SuperCustomerService scs;
	//自动生成会员卡号
	@RequestMapping("/getSpId")
	public String getSpId(Model model){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String spId="S"+sdf.format(new Date());
		model.addAttribute("spId", spId);
		return "insertSuperCustomer";
	}
	//增加会员
	@RequestMapping("/insertSuper")
	public String insertSuper(SuperCustomer superCus){
		scs.insertSuper(superCus);
		return "redirect:showSuper";
	}
	//删除会员
	@RequestMapping("/deleteSuper")
	public String deleteSuper(Model model, String spId){
		scs.deleteSuper(spId);
		return "redirect:showSuper";
	}
	//修改会员
	@RequestMapping("/updateSuper")
	public String updateSuper(SuperCustomer superCus){
		scs.updateSuper(superCus);
		return "redirect:showSuper";
	}
	//查找所有会员
	@RequestMapping("/showSuper")
	public String findAllSuper(Model model){
		List<SuperCustomer> slist=scs.findAllSuper();
		model.addAttribute("slist", slist);
		return "showSuperCustomer";
	}
	//根据会员卡号模糊查找
	@RequestMapping("/findBySpId")
	public String findBySpId(Model model, String spId){
		List<SuperCustomer> sp=scs.findBySpId(spId);
		model.addAttribute("sp", sp);
		return "showSuperCustomer";
	}
	//根据会员号查找会员传到修改页面
	@RequestMapping("/findBySuperId")
	public String findBySuperId(Model model, String spId){
		SuperCustomer superCus=scs.findBySuperId(spId);
		model.addAttribute("superCus", superCus);
		return "updateSuperCustomer";
	}
	//根据会员号查找会员传到充值页面
	@RequestMapping("/findForInsert")
	public String findName(Model model, String spId){
		SuperCustomer sp=scs.findBySuperId(spId);
		model.addAttribute("sp", sp);
		return "insertMoney";
	}

	//会员充值
	@RequestMapping("insertMoney")
	public String insertMoney(SuperCustomer sp){
		scs.insertMoney(sp);
		return "redirect:showSuper";
	}
}
