package com.daesin.beans;

public class QuestionBean {

	private String title;
	private String content;
	private int m_no;
	private String m_email;
	private String m_id;

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

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "QuestionBean [title=" + title + ", content=" + content + ", m_no=" + m_no + ", m_email=" + m_email
				+ ", m_id=" + m_id + "]";
	}

}
