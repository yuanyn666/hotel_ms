package com.entity;

//权限表[Right]
public class RightCode {
	private int rightCodeId;
	private int rightParentCode;
	private String ringhtType;
	private String rightUrl;
	private String rightTip;
	private String ringhtText;

	private Users users;
	private MyRoleRightCode myRoleRightCode;
	private MyRole myRole;



	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public MyRoleRightCode getMyRoleRightCode() {
		return myRoleRightCode;
	}

	public void setMyRoleRightCode(MyRoleRightCode myRoleRightCode) {
		this.myRoleRightCode = myRoleRightCode;
	}

	public MyRole getMyRole() {
		return myRole;
	}

	public void setMyRole(MyRole myRole) {
		this.myRole = myRole;
	}

	public int getRightCodeId() {
		return rightCodeId;
	}

	public void setRightCodeId(int rightCodeId) {
		this.rightCodeId = rightCodeId;
	}

	public int getRightParentCode() {
		return rightParentCode;
	}

	public void setRightParentCode(int rightParentCode) {
		this.rightParentCode = rightParentCode;
	}

	public String getRinghtType() {
		return ringhtType;
	}

	public void setRinghtType(String ringhtType) {
		this.ringhtType = ringhtType;
	}

	public String getRightUrl() {
		return rightUrl;
	}

	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}

	public String getRightTip() {
		return rightTip;
	}

	public void setRightTip(String rightTip) {
		this.rightTip = rightTip;
	}

	public String getRinghtText() {
		return ringhtText;
	}

	public void setRinghtText(String ringhtText) {
		this.ringhtText = ringhtText;
	}

	public RightCode(int rightCodeId, int rightParentCode, String ringhtType,
					 String rightUrl, String rightTip, String ringhtText) {
		super();
		this.rightCodeId = rightCodeId;
		this.rightParentCode = rightParentCode;
		this.ringhtType = ringhtType;
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
		this.ringhtText = ringhtText;
	}



	public RightCode(String rightUrl, String rightTip, String ringhtText) {
		super();
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
		this.ringhtText = ringhtText;
	}

	public RightCode(int rightCodeId, String rightUrl, String rightTip,
					 String ringhtText, Users users, MyRoleRightCode myRoleRightCode,
					 MyRole myRole) {
		super();
		this.rightCodeId = rightCodeId;
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
		this.ringhtText = ringhtText;
		this.users = users;
		this.myRoleRightCode = myRoleRightCode;
		this.myRole = myRole;
	}

	public RightCode(int rightCodeId, String rightUrl, String rightTip,
					 String ringhtText) {
		super();
		this.rightCodeId = rightCodeId;
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
		this.ringhtText = ringhtText;
	}

	public RightCode() {
		super();
	}

	@Override
	public String toString() {
		return "RightCode [rightCodeId=" + rightCodeId + ", rightParentCode="
				+ rightParentCode + ", rightTip=" + rightTip + ", rightUrl="
				+ rightUrl + ", ringhtText=" + ringhtText + ", ringhtType="
				+ ringhtType + "]";
	}

}
