package com.alhl.hz.dto;
//사용자 이용권관리 DTO 
public class ShopDTO {
	int shopId;
	String userId;
	int productNum;
	java.sql.Timestamp checkOutTime;
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public java.sql.Timestamp getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(java.sql.Timestamp checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
}