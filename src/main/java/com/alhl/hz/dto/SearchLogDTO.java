package com.alhl.hz.dto;

public class SearchLogDTO {
	int srchId;
	String userId;
	String srchWord;
	java.sql.Timestamp srchTime;
	public int getSrchId() {
		return srchId;
	}
	public void setSrchId(int srchId) {
		this.srchId = srchId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSrchWord() {
		return srchWord;
	}
	public void setSrchWord(String srchWord) {
		this.srchWord = srchWord;
	}
	public java.sql.Timestamp getSrchTime() {
		return srchTime;
	}
	public void setSrchTime(java.sql.Timestamp srchTime) {
		this.srchTime = srchTime;
	}
	
	
}
