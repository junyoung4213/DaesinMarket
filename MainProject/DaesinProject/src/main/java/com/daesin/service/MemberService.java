package com.daesin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.daesin.beans.MemberBean;
import com.daesin.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

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
	
	public String getId(int mNo) {
		return memberDao.getId(mNo);
	}

	public void addMemberInfo(MemberBean joinMemberBean) {
		
		  String encPassword = bcryptPasswordEncoder.encode(joinMemberBean.getmPw());
		  joinMemberBean.setmPw(encPassword);
		memberDao.addMemberInfo(joinMemberBean);
	}
	


	public MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean) {
		
		String pw = memberDao.getUserPw(tempLoginMemberBean.getmId());
		  String rawPw = tempLoginMemberBean.getmPw();
		  if(bcryptPasswordEncoder.matches(rawPw, pw)) {
		    tempLoginMemberBean.setmPw(pw);
		  }
		MemberBean tempLoginMemberBean2 = memberDao.getLoginMemberInfo(tempLoginMemberBean);

		if (tempLoginMemberBean2 != null) {
			return tempLoginMemberBean2;
		}
		return null;
	}

	public void modifyMemberInfo(MemberBean modifyMemberBean) {
		memberDao.modifyMemberInfo(modifyMemberBean);
	}

}
