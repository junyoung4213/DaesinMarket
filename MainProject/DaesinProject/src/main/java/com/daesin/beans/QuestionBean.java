package com.daesin.beans;

public class QuestionBean {

	private String title;
	private String content;
	private int mNo;
	private String mEmail;
	private String mId;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "QuestionBean [title=" + title + ", content=" + content + ", mNo=" + mNo + ", mEmail=" + mEmail
				+ ", mId=" + mId + "]";
	}

}
