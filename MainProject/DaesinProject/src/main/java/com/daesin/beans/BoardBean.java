package com.daesin.beans;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

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

	// 주소
	private String bAddr1;

	// 상세주소
	private String bAddr2;

	// 지역
	private String bAddr3;

	// 작성시간
	private Date bWriteTime;

	// 마감시간
	private Date bEndTime;

	// 작성자번호
	private int bMno;

	// 진행상황(0:대기중,1:진행중,2:완료,3:취소)
	private int bStatus;

	// 연락처
	private String bPhone;

	// 지역
	private String bLocation;

	// 파일명
	private String biName;

	// 이미지 파일
	private MultipartFile upload_file;

	// 작성자 아이디
	private String mId;

	// 카테고리 이름
	private String cName;

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

	public String getbAddr3() {
		return bAddr3;
	}

	public void setbAddr3(String bAddr3) {
		this.bAddr3 = bAddr3;
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

	public String getBiName() {
		return biName;
	}

	public void setBiName(String biName) {
		this.biName = biName;
	}

	public MultipartFile getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	@Override
	public String toString() {
		return "BoardBean [bCno=" + bCno + ", bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bReward=" + bReward + ", bAddr1=" + bAddr1 + ", bAddr2=" + bAddr2 + ", bAddr3=" + bAddr3
				+ ", bWriteTime=" + bWriteTime + ", bEndTime=" + bEndTime + ", bMno=" + bMno + ", bStatus=" + bStatus
				+ ", bPhone=" + bPhone + ", bLocation=" + bLocation + ", biName=" + biName + ", upload_file="
				+ upload_file + ", mId=" + mId + ", cName=" + cName + "]";
	}

}