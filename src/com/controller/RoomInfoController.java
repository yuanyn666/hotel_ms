package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.RoomInfo;
import com.entity.RoomState;
import com.entity.RoomType;
import com.service.RoomInfoService;

@Controller
public class RoomInfoController {
	@Resource
	private RoomInfoService rs;
	//查询房间信息（基础资料）
	@RequestMapping("/showRoomInfo")
	public String showRoomInfo(Model model){
		List<RoomInfo> list=rs.findAllRoom();
		List<RoomType> rtlist=rs.findAllRT();
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("list", list);
		return "showRoom";
	}
	//查找房态和房类传到添加房间页面
	@RequestMapping("/findforInsert")
	public String findforInsert(Model model){
		List<RoomType> rtlist=rs.findAllRT();
		model.addAttribute("rtlist", rtlist);
		return "insertRoom";
	}
	//查看房类
	@RequestMapping("/showRoomType")
	public String showRoomType(Model model){
		List<RoomType> rtlist=rs.findAllRT();
		model.addAttribute("rtlist", rtlist);
		return "showRoomType";
	}
	//根据id查询一条房间信息到修改页面
	@RequestMapping("/findRoomById")
	public String findRoomById(Model model, int roomId){
		RoomInfo room=rs.findRoomById(roomId);
		List<RoomState> rslist=rs.findAllRS();
		List<RoomType> rtlist=rs.findAllRT();
		model.addAttribute("room", room);
		model.addAttribute("rslist", rslist);
		model.addAttribute("rtlist", rtlist);
		return "updateRoom";
	}
	//修改房间信息
	@RequestMapping("/updateRoom")
	public String updateRoom(RoomInfo room){
		rs.updateRoom(room);
		return "redirect:showRoomInfo";
	}
	//删除房间信息
	@RequestMapping("/deleteRoom")
	public String deleteRoom( int roomId){
		rs.deleteRoom(roomId);
		return "redirect:showRoomInfo";
	}
	//增加房间信息
	@RequestMapping("/insertRoom")
	public String insertRoom(RoomInfo room){
		rs.insertRoom(room);
		return "redirect:showRoomInfo";
	}
	//增加房间类型
	@RequestMapping("/insertRT")
	public String insertRT(RoomType rt){
		rs.insertRT(rt);
		return "redirect:showRoomType";
	}
	//根据编号查找房间类型传到修改页面
	@RequestMapping("/findRTById")
	public String findRTById(Model model, int roomTypeId){
		RoomType rt=rs.findRTById(roomTypeId);
		model.addAttribute("rt", rt);
		return "updateRoomType";
	}
	//修改房间类型
	@RequestMapping("/updateRT")
	public String updateRT(RoomType rt){
		rs.updateRT(rt);
		return "redirect:showRoomType";
	}
	//删除房间类型
	@RequestMapping("/deleteRT")
	public String deleteRT( int roomTypeId){
		rs.deleteRT(roomTypeId);
		return "redirect:showRoomType";
	}
	//查询房间信息（主页面）
	@RequestMapping("/showRoom")
	public String showRoom(Model model){
		List<RoomInfo> list=rs.findAllRoom();
		List<RoomType> rtlist=rs.findAllRT();
		List<RoomState> rslist=rs.findAllRS();
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("rslist", rslist);
		model.addAttribute("list", list);
		return "showRoomTry";
	}
	//按楼栋查询房间信息
	@RequestMapping("/findByBuild")
	public String findByBuild(Model model, int Build){
		List<RoomInfo> roomB=rs.findByBuild(Build);
		model.addAttribute("roomB", roomB);
		return "showRoomTry";
	}
	//按楼栋和楼层查询房间信息
	@RequestMapping("/findByBF")
	public String findByBF(Model model, int Build, int floor){
		List<RoomInfo> roomBF=rs.findbyBF(Build, floor);
		List<RoomInfo> roomB=rs.findByBuild(Build);
		model.addAttribute("roomB", roomB);
		model.addAttribute("roomBF", roomBF);
		return "showRoomTry";
	}
	//按房间类型查询房间信息
	@RequestMapping("/findByRoomType")
	public String findByRoomType(Model model,@RequestParam("roomTypeId") int roomTypeId){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("roomTypeId", roomTypeId);
		List<RoomInfo> roomRT=rs.findbyType(map);
		List<RoomType> rtlist=rs.findAllRT();
		model.addAttribute("rtlist", rtlist);
		model.addAttribute("roomRT", roomRT);
		return "showRoom";
	}
	//按房间状态查询房间信息
	@RequestMapping("/findByRoomState")
	public String findByRSId(Model model, int roomStateId){
		List<RoomInfo> roomS=rs.findbyRoomState(roomStateId);
		model.addAttribute("roomS", roomS);
		return "showRoomTry";
	}
	//查看在住账单
	@RequestMapping("/findLiveBill")
	public String findLiveBill(Model model, int roomId){
		List<RoomInfo> liveRoom=rs.findLiveBill(roomId);
		model.addAttribute("liveRoom", liveRoom);
		return "main1";
	}

	//查询某楼栋和某楼层所在的最大房间号
	@RequestMapping("/findMaxRoomId")
	@ResponseBody
	public int findRoomId(@RequestParam("roomBuild") int build,@RequestParam("floor") int floor){
		int a=0;
		String roomId=rs.findRoomId(build, floor);
		if(roomId!=null){
			a=Integer.parseInt(roomId)+1;
		}else {
			a=build*1000+floor*100+1;
		}
		return a;
	}
}
