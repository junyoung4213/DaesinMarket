package com.daesin.beans;

//트레이드 게시판 
public class TradeBean {

	// 거래번호
	private int tNo;

	// 서포터번호
	private int tSno;

	// 게시물번호
	private int tBno;

	// 의뢰금액
	private int tReward;

	// 회원 의사결정
	private int tMStatus;

	// 서포터 의사결정
	private int tSStatus;

	private BoardBean boardBean;

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public int gettSno() {
		return tSno;
	}

	public void settSno(int tSno) {
		this.tSno = tSno;
	}

	public int gettBno() {
		return tBno;
	}

	public void settBno(int tBno) {
		this.tBno = tBno;
	}

	public int gettReward() {
		return tReward;
	}

	public void settReward(int tReward) {
		this.tReward = tReward;
	}

	public BoardBean getBoardBean() {
		return boardBean;
	}

	public void setBoardBean(BoardBean boardBean) {
		this.boardBean = boardBean;
	}

	public int gettMStatus() {
		return tMStatus;
	}

	public void settMStatus(int tMStatus) {
		this.tMStatus = tMStatus;
	}

	public int gettSStatus() {
		return tSStatus;
	}

	public void settSStatus(int tSStatus) {
		this.tSStatus = tSStatus;
	}

	@Override
	public String toString() {
		return "TradeBean [tNo=" + tNo + ", tSno=" + tSno + ", tBno=" + tBno + ", tReward=" + tReward + ", tMStatus="
				+ tMStatus + ", tSStatus=" + tSStatus + ", boardBean=" + boardBean + "]";
	}

}