package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.CustomerType;
import com.entity.LiveInfo;
import com.entity.RoomInfo;
import com.entity.RoomType;
import com.entity.SuperCustomer;
import com.service.LiveInfoService;
import com.service.RoomInfoStartTypeService;
import com.service.SuperCustomerService;

@Controller
public class RoomISTController {
	@Resource
	private RoomInfoStartTypeService roomInfoStartTypeService;
	public RoomInfoStartTypeService getRoomInfoStartTypeService() {
		return roomInfoStartTypeService;
	}
	public void setRoomInfoStartTypeService(
			RoomInfoStartTypeService roomInfoStartTypeService) {
		this.roomInfoStartTypeService = roomInfoStartTypeService;
	}

	@Autowired
	private SuperCustomerService scs;

	public SuperCustomerService getScs() {
		return scs;
	}
	public void setScs(SuperCustomerService scs) {
		this.scs = scs;
	}

	//霍闪闪注入
	@Resource
	private LiveInfoService liveService;

	public LiveInfoService getLiveService(){
		return liveService;
	}
	public void setLiveService(LiveInfoService liveService) {
		this.liveService = liveService;
	}

	// 查询客房信息
	@RequestMapping("/showRoomIST")
	public String showRoomIST(Model m) {
		List<RoomInfo> info = roomInfoStartTypeService.findAllRoomIST();
		int num = roomInfoStartTypeService.findByStartidS();
		int num1 = roomInfoStartTypeService.findByStartid1S();
		int num2 = roomInfoStartTypeService.findByStartid2S();
		int num3 = roomInfoStartTypeService.findByStartid3S();
		int num4 = roomInfoStartTypeService.findByStartid4S();
		int num5 = roomInfoStartTypeService.findByStartid5S();
		m.addAttribute("num", num);
		m.addAttribute("num1", num1);
		m.addAttribute("num2", num2);
		m.addAttribute("num3", num3);
		m.addAttribute("num4", num4);
		m.addAttribute("num5", num5);
		m.addAttribute("info", info);
		//获取入住信息
		List<LiveInfo> liveinfo=roomInfoStartTypeService.findLiveInfoAllS();
		//在入住人数
		int le=liveinfo.size();
		m.addAttribute("lel", le);
		m.addAttribute("liveinfo", liveinfo);
		//获取空房间信息
		List<RoomInfo> room=liveService.selectRrr();
		m.addAttribute("room",room);
		//获取客户类型
		List<CustomerType> custo=liveService.select();
		m.addAttribute("custo", custo);
		//获取入住单号
		SimpleDateFormat df2=new SimpleDateFormat("yyyyMMddHHmmss");
		String df="RZ"+df2.format(new Date());
		m.addAttribute("df",df);
		//获取会员信息
		//查看会员
		List<SuperCustomer> slist=scs.findAllSuper();
		m.addAttribute("slist", slist);
		//获取房间类别和房间价格
		List<RoomType> listRoomType=liveService.selectS();
		m.addAttribute("listRoomType", listRoomType);
		return "main1";
	}


	//根据房间状态 查找显示 房间
	@RequestMapping("/mmm")
	@ResponseBody// 转换成json对象
	public List<RoomInfo> showTTY(@RequestParam("roomStateid")int roomStateid) {

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("roomStateid",roomStateid);
		List<RoomInfo> info3=roomInfoStartTypeService.findAllRoomInfoS(map);
		return info3;
	}

}
