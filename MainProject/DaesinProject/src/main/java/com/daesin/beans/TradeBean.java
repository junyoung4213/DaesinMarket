package com.daesin.beans;

//트레이드 게시판 
public class TradeBean {

	// 거래번호
	private int tNo;

	// 서포터번호
	private int tSno;

	// 게시물번호
	private int tBno;

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

	public BoardBean getBoardBean() {
		return boardBean;
	}

	public void setBoardBean(BoardBean boardBean) {
		this.boardBean = boardBean;
	}

	@Override
	public String toString() {
		return "TradeBean [tNo=" + tNo + ", tSno=" + tSno + ", tBno=" + tBno + ", boardBean=" + boardBean + "]";
	}

}