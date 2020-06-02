package com.daesin.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daesin.beans.BoardBean;
import com.daesin.beans.PageBean;
import com.daesin.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/main")
	public String main(@RequestParam("bCno") int bCno, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {
		model.addAttribute("bCno", bCno);

		String cName = boardService.getBoardInfoName(bCno);
		model.addAttribute("cName", cName);

		List<BoardBean> boardList = boardService.getBoardList(bCno, page);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);

		PageBean pageBean = boardService.getContentCnt(bCno, page);
		model.addAttribute("pageBean", pageBean);

		model.addAttribute("page", page);

		return "board/main";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") BoardBean writeContentBean,
			@RequestParam("bCno") int bCno) {

		writeContentBean.setbCno(bCno);

		return "board/write";
	}

	@PostMapping("/write_pro")
	public String write_pro(@ModelAttribute("writeContentBean") BoardBean writeContentBean) {

		System.out.println(writeContentBean.toString());
		boardService.addContentInfo(writeContentBean);

		return "board/write_success";
	}

	@GetMapping("/read")
	public String read(@RequestParam("bCno") int bCno, @RequestParam("bNo") int bNo, @RequestParam("page") int page,
			Model model) {
		model.addAttribute("bCno", bCno);
		
		String cName = boardService.getBoardInfoName(bCno);
		model.addAttribute("cName", cName);
		
		model.addAttribute("bNo", bNo);

		BoardBean readContentBean = boardService.getContentInfo(bNo);
		model.addAttribute("readContentBean", readContentBean);

		model.addAttribute("page", page);

		return "board/read";
	}
//


	@GetMapping("/modify")
	public String modify(@RequestParam("bNo") int bNo,
			@RequestParam("bCno") int bCno,
			@ModelAttribute("modifyContentBean") BoardBean modifyContentBean, @RequestParam("page") int page,
			Model model) {

		model.addAttribute("bNo", bNo);
		model.addAttribute("bCno", bCno);
		model.addAttribute("page", page);

		modifyContentBean = boardService.getContentInfo(bNo);
		modifyContentBean.setbNo(bNo);
		modifyContentBean.setbCno(bCno);
		
		System.out.println(modifyContentBean.toString());

		model.addAttribute("modifyContentBean",modifyContentBean);
		
		return "board/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyContentBean") BoardBean modifyContentBean,
			@RequestParam("page") int page, Model model) {

		model.addAttribute("page", page);

		boardService.modifyContentInfo(modifyContentBean);

		return "board/modify_success";
	}

	@GetMapping("/delete")
	public String delete(@RequestParam("bNo") int bNo,
			@RequestParam("bCno") int bCno, Model model) {

		boardService.deleteContentInfo(bNo);

		model.addAttribute("bNo", bNo);
		model.addAttribute("bCno",bCno);

		return "board/delete";
	}

	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}

}
