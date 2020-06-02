package com.daesin.beans;

public class CommentBean {

	// 댓글번호
	private int coNum;

	// 서포터번호
	private int coSno;

	// 글 번호
	private int coBno;

	// 메세지
	private String coMsg;

	// 서포터 이름
	private String coName;

	private String coDate;

	public int getCoNum() {
		return coNum;
	}

	public void setCoNum(int coNum) {
		this.coNum = coNum;
	}

	public int getCoSno() {
		return coSno;
	}

	public void setCoSno(int coSno) {
		this.coSno = coSno;
	}

	public int getCoBno() {
		return coBno;
	}

	public void setCoBno(int coBno) {
		this.coBno = coBno;
	}

	public String getCoMsg() {
		return coMsg;
	}

	public void setCoMsg(String coMsg) {
		this.coMsg = coMsg;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getCoDate() {
		return coDate;
	}

	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}

	@Override
	public String toString() {
		return "CommentBean [coNum=" + coNum + ", coSno=" + coSno + ", coBno=" + coBno + ", coMsg=" + coMsg
				+ ", coName=" + coName + ", coDate=" + coDate + "]";
	}

}
