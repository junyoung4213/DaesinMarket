package com.daesin.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.daesin.beans.MemberBean;
import com.daesin.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	@Resource(name = "loginUserBean")
	@Lazy
	private MemberBean loginUserBean;

	public boolean checkUserIdExist(String user_id) {
		String user_name = userDao.checkUserIdExist(user_id);

		if (user_name == null) {
			return true;
		} else {
			return false;
		}
	}

	public void addUserInfo(MemberBean joinUserBean) {
		userDao.addUserInfo(joinUserBean);
	}

	public void getLoginUserInfo(MemberBean tempLoginUserBean) {
		MemberBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);

		if (tempLoginUserBean2 != null) {
			loginUserBean.setMNo(tempLoginUserBean2.getMNo());
			loginUserBean.setMId(tempLoginUserBean2.getMId());
			loginUserBean.setMemberLogin(true);
		}
	}

	public void getModifyUserInfo(MemberBean modifyUserBean) {
		MemberBean tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getMNo());

		modifyUserBean.setMId(tempModifyUserBean.getMId());
		modifyUserBean.setMNo(loginUserBean.getMNo());

	}

	public void modifyUserInfo(MemberBean modifyUserBean) {

		modifyUserBean.setMNo(loginUserBean.getMNo());

		userDao.modifyUserInfo(modifyUserBean);
	}

}
