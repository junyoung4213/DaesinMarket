package com.daesin.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.daesin.beans.MemberBean;
import com.daesin.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	@Resource(name = "loginMemberBean")
	@Lazy
	private MemberBean loginMemberBean;
	
	

	public boolean checkMemberIdExist(String mId) {
		String member_id = memberDao.checkMemberIdExist(mId);

		if (member_id == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public String returnId(String mEmail) {
		String member_id = memberDao.returnId(mEmail);

		return member_id;
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		memberDao.addMemberInfo(joinMemberBean);
	}

	public void getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);

		if (tempLoginMemberBean2 != null) {
			loginMemberBean.setM_no(tempLoginMemberBean2.getM_no());
			loginMemberBean.setM_id(tempLoginMemberBean2.getM_id());
			loginMemberBean.setMemberLogin(true);
		}
	}

	public void getModifyMemberInfo(MemberBean modifyMemberBean) {
		MemberBean tempModifyMemberBean = memberDao.getModifyMemberInfo(loginMemberBean.getM_no());

		modifyMemberBean.setM_id(tempModifyMemberBean.getM_id());
		modifyMemberBean.setM_no(loginMemberBean.getM_no());

	}

	public void modifyMemberInfo(MemberBean modifyMemberBean) {

		modifyMemberBean.setM_no(loginMemberBean.getM_no());

		memberDao.modifyMemberInfo(modifyMemberBean);
	}

}
