package com.daesin.beans;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

//게시판 
public class BoardBean {

	// 카테고리번호
	private Integer bCno;

	// 글번호
	private Integer bNo;

	// 글제목
	@NotBlank
	private String bTitle;

	// 글내용
	@NotBlank
	private String bContent;

	// 이미지 파일
	private MultipartFile upload_file;

	// 파일명
	private String content_file;

	// 금액
	private Integer bReward;

	// 도로명주소
	private String bAddr1;

	// 상세주소
	private String bAddr2;

	// 작성시간
	private Date bWriteTime;

	// 마감시간
	private Date bEndTime;

	// 지원자수
	private Integer bSnumber;

	// 회원번호
	private Integer bMno;

	// 진행상황
	private Integer bStatus;

	// 연락처
	private String bPhone;

	public Integer getBCno() {
		return bCno;
	}

	public void setBCno(Integer bCno) {
		this.bCno = bCno;
	}

	public Integer getBNo() {
		return bNo;
	}

	public void setBNo(Integer bNo) {
		this.bNo = bNo;
	}

	public String getBTitle() {
		return bTitle;
	}

	public void setBTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getBContent() {
		return bContent;
	}

	public void setBContent(String bContent) {
		this.bContent = bContent;
	}

	public Integer getBReward() {
		return bReward;
	}

	public void setBReward(Integer bReward) {
		this.bReward = bReward;
	}

	public String getBAddr1() {
		return bAddr1;
	}

	public void setBAddr1(String bAddr1) {
		this.bAddr1 = bAddr1;
	}

	public String getBAddr2() {
		return bAddr2;
	}

	public void setBAddr2(String bAddr2) {
		this.bAddr2 = bAddr2;
	}

	public Date getBWriteTime() {
		return bWriteTime;
	}

	public void setBWriteTime(Date bWriteTime) {
		this.bWriteTime = bWriteTime;
	}

	public Date getBEndTime() {
		return bEndTime;
	}

	public void setBEndTime(Date bEndTime) {
		this.bEndTime = bEndTime;
	}

	public Integer getBSnumber() {
		return bSnumber;
	}

	public void setBSnumber(Integer bSnumber) {
		this.bSnumber = bSnumber;
	}

	public Integer getBMno() {
		return bMno;
	}

	public void setBMno(Integer bMno) {
		this.bMno = bMno;
	}

	public Integer getBStatus() {
		return bStatus;
	}

	public void setBStatus(Integer bStatus) {
		this.bStatus = bStatus;
	}

	public String getBPhone() {
		return bPhone;
	}

	public void setBPhone(String bPhone) {
		this.bPhone = bPhone;
	}

	public MultipartFile getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

	public String getContent_file() {
		return content_file;
	}

	public void setContent_file(String content_file) {
		this.content_file = content_file;
	}

	// Board 모델 복사
	public void CopyData(BoardBean param) {
		this.bCno = param.getBCno();
		this.bNo = param.getBNo();
		this.bTitle = param.getBTitle();
		this.bContent = param.getBContent();
		this.bReward = param.getBReward();
		this.bAddr1 = param.getBAddr1();
		this.bAddr2 = param.getBAddr2();
		this.bWriteTime = param.getBWriteTime();
		this.bEndTime = param.getBEndTime();
		this.bSnumber = param.getBSnumber();
		this.bMno = param.getBMno();
		this.bStatus = param.getBStatus();
		this.bPhone = param.getBPhone();
	}
}