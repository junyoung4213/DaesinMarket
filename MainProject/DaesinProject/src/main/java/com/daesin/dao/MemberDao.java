package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.MemberBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String checkMemberIdExist(String mId) {
		return sqlSessionTemplate.selectOne("member.checkMemberIdExist", mId);
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		sqlSessionTemplate.insert("member.addMemberInfo", joinMemberBean);

	}

	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		return sqlSessionTemplate.selectOne("member.getLoginMemberInfo", tempLoginMemberBean);
	}

	public MemberBean getModifyMemberInfo(int mNo) {
		return sqlSessionTemplate.selectOne("member.getModifyMemberInfo", mNo);
	}

	public void modifyMemberInfo(MemberBean modifyUserBean) {
		sqlSessionTemplate.update("member.modifyMemberInfo",modifyUserBean);
	}
}
