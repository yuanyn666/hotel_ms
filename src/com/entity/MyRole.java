package com.entity;

//角色(管理员。。。)
public class MyRole {
	private int roleId;
	private String roleName;
	private String roleDesc;
	private String roleFlag;

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public String getRoleFlag() {
		return roleFlag;
	}

	public void setRoleFlag(String roleFlag) {
		this.roleFlag = roleFlag;
	}

	public MyRole(int roleId, String roleName, String roleDesc, String roleFlag) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.roleFlag = roleFlag;
	}

	public MyRole() {
		super();
	}

	@Override
	public String toString() {
		return "MyRole [roleDesc=" + roleDesc + ", roleFlag=" + roleFlag
				+ ", roleId=" + roleId + ", roleName=" + roleName + "]";
	}

}
