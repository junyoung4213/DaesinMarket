package com.daesin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesin.beans.CategoryBean;
import com.daesin.dao.MenuDao;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;

	public List<CategoryBean> getMenuList() {
		List<CategoryBean> menuList = menuDao.getMenuList();
		return menuList;
	}

}
