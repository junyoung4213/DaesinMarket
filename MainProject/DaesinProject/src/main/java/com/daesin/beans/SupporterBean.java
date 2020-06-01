package com.daesin.beans;

public class SupporterBean {

	// 서포터 번호
	private int s_no;
	
	// 서포터 first name
	private String s_fname;
	
	// 서포터 last name
	private String s_lname;
	
	// 서포터 전화번호
	private String s_phone;

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getS_fname() {
		return s_fname;
	}

	public void setS_fname(String s_fname) {
		this.s_fname = s_fname;
	}

	public String getS_lname() {
		return s_lname;
	}

	public void setS_lname(String s_lname) {
		this.s_lname = s_lname;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	@Override
	public String toString() {
		return "SupporterBean [s_no=" + s_no + ", s_fname=" + s_fname + ", s_lname=" + s_lname + ", s_phone=" + s_phone
				+ "]";
	}

}
