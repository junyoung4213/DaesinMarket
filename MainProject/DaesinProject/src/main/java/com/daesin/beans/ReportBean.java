package com.daesin.beans;

public class ReportBean {

	// 신고번호
	private int rNo;

	// 게시물번호
	private int rBno;

	// 신고자번호
	private int rSno;

	// 신고내용
	private String rMsg;

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrBno() {
		return rBno;
	}

	public void setrBno(int rBno) {
		this.rBno = rBno;
	}

	public int getrSno() {
		return rSno;
	}

	public void setrSno(int rSno) {
		this.rSno = rSno;
	}

	public String getrMsg() {
		return rMsg;
	}

	public void setrMsg(String rMsg) {
		this.rMsg = rMsg;
	}

	@Override
	public String toString() {
		return "ReportBean [rNo=" + rNo + ", rBno=" + rBno + ", rSno=" + rSno + ", rMsg=" + rMsg + "]";
	}

}
