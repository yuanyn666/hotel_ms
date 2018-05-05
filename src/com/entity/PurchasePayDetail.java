package com.entity;
//采购付款明细文件
public class PurchasePayDetail {
	private String payDetaId;
	private String payId;
	private String orderId;
	public String getPayDetaId() {
		return payDetaId;
	}
	public void setPayDetaId(String payDetaId) {
		this.payDetaId = payDetaId;
	}
	public String getPayId() {
		return payId;
	}
	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public PurchasePayDetail(String payDetaId, String payId, String orderId) {
		super();
		this.payDetaId = payDetaId;
		this.payId = payId;
		this.orderId = orderId;
	}
	public PurchasePayDetail() {
		super();
	}
	@Override
	public String toString() {
		return "PurchasePayDetail [orderId=" + orderId + ", payDetaId="
				+ payDetaId + ", payId=" + payId + "]";
	}

}
