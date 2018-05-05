package com.entity;
//客人消费明细表
public class SpendInfo {
	private String spendInfoId;
	private String spendId;
	private String GcodeId;
	private String productname;
	private int Gcodnum;
	private int spendMoney;
	private String spendTime;

	public SpendInfo(String productname, int gcodnum, int spendMoney,
					 String spendTime) {
		super();
		this.productname = productname;
		Gcodnum = gcodnum;
		this.spendMoney = spendMoney;
		this.spendTime = spendTime;
	}

	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public SpendInfo(String gcodeId, int gcodnum) {
		super();
		GcodeId = gcodeId;
		Gcodnum = gcodnum;
	}
	public String getSpendInfoId() {
		return spendInfoId;
	}
	public void setSpendInfoId(String spendInfoId) {
		this.spendInfoId = spendInfoId;
	}
	public String getSpendId() {
		return spendId;
	}
	public void setSpendId(String spendId) {
		this.spendId = spendId;
	}
	public String getGcodeId() {
		return GcodeId;
	}
	public void setGcodeId(String gcodeId) {
		GcodeId = gcodeId;
	}
	public int getGcodnum() {
		return Gcodnum;
	}
	public void setGcodnum(int gcodnum) {
		Gcodnum = gcodnum;
	}
	public int getSpendMoney() {
		return spendMoney;
	}
	public void setSpendMoney(int spendMoney) {
		this.spendMoney = spendMoney;
	}
	public String getSpendTime() {
		return spendTime;
	}
	public void setSpendTime(String spendTime) {
		this.spendTime = spendTime;
	}
	public SpendInfo(String spendInfoId, String spendId, String gcodeId,
					 int gcodnum, int spendMoney, String spendTime) {
		super();
		this.spendInfoId = spendInfoId;
		this.spendId = spendId;
		GcodeId = gcodeId;
		Gcodnum = gcodnum;
		this.spendMoney = spendMoney;
		this.spendTime = spendTime;
	}
	public SpendInfo() {
		super();
	}
	@Override
	public String toString() {
		return "SpendInfo [GcodeId=" + GcodeId + ", Gcodnum=" + Gcodnum
				+ ", spendId=" + spendId + ", spendInfoId=" + spendInfoId
				+ ", spendMoney=" + spendMoney + ", spendTime=" + spendTime
				+ "]";
	}

}
