package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.RightCode;

public interface UserMyRoleDao {
 
	
	public List<RightCode> findMyRole1(Map<String, Object> map);
	
}
