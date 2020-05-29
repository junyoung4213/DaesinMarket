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

	public boolean checkMemberIdExist(String m_id) {
		String member_id = memberDao.checkMemberIdExist(m_id);

		if (member_id == null) {
			return true;
		} else {
			return false;
		}
	}

	public MemberBean checkCorrectMember(MemberBean tempMemberBean) {
		MemberBean MemberVO = memberDao.checkCorrectMember(tempMemberBean);

		if (MemberVO != null) {
			return MemberVO;
		}
		return null;

	}

	public String returnId(String m_email) {
		String member_id = memberDao.returnId(m_email);

		return member_id;
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		memberDao.addMemberInfo(joinMemberBean);
	}

	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);

		if (tempLoginMemberBean2 != null) {
			return tempLoginMemberBean2;
		}
		return null;
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
