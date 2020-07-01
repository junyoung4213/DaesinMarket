package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.BoardBean;
import com.daesin.beans.MemberBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String checkMemberIdExist(String m_id) {
		return sqlSessionTemplate.selectOne("member.checkMemberIdExist", m_id);
	}
	
	public String checkMemberEmailExist(String m_email) {
		return sqlSessionTemplate.selectOne("member.checkMemberEmailExist", m_email);
	}

	public MemberBean checkCorrectMember(MemberBean tempMemberBean) {
		return sqlSessionTemplate.selectOne("member.checkCorrectMember", tempMemberBean);
	}

	public String returnId(String m_email) {
		return sqlSessionTemplate.selectOne("member.returnId", m_email);
	}

	public String getId(int mNo) {
		return sqlSessionTemplate.selectOne("member.getId", mNo);
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		sqlSessionTemplate.insert("member.addMemberInfo", joinMemberBean);

	}

	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		return sqlSessionTemplate.selectOne("member.getLoginMemberInfo", tempLoginMemberBean);
	}

	public String getUserPw(String mId) {
		return sqlSessionTemplate.selectOne("member.getUserPw", mId);
	}

	public MemberBean getModifyMemberInfo(int m_no) {
		return sqlSessionTemplate.selectOne("member.getModifyMemberInfo", m_no);
	}

	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		sqlSessionTemplate.update("member.modifyMemberInfo", modifyMemberBean);
	}

	public void updatePw(MemberBean memberBean) {
		sqlSessionTemplate.update("member.updatePw", memberBean);
	}

	public int returnPoint(String mId) {
		return sqlSessionTemplate.selectOne("member.returnPoint", mId);
	}

	public void updatePointInfo(BoardBean boardBean) {
		sqlSessionTemplate.update("member.updatePointInfo", boardBean);
	}
}
