package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UsersInfo;
import com.entity.MyRole;
import com.entity.Users;

@Service
public class UsersService {

	@Autowired
	private UsersInfo usersInfo;
	public UsersInfo getUsersInfo() {
		return usersInfo;
	}
	public void setUsersInfo(UsersInfo usersInfo) {
		this.usersInfo = usersInfo;
	}



	public List<Users> findAllUsersS() {
		return usersInfo.findAllUsers();
	}
	public Users findUserByIdS(int userId){
		return usersInfo.findUsersById(userId);
	}
	public int addUsersS(Users u){
		return usersInfo.addUsers(u);
	}
	public int updateUsersS(Users u){
		return usersInfo.updateUsers(u);
	}
	public int updateUsersByidS(int userId){
		return usersInfo.updateUsersByid(userId);
	}
	//查找职位
	public List<MyRole> findAllMyRoleS(){
		return usersInfo.findAllMyRole();
	}
	//执行迷糊查询
	public List<Users> findAllByUsersS(Map<String,Object> map){

		return usersInfo.findAllByUsers(map);
	}

}
