package com.daesin.beans;

import java.sql.Date;

//게시판 
public class BoardBean {

	// 카테고리번호
	private int bCno;

	// 글번호
	private int bNo;

	// 글제목
	private String bTitle;

	// 글내용
	private String bContent;

	// 금액
	private int bReward;

	// 도로명주소
	private String bAddr1;

	// 상세주소
	private String bAddr2;

	// 작성시간
	private Date bWriteTime;

	// 마감시간
	private Date bEndTime;

	// 회원번호
	private int bMno;

	// 진행상황
	private int bStatus;

	// 연락처
	private String bPhone;

	// 지역
	private String bLocation;

	public int getbCno() {
		return bCno;
	}

	public void setbCno(int bCno) {
		this.bCno = bCno;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbReward() {
		return bReward;
	}

	public void setbReward(int bReward) {
		this.bReward = bReward;
	}

	public String getbAddr1() {
		return bAddr1;
	}

	public void setbAddr1(String bAddr1) {
		this.bAddr1 = bAddr1;
	}

	public String getbAddr2() {
		return bAddr2;
	}

	public void setbAddr2(String bAddr2) {
		this.bAddr2 = bAddr2;
	}

	public Date getbWriteTime() {
		return bWriteTime;
	}

	public void setbWriteTime(Date bWriteTime) {
		this.bWriteTime = bWriteTime;
	}

	public Date getbEndTime() {
		return bEndTime;
	}

	public void setbEndTime(Date bEndTime) {
		this.bEndTime = bEndTime;
	}

	public int getbMno() {
		return bMno;
	}

	public void setbMno(int bMno) {
		this.bMno = bMno;
	}

	public int getbStatus() {
		return bStatus;
	}

	public void setbStatus(int bStatus) {
		this.bStatus = bStatus;
	}

	public String getbPhone() {
		return bPhone;
	}

	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}

	public String getbLocation() {
		return bLocation;
	}

	public void setbLocation(String bLocation) {
		this.bLocation = bLocation;
	}

	@Override
	public String toString() {
		return "BoardBean [bCno=" + bCno + ", bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bReward=" + bReward + ", bAddr1=" + bAddr1 + ", bAddr2=" + bAddr2 + ", bWriteTime=" + bWriteTime
				+ ", bEndTime=" + bEndTime + ", bMno=" + bMno + ", bStatus=" + bStatus + ", bPhone=" + bPhone
				+ ", bLocation=" + bLocation + "]";
	}

}