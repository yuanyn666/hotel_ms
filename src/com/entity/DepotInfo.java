package com.entity;

//仓库(各大仓库)信息表
public class DepotInfo {
	private String depotId;
	private String depotName;
	private int depotNum;

	public String getDepotId() {
		return depotId;
	}

	public void setDepotId(String depotId) {
		this.depotId = depotId;
	}

	public String getDepotName() {
		return depotName;
	}

	public void setDepotName(String depotName) {
		this.depotName = depotName;
	}

	public int getDepotNum() {
		return depotNum;
	}

	public void setDepotNum(int depotNum) {
		this.depotNum = depotNum;
	}

	public DepotInfo(String depotId, String depotName, int depotNum) {
		super();
		this.depotId = depotId;
		this.depotName = depotName;
		this.depotNum = depotNum;
	}

	public DepotInfo() {
		super();
	}

	@Override
	public String toString() {
		return "DepotInfo [depotId=" + depotId + ", depotName=" + depotName
				+ ", depotNum=" + depotNum + "]";
	}

}
