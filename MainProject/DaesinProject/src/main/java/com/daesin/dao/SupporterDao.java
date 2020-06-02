package com.daesin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.CommentBean;
import com.daesin.beans.MemberBean;

@Repository
public class SupporterDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void addSupporterInfo(MemberBean tempSupporterBean) {
		sqlSessionTemplate.insert("member.addSupporterInfo",tempSupporterBean);
	}
	
	public CommentBean findCommentInfo(int bNo) {
		return sqlSessionTemplate.selectOne("comment.findCommentInfo",bNo);
	}
	
	public void addComment(CommentBean commentBean) {
		sqlSessionTemplate.insert("comment.addComment",commentBean);
	}
	
	public List<CommentBean> selectComment(CommentBean commentBean){
		return sqlSessionTemplate.selectList("comment.selectComment",commentBean);
	}
	
}
