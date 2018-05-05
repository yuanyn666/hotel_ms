package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserMyRoleDao;
import com.entity.RightCode;
@Service
public class MyRoleColdService {

	@Autowired
	private UserMyRoleDao userMyRoleDao;

	public UserMyRoleDao getUserMyRoleDao() {
		return userMyRoleDao;
	}
		
public List<RightCode> findMyRole1(Map<String, Object> map){
		
		return userMyRoleDao.findMyRole1(map);
	}
}
