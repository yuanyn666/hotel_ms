package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.MyRole;
import com.entity.Users;

public interface UsersInfo {

	public List<Users> findAllUsers();
	public Users findUsersById(int userId);
	public int addUsers(Users u);
	public int updateUsers(Users u);
	//迷糊查询
	public List<Users> findAllByUsers(Map<String,Object> map);
	//逻辑删除
	public int updateUsersByid(int userId);
	public List<MyRole> findAllMyRole();
}
