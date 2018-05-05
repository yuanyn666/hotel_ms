package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LoginCheck;
import com.dao.RoomInfoStartType;
import com.entity.RoomInfo;
import com.entity.Users;

//service注解
@Service
public class LoginCheckService {
	@Autowired
	private LoginCheck loginCheck;

	public LoginCheck getLoginCheck() {
		return loginCheck;
	}

	public void setLoginCheck(LoginCheck loginCheck) {
		this.loginCheck = loginCheck;
	}

	// 验证登录
	public Users loginCheck(Users users) {
		return loginCheck.loginCheck(users);

	};
	//仓库操作人验证登录loginCheckKuCun
	public Users loginCheckKuCun(Users users){

		return loginCheck.loginCheckKuCun(users);


	}


	@Autowired
	private RoomInfoStartType roomInfoStartType;

	public RoomInfoStartType getRoomInfoStartType() {
		return roomInfoStartType;
	}

	public void setRoomInfoStartType(RoomInfoStartType roomInfoStartType) {
		this.roomInfoStartType = roomInfoStartType;
	}

	// 查询遍历显示客房
	public List<RoomInfo> findAllRoomIST() {
		return roomInfoStartType.findAllRoomInfoAll();

	}

}
