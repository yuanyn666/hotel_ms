package com.entity;

public class JiaoJie {
	private String jiaoid;
	private int userId;
	private String names;
	private String beizhu;
	private String jtime;
	private String biaoshi;
	private String xiuname;
	private String xiutime;
	
	public JiaoJie(String jiaoid, String xiuname, String xiutime) {
		super();
		this.jiaoid = jiaoid;
		this.xiuname = xiuname;
		this.xiutime = xiutime;
	}
	public JiaoJie(String jiaoid, int userId, String names, String beizhu,
			String jtime, String biaoshi, String xiuname, String xiutime) {
		super();
		this.jiaoid = jiaoid;
		this.userId = userId;
		this.names = names;
		this.beizhu = beizhu;
		this.jtime = jtime;
		this.biaoshi = biaoshi;
		this.xiuname = xiuname;
		this.xiutime = xiutime;
	}
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public String getJiaoid() {
		return jiaoid;
	}
	public void setJiaoid(String jiaoid) {
		this.jiaoid = jiaoid;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getJtime() {
		return jtime;
	}
	public void setJtime(String jtime) {
		this.jtime = jtime;
	}
	public String getBiaoshi() {
		return biaoshi;
	}
	public void setBiaoshi(String biaoshi) {
		this.biaoshi = biaoshi;
	}
	public String getXiuname() {
		return xiuname;
	}
	public void setXiuname(String xiuname) {
		this.xiuname = xiuname;
	}
	public String getXiutime() {
		return xiutime;
	}
	public void setXiutime(String xiutime) {
		this.xiutime = xiutime;
	}
	public JiaoJie(String jiaoid, int userId, String beizhu, String jtime,
			String biaoshi, String xiuname, String xiutime) {
		super();
		this.jiaoid = jiaoid;
		this.userId = userId;
		this.beizhu = beizhu;
		this.jtime = jtime;
		this.biaoshi = biaoshi;
		this.xiuname = xiuname;
		this.xiutime = xiutime;
	}
	public JiaoJie() {
		super();
	}
	
}
