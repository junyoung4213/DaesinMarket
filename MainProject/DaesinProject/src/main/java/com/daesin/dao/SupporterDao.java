package com.daesin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.CommentBean;
import com.daesin.beans.MemberBean;
import com.daesin.beans.ReportBean;

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
	
	public List<CommentBean> selectComment(int coBno, RowBounds rowBounds){
		return sqlSessionTemplate.selectList("comment.selectComment",coBno,rowBounds);
	}
	
	public List<CommentBean> selectCommentPart(int coSno, RowBounds rowBounds){
		return sqlSessionTemplate.selectList("comment.selectCommentPart",coSno,rowBounds);
	}
	
	public int getCommentCnt(int coBno) {
		return sqlSessionTemplate.selectOne("comment.getCommentCnt", coBno);
	}
	
	public int getCommentCntPart(int coSno) {
		return sqlSessionTemplate.selectOne("comment.getCommentCntPart", coSno);
	}
	
	public void addReport(ReportBean reportBean) {
		sqlSessionTemplate.insert("report.addReport",reportBean);
	}
}
