package com.alhl.hz.dto;

public class SearchDTO implements Comparable<SearchDTO>{//정렬을 위한 인터페이스 구현 
	int srchIndex;
	String srchTitle;
	String srchURL;
	String srchImageURL;
	int srchPrice;
	String srchSiteName;
	
	@Override
    public int compareTo(SearchDTO s) {
        if (this.srchPrice < s.getSrchPrice()) {
            return -1;
        } else if (this.srchPrice > s.getSrchPrice()) {
            return 1;
        }
        return 0;
    }
	
	
	
	
	
	public int getSrchIndex() {
		return srchIndex;
	}
	public void setSrchIndex(int srchIndex) {
		this.srchIndex = srchIndex;
	}
	public String getSrchTitle() {
		return srchTitle;
	}
	public void setSrchTitle(String srchTitle) {
		this.srchTitle = srchTitle;
	}
	public String getSrchURL() {
		return srchURL;
	}
	public void setSrchURL(String srchURL) {
		this.srchURL = srchURL;
	}
	public String getSrchImageURL() {
		return srchImageURL;
	}
	public void setSrchImageURL(String srchImageURL) {
		this.srchImageURL = srchImageURL;
	}
	public int getSrchPrice() {
		return srchPrice;
	}
	public void setSrchPrice(int srchPrice) {
		this.srchPrice = srchPrice;
	}
	public String getSrchSiteName() {
		return srchSiteName;
	}
	public void setSrchSiteName(String srchSiteName) {
		this.srchSiteName = srchSiteName;
	}
	
	
}
