package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.lf5.viewer.configure.MRUFileManager;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.MyRole;
import com.entity.Users;
import com.service.UsersService;

@Controller
public class UsersController {

	//
	@Resource
	private UsersService usersService;

	@RequestMapping("/UsersAll1")
	@ResponseBody
	public List<Users> findUsers(){
		List<Users> listUsers = usersService.findAllUsersS();
		return listUsers;
	}

	//查询所有用户
	@RequestMapping("/UsersAll")
	public String findUsers(Model m) {
		List<Users> listUsers = usersService.findAllUsersS();
		m.addAttribute("listUsers", listUsers);
		List<MyRole> myrole=usersService.findAllMyRoleS();
		m.addAttribute("myrole", myrole);
		return "UsersInfo";
	}
	//按条件查询所有用户
	@RequestMapping("/UsersAllBy")
	public String findUsers1(Model m,@RequestParam("names")String names,@RequestParam("usersRoleId")int usersRoleId) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("names", names);
		map.put("usersRoleId", usersRoleId);
		List<Users> listUsers = usersService.findAllByUsersS(map);
		m.addAttribute("listUsers", listUsers);
		List<MyRole> myrole=usersService.findAllMyRoleS();
		m.addAttribute("myrole", myrole);
		return "UsersInfo";
	}
	//添加用户
	@RequestMapping("/addUsersC")
	public String addUsersC(Users u){
		usersService.addUsersS(u);
		return "redirect:UsersAll";
	}

	//根据ID查找用户信息
	@RequestMapping("/findUserByidC")
	public String findUserByidC(Model m,@RequestParam("userId") int userId){
		//System.out.println(userId);
		Users u=usersService.findUserByIdS(userId);
		m.addAttribute("user", u);
		return "UserUpdate";
	}


	//获取修改结果，执行修改
	@RequestMapping("/updateUsersC")
	public String updateUsersC(Users u){
		//System.out.println(u);
		int n=usersService.updateUsersS(u);
		return "redirect:UsersAll";
	}
	//执行逻辑删除
	@RequestMapping("deleteUserByidC")
	public String updateUsersByidS(@RequestParam("userId")int userId){
		int n=usersService.updateUsersByidS(userId);
		return "redirect:UsersAll";
	}
	//查找用户角色
	@RequestMapping("/findAllMyRoleC")
	public String findAllMyRoleC(Model m){
		List<MyRole> listMyRole=usersService.findAllMyRoleS();
		m.addAttribute("listMR", listMyRole);
		return "UsersAdd";
	}
	//

	@RequestMapping("findAllMyRoleCJ")
	@ResponseBody
	public List<MyRole> findAllMyRoleCJ(){
		List<MyRole> listMyRole=usersService.findAllMyRoleS();
		return listMyRole;
	}

}
