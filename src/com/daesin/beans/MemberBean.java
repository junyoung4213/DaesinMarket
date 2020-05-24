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

	// 회원비밀번호 확인
	private String mPw2;

	// 회원포인트
	private String mPoint;

	// 회원닉네임
	private String mNickname;

	// 회원 로그인 여부 확인
	private boolean memberLogin;

	// 회원아이디 존재 확인
	private boolean memberIdExist;

	// 이메일 인증번호
	private String certification;

	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}

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

	public String getmPw2() {
		return mPw2;
	}

	public void setmPw2(String mPw2) {
		this.mPw2 = mPw2;
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

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
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
