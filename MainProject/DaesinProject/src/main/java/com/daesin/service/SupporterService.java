package com.daesin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesin.beans.CommentBean;
import com.daesin.beans.MemberBean;
import com.daesin.dao.SupporterDao;

@Service
public class SupporterService {

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
	
	public List<CommentBean> selectComment(int coBno){
		return supporterDao.selectComment(coBno);
	}

}
