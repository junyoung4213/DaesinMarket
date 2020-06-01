package com.daesin.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.daesin.beans.BoardBean;
import com.daesin.beans.BoardImgBean;
import com.daesin.beans.MemberBean;
import com.daesin.beans.PageBean;
import com.daesin.dao.BoardDao;

@Service
public class BoardService {

	@Value("${path.upload}")
	private String path_upload;

	@Value("${page.listcnt}")
	private int page_listcnt;

	@Value("${page.paginationcnt}")
	private int page_paginationcnt;

	@Autowired
	private BoardDao boardDao;

	@Autowired
	@Lazy
	private BoardBean boardBean;

	private String saveUploadFile(MultipartFile upload_file) {

		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public void addContentInfo(BoardImgBean writeContentBean) {

		MultipartFile upload_file = writeContentBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeContentBean.setBiName(file_name);
		}
		writeContentBean.setBiBno(boardBean.getbMno());

		boardDao.addContentInfo(writeContentBean);

	}

	public String getBoardInfoName(int board_info_idx) {
		return boardDao.getBoardInfoName(board_info_idx);
	}

	public List<BoardBean> getBoardList(int bCno, int page) {

		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return boardDao.getBoardList(bCno, rowBounds);

	}

	public BoardBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}

	public void modifyContentInfo(BoardImgBean modifyContentBean) {
		MultipartFile upload_file = modifyContentBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setBiName(file_name);
		}
		boardDao.modifyContentInfo(modifyContentBean);
	}

	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}

	public PageBean getContentCnt(int bCno, int currentPage) {
		int content_cnt = boardDao.getContentCnt(bCno);

		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageBean;
	}
}
