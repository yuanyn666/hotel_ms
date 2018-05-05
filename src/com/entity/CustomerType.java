package com.entity;

//客户类型表
public class CustomerType {
	private int customerTypeId;
	private String cTypeName;
	private int discount;

	public int getCustomerTypeId() {
		return customerTypeId;
	}

	public void setCustomerTypeId(int customerTypeId) {
		this.customerTypeId = customerTypeId;
	}

	public String getcTypeName() {
		return cTypeName;
	}

	public void setcTypeName(String cTypeName) {
		this.cTypeName = cTypeName;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public CustomerType(int customerTypeId, String cTypeName, int discount) {
		super();
		this.customerTypeId = customerTypeId;
		this.cTypeName = cTypeName;
		this.discount = discount;
	}

	public CustomerType() {
		super();
	}

	@Override
	public String toString() {
		return "CustomerType [cTypeName=" + cTypeName + ", customerTypeId="
				+ customerTypeId + ", discount=" + discount + "]";
	}

}
