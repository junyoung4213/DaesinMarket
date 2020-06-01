package com.daesin.beans;

public class SupporterBean {

	// 서포터 번호
	private int sNo;
	
	// 서포터 first name
	private String sFname;
	
	// 서포터 last name
	private String sLname;
	
	// 서포터 전화번호
	private String sPhone;

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsFname() {
		return sFname;
	}

	public void setsFname(String sFname) {
		this.sFname = sFname;
	}

	public String getsLname() {
		return sLname;
	}

	public void setsLname(String sLname) {
		this.sLname = sLname;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	@Override
	public String toString() {
		return "SupporterBean [sNo=" + sNo + ", sFname=" + sFname + ", sLname=" + sLname + ", sPhone=" + sPhone + "]";
	}

	
}
