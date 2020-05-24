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

	@Resource(name = "loginUserBean")
	@Lazy
	private MemberBean loginUserBean;

	private String saveUploadFile(MultipartFile upload_file) {

		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return file_name;
	}

	public void addContentInfo(BoardBean writeContentBean) {

		MultipartFile upload_file = writeContentBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeContentBean.setContent_file(file_name);
		}
		writeContentBean.setBMno(loginUserBean.getMNo());

		boardDao.addContentInfo(writeContentBean);

	}

	public String getBoardInfoName(int board_info_idx) {
		return boardDao.getBoardInfoName(board_info_idx);
	}

	public List<BoardBean> getContentList(int board_info_idx, int page) {

		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);

		return boardDao.getContentList(board_info_idx, rowBounds);

	}

	public BoardBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}

	public void modifyContentInfo(BoardBean modifyContentBean) {
		MultipartFile upload_file = modifyContentBean.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setContent_file(file_name);
		}
		boardDao.modifyContentInfo(modifyContentBean);
	}

	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}

	public PageBean getContentCnt(int content_board_idx, int currentPage) {
		int content_cnt = boardDao.getContentCnt(content_board_idx);

		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageBean;
	}
}
