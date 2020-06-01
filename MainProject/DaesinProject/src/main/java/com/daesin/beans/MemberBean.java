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
	private int mNo;

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

	// 회원 로그인 여부 확인
	private boolean memberLogin;

	// 회원아이디 존재 확인
	private boolean memberIdExist;

	// 이메일 인증번호
	private String certification;

	private String sFname;
	private String sLname;
	private String sPhone;
	private int sScore;

	public MemberBean() {
		this.memberIdExist = false;
		this.memberLogin = false;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmPw2() {
		return mPw2;
	}

	public void setmPw2(String mPw2) {
		this.mPw2 = mPw2;
	}

	public String getmPoint() {
		return mPoint;
	}

	public void setmPoint(String mPoint) {
		this.mPoint = mPoint;
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

	public String getsFname() {
		return sFname;
	}

	public void setsFname(String sFname) {
		this.sFname = sFname;
	}

	public String getsLname() {
		return sLname;
	}

	public void setsLname(String sLname) {
		this.sLname = sLname;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public int getsScore() {
		return sScore;
	}

	public void setsScore(int sScore) {
		this.sScore = sScore;
	}

	@Override
	public String toString() {
		return "MemberBean [mNo=" + mNo + ", mId=" + mId + ", mEmail=" + mEmail + ", mPw=" + mPw + ", mPw2=" + mPw2
				+ ", mPoint=" + mPoint + ", memberLogin=" + memberLogin + ", memberIdExist=" + memberIdExist
				+ ", certification=" + certification + ", sFname=" + sFname + ", sLname=" + sLname + ", sPhone="
				+ sPhone + ", sScore=" + sScore + "]";
	}

}
