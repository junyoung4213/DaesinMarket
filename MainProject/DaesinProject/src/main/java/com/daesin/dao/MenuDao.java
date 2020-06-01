package com.daesin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.CategoryBean;

@Repository
public class MenuDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CategoryBean> getMenuList() {
		List<CategoryBean> menuList = sqlSessionTemplate.selectList("menu.get_menu_list");
		return menuList;
	}

}
