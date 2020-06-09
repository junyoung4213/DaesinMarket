package com.daesin.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.daesin.beans.BoardBean;
import com.daesin.beans.PageBean;
import com.daesin.beans.TradeBean;
import com.daesin.dao.TradeDao;

@Service
public class TradeService {

	@Value("${path.upload}")
	private String path_upload;

	@Value("${page.listcnt}")
	private int page_listcnt;

	@Value("${page.paginationcnt}")
	private int page_paginationcnt;

	@Autowired
	private TradeDao tradeDao;
	
	public void addTradeInfo(HashMap<String, Integer> list) {
		tradeDao.addTradeInfo(list);
	}
	
	public void updateBoardInfo(HashMap<String, Integer> list) {
		tradeDao.updateBoardInfo(list);
	}
	


	// 일반 회원
	public List<BoardBean> getTradeList(int mNo, int page) {

		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return tradeDao.getTradeList(mNo, rowBounds);

	}
	
	public PageBean getContentCnt(int mNo, int currentPage) {
		int content_cnt = tradeDao.getContentCnt(mNo);

		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageBean;
	}
	
	// 서포터
	public List<TradeBean> getTradeList2(int mNo, int page) {
		
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return tradeDao.getTradeList2(mNo, rowBounds);
		
	}
	
	public PageBean getContentCnt2(int mNo, int currentPage) {
		int content_cnt = tradeDao.getContentCnt2(mNo);
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}

}