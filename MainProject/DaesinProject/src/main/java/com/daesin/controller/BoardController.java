package com.daesin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.beans.BoardBean;
import com.daesin.beans.CommentBean;
import com.daesin.beans.MemberBean;
import com.daesin.beans.PageBean;
import com.daesin.beans.ReportBean;
import com.daesin.service.BoardService;
import com.daesin.service.SupporterService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private SupporterService supporterService;

	@GetMapping("/main")
	public String main(@RequestParam(value="bCno", defaultValue = "1") int bCno, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {
		model.addAttribute("bCno", bCno);

		String cName = boardService.getBoardInfoName(bCno);
		model.addAttribute("cName", cName);

		List<BoardBean> boardList = boardService.getBoardList(bCno, page);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);

		PageBean pageBean = boardService.getContentCnt(bCno, page);

		System.out.println("main페이지 : " + pageBean.toString());

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
	public String write_pro(@ModelAttribute("writeContentBean") BoardBean writeContentBean, HttpSession session) {

		MemberBean member = (MemberBean) session.getAttribute("member");

		if (writeContentBean.getbReward() > member.getmPoint()) {
			return "board/write_fail";
		}

		boardService.addContentInfo(writeContentBean);

		return "board/write_success";
	}

	@GetMapping("/read")
	public String read(@RequestParam("bCno") int bCno, @RequestParam("bNo") int bNo, @RequestParam("page") int page,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage, Model model) {
		model.addAttribute("bCno", bCno);

		String cName = boardService.getBoardInfoName(bCno);
		model.addAttribute("cName", cName);

		model.addAttribute("bNo", bNo);

		BoardBean readContentBean = boardService.getContentInfo(bNo);
		/* CommentBean readCommentBean = supporterService.findCommentInfo(bNo); */
		model.addAttribute("readContentBean", readContentBean);
		/* model.addAttribute("readCommentBean", readCommentBean); */

		model.addAttribute("page", page);

		PageBean pageBean = supporterService.getCommentCnt(bNo, cPage);

		System.out.println(pageBean.toString());
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("cPage", cPage);

		return "board/read";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("bNo") int bNo, @RequestParam("bCno") int bCno,
			@ModelAttribute("modifyContentBean") BoardBean modifyContentBean, @RequestParam("page") int page,
			Model model) {

		model.addAttribute("bNo", bNo);
		model.addAttribute("bCno", bCno);
		model.addAttribute("page", page);

		modifyContentBean = boardService.getContentInfo(bNo);
		modifyContentBean.setbNo(bNo);
		modifyContentBean.setbCno(bCno);

		System.out.println(modifyContentBean.toString());

		model.addAttribute("modifyContentBean", modifyContentBean);

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
	public String delete(@RequestParam("bNo") int bNo, @RequestParam("bCno") int bCno, Model model) {

		boardService.deleteContentInfo(bNo);

		model.addAttribute("bNo", bNo);
		model.addAttribute("bCno", bCno);

		return "board/delete";
	}

	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}

	@RequestMapping(value = "/addComment.do")
	@ResponseBody
	public String ajax_addComment(@ModelAttribute("commentBean") CommentBean commentBean, HttpSession session)
			throws Exception {

		MemberBean memberBean = (MemberBean) session.getAttribute("member");
		try {
			System.out.println(memberBean.toString());
			commentBean.setCoName(memberBean.getsName());
			supporterService.addComment(commentBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "/commentList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<Object> ajax_commentList(@ModelAttribute("commentBean") CommentBean commentBean,
			@RequestParam("coBno") int coBno, @RequestParam("coSno") int coSno, @RequestParam("bMno") int bMno,
			HttpServletRequest request, @RequestParam(value = "cPage", defaultValue = "1") int cPage) throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap<String, Object>> hmlist = new ArrayList<HashMap<String, Object>>();

		commentBean.setCoBno(coBno);
		commentBean.setCoSno(coSno);

		// 해당 게시물 댓글
		List<CommentBean> commentList;
		commentList = supporterService.selectComment(coBno, cPage);
		PageBean pageBean = supporterService.getCommentCnt(coBno, cPage);

		// 게시물 작성자만 댓글 보이게, 서포터는 자기가 작성한 댓글만 볼 수 있게 하는 설정
		// if(bMno == coSno) {
		// commentList = supporterService.selectComment(coBno, cPage);
		// pageBean = supporterService.getCommentCnt(coBno, cPage);
		// }else {
		// commentList = supporterService.selectCommentPart(coSno, cPage);
		// pageBean = supporterService.getCommentCntPart(coSno, cPage);
		// }

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("pageBean", pageBean);
		hmlist.add(hm);

		if (commentList.size() > 0) {
			for (int i = 0; i < commentList.size(); i++) {
				hm = new HashMap<String, Object>();
				hm.put("co_num", commentList.get(i).getCoNum());
				hm.put("co_msg", commentList.get(i).getCoMsg());
				hm.put("co_name", commentList.get(i).getCoName());
				hm.put("co_date", commentList.get(i).getCoDate());
				hm.put("co_sno", commentList.get(i).getCoSno());
				hmlist.add(hm);
			}

		}
		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity<Object>(json.toString(), responseHeaders, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/report.do")
	@ResponseBody
	public String ajax_report(@ModelAttribute("reportBean") ReportBean reportBean, @RequestParam("bNo") int bNo,
			@RequestParam("report") String report, HttpSession session) throws Exception {

		MemberBean memberBean = (MemberBean) session.getAttribute("member");
		try {
			System.out.println("report: " + report);
			System.out.println(memberBean.toString());
			reportBean.setrSno(memberBean.getmNo());
			reportBean.setrBno(bNo);
			reportBean.setrMsg(report);
			System.out.println(reportBean.toString());
			supporterService.addReport(reportBean);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	@RequestMapping(value = "/delete.do")
	@ResponseBody
	public String ajax_delete(@RequestParam("coNum") int coNum) throws Exception {

		try {
			System.out.println(coNum);
			supporterService.deleteReport(coNum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

}
