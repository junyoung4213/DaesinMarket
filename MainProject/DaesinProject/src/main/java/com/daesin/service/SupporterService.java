package com.daesin.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.daesin.beans.CommentBean;
import com.daesin.beans.MemberBean;
import com.daesin.beans.PageBean;
import com.daesin.beans.ReportBean;
import com.daesin.dao.SupporterDao;

@Service
public class SupporterService {

	@Value("${path.upload}")
	private String path_upload;

	@Value("${page.listcnt}")
	private int page_listcnt;

	@Value("${page.paginationcnt}")
	private int page_paginationcnt;

	@Autowired
	private SupporterDao supporterDao;

	public void addSupporterInfo(MemberBean tempSupporterBean) {
		supporterDao.addSupporterInfo(tempSupporterBean);
	}

	public CommentBean findCommentInfo(int bNo) {
		return supporterDao.findCommentInfo(bNo);
	}

	public void addComment(CommentBean commentBean) {
		supporterDao.addComment(commentBean);
	}

	public List<CommentBean> selectComment(int coBno, int cPage) {

		int start = (cPage - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return supporterDao.selectComment(coBno, rowBounds);
	}

	public List<CommentBean> selectCommentPart(int coSno, int cPage) {

		int start = (cPage - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return supporterDao.selectCommentPart(coSno, rowBounds);
	}

	public PageBean getCommentCnt(int coBno, int currentPage) {
		int content_cnt = supporterDao.getCommentCnt(coBno);

		System.out.println("content_cnt : " + content_cnt);

		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageBean;
	}

	public PageBean getCommentCntPart(int coSno, int currentPage) {
		int content_cnt = supporterDao.getCommentCntPart(coSno);

		System.out.println("content_cnt : " + content_cnt);

		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageBean;
	}

	public void addReport(ReportBean reportBean) {
		supporterDao.addReport(reportBean);
	}

	public void deleteReport(int coNum) {
		supporterDao.deleteReport(coNum);
	}

}
