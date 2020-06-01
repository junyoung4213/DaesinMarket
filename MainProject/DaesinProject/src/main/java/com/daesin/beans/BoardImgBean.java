package com.daesin.beans;

import org.springframework.web.multipart.MultipartFile;

//게시판 이미지 
public class BoardImgBean {

	// 글번호
	private int biBno;

	// 이미지번호
	private int biNo;

	// 파일명
	private String biName;

	// 이미지 파일
	private MultipartFile upload_file;


	public int getBiBno() {
		return biBno;
	}

	public void setBiBno(int biBno) {
		this.biBno = biBno;
	}

	public int getBiNo() {
		return biNo;
	}

	public void setBiNo(int biNo) {
		this.biNo = biNo;
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

// BoardImg 모델 복사
	public void CopyData(BoardImgBean param) {
		this.biBno = param.getBiBno();
		this.biNo = param.getBiNo();
		this.biName = param.getBiName();
	}
}