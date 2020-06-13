package com.daesin.beans;

//알람 저장소 
public class AlarmBean {

	// 알람번호
	private int aNo;

	// 보낸사람
	private String aCaller;

	// 받는사람
	private String aReceiver;

	// 게시물번호
	private int aBno;

	// 메세지
	private String aMsg;

	public int getANo() {
		return aNo;
	}

	public void setANo(int aNo) {
		this.aNo = aNo;
	}

	public String getACaller() {
		return aCaller;
	}

	public void setACaller(String aCaller) {
		this.aCaller = aCaller;
	}

	public String getAReceiver() {
		return aReceiver;
	}

	public void setAReceiver(String aReceiver) {
		this.aReceiver = aReceiver;
	}

	public int getABno() {
		return aBno;
	}

	public void setABno(int aBno) {
		this.aBno = aBno;
	}

	public String getaMsg() {
		return aMsg;
	}

	public void setaMsg(String aMsg) {
		this.aMsg = aMsg;
	}

	@Override
	public String toString() {
		return "AlarmBean [aNo=" + aNo + ", aCaller=" + aCaller + ", aReceiver=" + aReceiver + ", aBno=" + aBno
				+ ", aMsg=" + aMsg + "]";
	}

}