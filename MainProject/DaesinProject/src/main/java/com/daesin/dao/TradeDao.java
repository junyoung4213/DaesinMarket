package com.daesin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesin.beans.BoardBean;
import com.daesin.beans.TradeBean;

@Repository
public class TradeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addTradeInfo(HashMap<String,Integer> list) {
		sqlSessionTemplate.insert("trade.addTradeInfo", list);
	}
	
	public void updateBoardInfo(HashMap<String, Integer> list) {
		sqlSessionTemplate.update("trade.updateBoardInfo",list);
	}

	public List<BoardBean> getTradeList(int mNo, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("trade.getTradeList", mNo, rowBounds);

	}
	
	public int getContentCnt(int bCno) {
		return sqlSessionTemplate.selectOne("trade.getContentCnt", bCno);
	}
	
	public List<TradeBean> getTradeList2(int mNo, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("trade.getTradeList2", mNo, rowBounds);
		
	}
	
	public int getContentCnt2(int bCno) {
		return sqlSessionTemplate.selectOne("trade.getContentCnt2", bCno);
	}

}
