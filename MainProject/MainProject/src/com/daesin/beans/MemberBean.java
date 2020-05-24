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
	private Integer mNo;

	// 회원아이디
	private String mId;

	// 회원이메일
	private String mEmail;

	// 회원비밀번호
	private String mPw;

	// 회원포인트
	private String mPoint;

	// 회원닉네임
	private String mNickname;

	private boolean memberLogin;

	private boolean memberIdExist;

	public Integer getMNo() {
		return mNo;
	}

	public void setMNo(Integer mNo) {
		this.mNo = mNo;
	}

	public String getMId() {
		return mId;
	}

	public void setMId(String mId) {
		this.mId = mId;
	}

	public String getMEmail() {
		return mEmail;
	}

	public void setMEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getMPw() {
		return mPw;
	}

	public void setMPw(String mPw) {
		this.mPw = mPw;
	}

	public String getMPoint() {
		return mPoint;
	}

	public void setMPoint(String mPoint) {
		this.mPoint = mPoint;
	}

	public String getMNickname() {
		return mNickname;
	}

	public void setMNickname(String mNickname) {
		this.mNickname = mNickname;
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

	// Member 모델 복사
	public void CopyData(MemberBean param) {
		this.mNo = param.getMNo();
		this.mId = param.getMId();
		this.mEmail = param.getMEmail();
		this.mPw = param.getMPw();
		this.mPoint = param.getMPoint();
		this.mNickname = param.getMNickname();
	}

}
