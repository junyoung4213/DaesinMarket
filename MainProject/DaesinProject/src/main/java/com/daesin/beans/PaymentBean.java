package com.daesin.beans;

//결제게시판 
public class PaymentBean {

	// 결제번호
	private int pNo;

	// 회원번호
	private int pMno;

	// 결제금액
	private int pAmount;

	// 결제날짜
	private String pDate;

	public int getPNo() {
		return pNo;
	}

	public void setPNo(int pNo) {
		this.pNo = pNo;
	}

	public int getPMno() {
		return pMno;
	}

	public void setPMno(int pMno) {
		this.pMno = pMno;
	}

	public int getPAmount() {
		return pAmount;
	}

	public void setPAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public String getPDate() {
		return pDate;
	}

	public void setPDate(String pDate) {
		this.pDate = pDate;
	}

	@Override
	public String toString() {
		return "PaymentBean [pNo=" + pNo + ", pMno=" + pMno + ", pAmount=" + pAmount + ", pDate=" + pDate + "]";
	}

}