package com.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.DepotProduct;

import com.service.DepotProductService;

@Controller
public class DepotProductController {
	@Resource
	private DepotProductService service;
	//查找所有
	@RequestMapping("/findAllDepotProduct")
	public String DepotProduct(Model model){
		List<DepotProduct>list=service.findAllDepotProduct();
		model.addAttribute("list",list);
		return "showDepotProduct";}



	//查根据名字查找
	@RequestMapping("/findProducttype")
	public String findName(Model model, @RequestParam String producttype){
		List<DepotProduct>list=service.findProducttype(producttype);
		model.addAttribute("list", list);
		return "showDepotProduct";
	}



}
