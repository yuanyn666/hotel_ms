package com.entity;

//用户[Users]
public class Users {
	private int userId;
	private String userPwd;
	private String names;
	private String userFla;
	private String phone;
	private String address;
	private String userSex;
	private int usersRoleId;
	private String roleName;
	private int state;



	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getUserFla() {
		return userFla;
	}
	public void setUserFla(String userFla) {
		this.userFla = userFla;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public int getUsersRoleId() {
		return usersRoleId;
	}
	public void setUsersRoleId(int usersRoleId) {
		this.usersRoleId = usersRoleId;
	}

	public Users(int userId) {
		super();
		this.userId = userId;
	}

	public Users(int userId, String userPwd, String names,
				 String userFla, String phone, String address, String userSex,
				 int usersRoleId) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.names = names;
		this.userFla = userFla;
		this.phone = phone;
		this.address = address;
		this.userSex = userSex;
		this.usersRoleId = usersRoleId;
	}

	public Users(int userId, String userPwd, String names,
				 String userFla, String phone, String address, String userSex,
				 int usersRoleId, int state) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.names = names;
		this.userFla = userFla;
		this.phone = phone;
		this.address = address;
		this.userSex = userSex;
		this.usersRoleId = usersRoleId;
		this.state = state;
	}

	public Users(int userId, String userPwd, String names, String userFla,
				 String phone, String address, String userSex, int usersRoleId,
				 String roleName, int state) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.names = names;
		this.userFla = userFla;
		this.phone = phone;
		this.address = address;
		this.userSex = userSex;
		this.usersRoleId = usersRoleId;
		this.roleName = roleName;
		this.state = state;
	}

	public Users() {
		super();
	}



	public Users( String names,String userPwd) {
		super();
		this.names = names;
		this.userPwd = userPwd;

	}
	public Users(int userId, String names) {
		super();
		this.userId = userId;
		this.names = names;
	}
	public Users(String names, int usersRoleId) {
		super();
		this.names = names;
		this.usersRoleId = usersRoleId;
	}

	@Override
	public String toString() {
		return "Users [address=" + address + ", names=" + names + ", phone="
				+ phone + ", userFla=" + userFla + ", userId=" + userId
				+  ", userPwd=" + userPwd
				+ ", userSex=" + userSex + ", usersRoleId=" + usersRoleId + "]";
	}

}
