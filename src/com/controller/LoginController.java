package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Users;
import com.service.LoginCheckService;

@Controller
public class LoginController {
	// 根据名称自动注入
	@Resource
	private LoginCheckService loginCheckService;

	public LoginCheckService getLoginCheckService() {
		return loginCheckService;
	}

	public void setLoginCheckService(LoginCheckService loginCheckService) {
		this.loginCheckService = loginCheckService;
	}



	@RequestMapping("/login")
	@ResponseBody
	public String userLogin(HttpServletRequest request,@RequestParam("names") String names,
							@RequestParam("pwd") String pwd) {
		String str=null;
		Users users = loginCheckService.loginCheck(new Users(names, pwd));
		if(users!=null){
			request.getSession().setAttribute("myNames", names);
			request.getSession().setAttribute("myPwd", pwd);
			request.getSession().setAttribute("myUsers", users);
			str="true";
		}else{
			str="false";
		}
		return str;
	}

	//仓库操作人验证登录
	@RequestMapping("CheckKuCun")
	@ResponseBody
	public int loginCheckKuCun(@RequestParam("names") String names,
							   @RequestParam("userPwd") String userPwd){
		int str=0;
		Users user1=loginCheckService.loginCheckKuCun(new Users(names, userPwd));
		if(user1!=null){
			str=user1.getUserId();
		}else{
			str=-1;
		}
		return str;
	}
	@RequestMapping("zhuXiao")
	@ResponseBody
	public String s(HttpServletRequest request){
		HttpSession session=request.getSession();
		//使用session失效
		session.invalidate();
		String vs="true";
		return vs;
	}



}
