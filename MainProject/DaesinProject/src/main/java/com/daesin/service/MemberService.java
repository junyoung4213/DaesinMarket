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

	public void addMemberInfo(MemberBean joinMemberBean) {
		memberDao.addMemberInfo(joinMemberBean);
	}

	public void getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);

		if (tempLoginMemberBean2 != null) {
			loginMemberBean.setMNo(tempLoginMemberBean2.getMNo());
			loginMemberBean.setMId(tempLoginMemberBean2.getMId());
			loginMemberBean.setMemberLogin(true);
		}
	}

	public void getModifyMemberInfo(MemberBean modifyMemberBean) {
		MemberBean tempModifyMemberBean = memberDao.getModifyMemberInfo(loginMemberBean.getMNo());

		modifyMemberBean.setMId(tempModifyMemberBean.getMId());
		modifyMemberBean.setMNo(loginMemberBean.getMNo());

	}

	public void modifyMemberInfo(MemberBean modifyMemberBean) {

		modifyMemberBean.setMNo(loginMemberBean.getMNo());

		memberDao.modifyMemberInfo(modifyMemberBean);
	}

}
