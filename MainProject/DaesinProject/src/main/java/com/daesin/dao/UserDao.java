package com.daesin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.MemberBean;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String checkUserIdExist(String user_id) {
		return sqlSessionTemplate.selectOne("user.checkUserIdExist", user_id);
	}

	public void addUserInfo(MemberBean joinUserBean) {
		sqlSessionTemplate.insert("user.addUserInfo", joinUserBean);

	}

	public MemberBean getLoginUserInfo(MemberBean tempLoginUserBean) {
		return sqlSessionTemplate.selectOne("user.getLoginUserInfo", tempLoginUserBean);
	}

	public MemberBean getModifyUserInfo(int user_idx) {
		return sqlSessionTemplate.selectOne("user.getModifyUserInfo", user_idx);
	}

	public void modifyUserInfo(MemberBean modifyUserBean) {
		sqlSessionTemplate.update("user.modifyUserInfo",modifyUserBean);
	}
}
