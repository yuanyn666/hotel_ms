package com.dao;

import com.entity.Users;

public interface LoginCheck {
	//登录
	public Users loginCheck(Users users);
	//操作人验证登录loginCheckKuCun
	public Users loginCheckKuCun(Users users);

}
