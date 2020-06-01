package com.daesin.beans;

public class MemberBean {

	/*
	 * @Size(min = 2, max = 4)
	 * 
	 * @Pattern(regexp = "[가-힣]*") private String user_name;
	 * 
	 * @Size(min = 4, max = 20)
	 * 
	 * @Pattern(regexp = "[a-zA-Z0-9]*") private String user_id;
	 * 
	 * @Size(min = 4, max = 20)
	 * 
	 * @Pattern(regexp = "[a-zA-Z0-9]*") private String user_pw;
	 */

	// 회원번호
	private int m_no;

	// 회원아이디
	private String m_id;

	// 회원이메일
	private String m_email;

	// 회원비밀번호
	private String m_pw;

	// 회원비밀번호 확인
	private String m_pw2;

	// 회원포인트
	private String m_point;

	// 회원 로그인 여부 확인
	private boolean memberLogin;

	// 회원아이디 존재 확인
	private boolean memberIdExist;

	// 이메일 인증번호
	private String certification;

	private String s_fname;
	private String s_lname;
	private String s_phone;
	private int s_score;

	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_pw2() {
		return m_pw2;
	}

	public void setM_pw2(String m_pw2) {
		this.m_pw2 = m_pw2;
	}

	public String getM_point() {
		return m_point;
	}

	public void setM_point(String m_point) {
		this.m_point = m_point;
	}

	public boolean isMemberLogin() {
		return memberLogin;
	}

	public void setMemberLogin(boolean memberLogin) {
		this.memberLogin = memberLogin;
	}

	public boolean isMemberIdExist() {
		return memberIdExist;
	}

	public void setMemberIdExist(boolean memberIdExist) {
		this.memberIdExist = memberIdExist;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public String getS_fname() {
		return s_fname;
	}

	public void setS_fname(String s_fname) {
		this.s_fname = s_fname;
	}

	public String getS_lname() {
		return s_lname;
	}

	public void setS_lname(String s_lname) {
		this.s_lname = s_lname;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public int getS_score() {
		return s_score;
	}

	public void setS_score(int s_score) {
		this.s_score = s_score;
	}

	@Override
	public String toString() {
		return "MemberBean [m_no=" + m_no + ", m_id=" + m_id + ", m_email=" + m_email + ", m_pw=" + m_pw + ", m_pw2="
				+ m_pw2 + ", m_point=" + m_point + ", memberLogin=" + memberLogin + ", memberIdExist=" + memberIdExist
				+ ", certification=" + certification + ", s_fname=" + s_fname + ", s_lname="
				+ s_lname + ", s_phone=" + s_phone + ", s_score=" + s_score + "]";
	}

}
