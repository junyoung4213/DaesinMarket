package com.daesin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.BoardBean;
import com.daesin.beans.SearchBean;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void addContentInfo(BoardBean writeContentBean) {
		sqlSessionTemplate.insert("board.addContentInfo", writeContentBean);
	}

	public String getBoardInfoName(int board_info_idx) {
		return sqlSessionTemplate.selectOne("board.getBoardInfoName", board_info_idx);
	}

	public List<BoardBean> getBoardListAll(int bCno, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("board.getBoardListAll", bCno, rowBounds);
		
	}
	public List<BoardBean> getBoardList(int bCno, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("board.getBoardList", bCno, rowBounds);

	}
	
	public List<BoardBean> searchBoardList(SearchBean searchBean, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("board.searchBoardList", searchBean, rowBounds);
		
	}

	public BoardBean getContentInfo(int bNo) {
		return sqlSessionTemplate.selectOne("board.getContentInfo", bNo);
	}

	public void modifyContentInfo(BoardBean modifyContentBean) {
		sqlSessionTemplate.selectOne("board.modifyContentInfo", modifyContentBean);
	}

	public void deleteContentInfo(int bNo) {
		sqlSessionTemplate.delete("board.deleteContentInfo", bNo);
	}

	public int getContentCnt(int bCno) {
		return sqlSessionTemplate.selectOne("board.getContentCnt", bCno);
	}
	
	public int getAllContentCnt(int bCno) {
		return sqlSessionTemplate.selectOne("board.getAllContentCnt", bCno);
	}
	
	public int searchContentCnt(SearchBean searchBean) {
		return sqlSessionTemplate.selectOne("board.searchContentCnt", searchBean);
	}
	
}
