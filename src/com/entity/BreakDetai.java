package com.entity;
//客人损坏明细表
public class BreakDetai {
	private String detaId;
	private String breakId;
	private String breakName;
	private int fineMoney;
	public String getDetaId() {
		return detaId;
	}
	public void setDetaId(String detaId) {
		this.detaId = detaId;
	}
	public String getBreakId() {
		return breakId;
	}
	public void setBreakId(String breakId) {
		this.breakId = breakId;
	}
	public String getBreakName() {
		return breakName;
	}
	public void setBreakName(String breakName) {
		this.breakName = breakName;
	}
	public int getFineMoney() {
		return fineMoney;
	}
	public void setFineMoney(int fineMoney) {
		this.fineMoney = fineMoney;
	}
	public BreakDetai(String detaId, String breakId, String breakName,
					  int fineMoney) {
		super();
		this.detaId = detaId;
		this.breakId = breakId;
		this.breakName = breakName;
		this.fineMoney = fineMoney;
	}
	public BreakDetai() {
		super();
	}
	@Override
	public String toString() {
		return "BreakDetai [breakId=" + breakId + ", breakName=" + breakName
				+ ", detaId=" + detaId + ", fineMoney=" + fineMoney + "]";
	}

}
