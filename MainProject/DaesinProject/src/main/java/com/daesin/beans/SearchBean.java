package com.daesin.beans;

public class SearchBean {

	private String keyward;

	private int cNo;

	public String getKeyward() {
		return keyward;
	}

	public void setKeyward(String keyward) {
		this.keyward = keyward;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "SearchBean [keyward=" + keyward + ", cNo=" + cNo + "]";
	}

}
