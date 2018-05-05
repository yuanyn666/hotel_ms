package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.RightCode;
import com.service.MyRoleColdService;

@Controller
public class MyRoleCodeController {

	@Resource
	private MyRoleColdService myRoleColdService;
	
	
	@RequestMapping("mainShow1")
	@ResponseBody
	public List<RightCode> findRightCode1(@RequestParam("usersRoleId")int usersRoleId,
			@RequestParam("userid")int userid){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("usersRoleId",usersRoleId);
		map.put("userid",userid);
		List<RightCode> lrc=myRoleColdService.findMyRole1(map);
		return lrc;
	}
	
	
}
