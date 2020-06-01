package com.daesin.beans;

public class CategoryBean {

	private int cNo;
	private String cName;

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	@Override
	public String toString() {
		return "CategoryBean [cNo=" + cNo + ", cName=" + cName + "]";
	}

}
