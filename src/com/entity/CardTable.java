package com.entity;

//报表
public class CardTable {
	private String cardId;
	private String cardName;
	private int userId;
	private int spid;
	private String mark;

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSpid() {
		return spid;
	}

	public void setSpid(int spid) {
		this.spid = spid;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public CardTable(String cardId, String cardName, int userId, int spid,
			String mark) {
		super();
		this.cardId = cardId;
		this.cardName = cardName;
		this.userId = userId;
		this.spid = spid;
		this.mark = mark;
	}

	public CardTable() {
		super();
	}

	@Override
	public String toString() {
		return "CardTable [cardId=" + cardId + ", cardName=" + cardName
				+ ", mark=" + mark + ", spid=" + spid + ", userId=" + userId
				+ "]";
	}

}
