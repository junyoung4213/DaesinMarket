package com.daesin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.beans.AlarmBean;
import com.daesin.beans.BoardBean;
import com.daesin.beans.MemberBean;
import com.daesin.beans.PageBean;
import com.daesin.beans.TradeBean;
import com.daesin.service.AlarmService;
import com.daesin.service.BoardService;
import com.daesin.service.MemberService;
import com.daesin.service.TradeService;

@Controller
@RequestMapping("/trade")
public class TradeController {

	@Autowired
	private TradeService tradeService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AlarmService alarmService;
	
	
	@GetMapping("/read")
	public String trade(@RequestParam("bNo") int bNo, Model model) {

		model.addAttribute("bNo", bNo);

		BoardBean readContentBean = boardService.getContentInfo(bNo);
		model.addAttribute("readContentBean", readContentBean);

		return "trade/read";
	}
	
	@PostMapping("/complete")
	@ResponseBody
	public String complete(@RequestParam("tBno") int tBno,@RequestParam("tReward") int tReward) {
		
		HashMap<String, Integer> list = new HashMap<String, Integer>();

		tReward-=1000;
		list.put("tBno", tBno);
		list.put("tReward", tReward);
		list.put("bStatus",2);
		
		
		try {
			tradeService.updateBoardInfo(list);
			tradeService.updateSupporterInfo(list);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@PostMapping("/cancel")
	@ResponseBody
	public String cancel(@RequestParam("mNo") int mNo,@RequestParam("tBno") int tBno,@RequestParam("tReward") int tReward) {
		
		HashMap<String, Integer> list = new HashMap<String, Integer>();

		list.put("mNo", mNo);
		list.put("tReward", tReward);
		list.put("tBno", tBno);
		list.put("bStatus",3);
		try {
			tradeService.updateBoardInfo(list);
			tradeService.rollbackMemberInfo(list);
			tradeService.deleteTradeInfo(list);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	

	@PostMapping("/add")
	@ResponseBody
	public String add(@RequestParam("tSno") int tSno, @RequestParam("tBno") int tBno,@RequestParam("mNo") int mNo, HttpSession session) {

		HashMap<String, Integer> list = new HashMap<String, Integer>();

		list.put("tSno", tSno);
		list.put("tBno", tBno);
		list.put("mNo", mNo);
		list.put("bStatus",1);

		try {
			tradeService.addTradeInfo(list);
			tradeService.updateBoardInfo(list);
			tradeService.updateMemberInfo(list);
			
			String sId = tradeService.getSupporterInfo(tSno);
			
			MemberBean member = memberService.getLoginMemberInfo((MemberBean)session.getAttribute("member"));
			
			session.setAttribute("member", member);
			session.setAttribute("sId", sId);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}

	@GetMapping("/member")
	public String member(@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {

		MemberBean member = (MemberBean) session.getAttribute("member");

		int mNo = member.getmNo();

		List<BoardBean> boardList = tradeService.getTradeList(mNo, page);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);

		PageBean pageBean = tradeService.getContentCnt(mNo, page);

		System.out.println("trade member : " + pageBean.toString());

		model.addAttribute("pageBean", pageBean);

		model.addAttribute("page", page);

		return "trade/member";
	}

	@GetMapping("/supporter")
	public String supporter(@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session,
			Model model) {

		MemberBean member = (MemberBean) session.getAttribute("member");

		int mNo = member.getmNo();

		List<TradeBean> boardList = tradeService.getTradeList2(mNo, page);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);

		PageBean pageBean = tradeService.getContentCnt2(mNo, page);

		System.out.println("tradeSupporter : " + pageBean.toString());

		model.addAttribute("pageBean", pageBean);

		model.addAttribute("page", page);

		return "trade/supporter";
	}

}
