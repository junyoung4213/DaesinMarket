package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.MemberBean;
import com.daesin.beans.CommentBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String checkMemberIdExist(String m_id) {
		return sqlSessionTemplate.selectOne("member.checkMemberIdExist", m_id);
	}

	public MemberBean checkCorrectMember(MemberBean tempMemberBean) {
		return sqlSessionTemplate.selectOne("member.checkCorrectMember", tempMemberBean);
	}

	public String returnId(String m_email) {
		return sqlSessionTemplate.selectOne("member.returnId", m_email);
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		sqlSessionTemplate.insert("member.addMemberInfo", joinMemberBean);

	}
	
	

	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		return sqlSessionTemplate.selectOne("member.getLoginMemberInfo", tempLoginMemberBean);
	}

	public MemberBean getModifyMemberInfo(int m_no) {
		return sqlSessionTemplate.selectOne("member.getModifyMemberInfo", m_no);
	}

	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		sqlSessionTemplate.update("member.modifyMemberInfo", modifyMemberBean);
	}
}
