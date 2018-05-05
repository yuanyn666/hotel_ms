package com.entity;

//角色权限的连接表
public class MyRoleRightCode {
	private int roleId;
	private int rightCodeId;

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getRightCodeId() {
		return rightCodeId;
	}

	public void setRightCodeId(int rightCodeId) {
		this.rightCodeId = rightCodeId;
	}

	public MyRoleRightCode(int roleId, int rightCodeId) {
		super();
		this.roleId = roleId;
		this.rightCodeId = rightCodeId;
	}

	public MyRoleRightCode() {
		super();
	}

	@Override
	public String toString() {
		return "MyRoleRightCode [rightCodeId=" + rightCodeId + ", roleId="
				+ roleId + "]";
	}

}
