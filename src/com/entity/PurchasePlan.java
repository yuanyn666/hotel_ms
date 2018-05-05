package com.entity;
public class PurchasePlan {
	private String planId;
	private String planDate;
	private String  state;
	private int userId;
	private String mark;
	private String names;
	
	
	public String getNames() {
		return names;
	}
	public void setNames(String names) {
		this.names = names;
	}
	public PurchasePlan(String planId, String planDate, String state,
			int userId, String mark, String names) {
		super();
		this.planId = planId;
		this.planDate = planDate;
		this.state = state;
		this.userId = userId;
		this.mark = mark;
		this.names = names;
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public String getPlanDate() {
		return planDate;
	}
	public void setPlanDate(String planDate) {
		this.planDate = planDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public PurchasePlan(String planId, String planDate, String state,
			int userId, String mark) {
		super();
		this.planId = planId;
		this.planDate = planDate;
		this.state = state;
		this.userId = userId;
		this.mark = mark;
	}
	
	public PurchasePlan(String planId, String state) {
		super();
		this.planId = planId;
		this.state = state;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PurchasePlan other = (PurchasePlan) obj;
		if (planId == null) {
			if (other.planId != null)
				return false;
		} else if (!planId.equals(other.planId))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}
	public PurchasePlan() {
		super();
		// TODO Auto-generated constructor stub
	}
}
