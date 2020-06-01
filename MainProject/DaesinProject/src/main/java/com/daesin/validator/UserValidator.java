package com.daesin.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.daesin.beans.MemberBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		MemberBean userBean = (MemberBean) target;

		String beanName = errors.getObjectName();

		if (beanName.equals("joinUserBean")) {

			if (userBean.isMemberIdExist() == false) {
				errors.rejectValue("user_id", "DontCheckUserIdExist");
			}
		}

	}
}
