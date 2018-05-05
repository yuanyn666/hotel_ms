package com.entity;

public class Bad {
private int BadId;
private String BadName;
private int Money;
public Bad(String badName, int money) {
	super();
	BadName = badName;
	Money = money;
}
@Override
public String toString() {
	return "Bad [BadId=" + BadId + ", BadName=" + BadName + ", Money=" + Money
			+ "]";
}
public int getBadId() {
	return BadId;
}
public void setBadId(int badId) {
	BadId = badId;
}
public String getBadName() {
	return BadName;
}
public void setBadName(String badName) {
	BadName = badName;
}
public int getMoney() {
	return Money;
}
public void setMoney(int money) {
	Money = money;
}
public Bad(int badId, String badName, int money) {
	super();
	BadId = badId;
	BadName = badName;
	Money = money;
}
public Bad() {
	super();
}
}
