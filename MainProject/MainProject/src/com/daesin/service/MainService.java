package com.daesin.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesin.beans.BoardBean;
import com.daesin.dao.BoardDao;

@Service
public class MainService {

	@Autowired
	private BoardDao boardDao;

	public List<BoardBean> getMainList(int board_info_idx) {
		RowBounds rowBounds = new RowBounds(0, 5);
		return boardDao.getContentList(board_info_idx, rowBounds);

	}
}
