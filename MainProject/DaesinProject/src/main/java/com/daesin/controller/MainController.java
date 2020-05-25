package com.daesin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	/*
	 * @Autowired private MainService mainService;
	 * 
	 * @Autowired private TopMenuService topMenuService;
	 */

	@GetMapping("/main")
	public String main(Model model) {

		/*
		 * ArrayList<List<BoardBean>> list = new ArrayList<List<BoardBean>>();
		 * 
		 * for (int i = 1; i <= 4; i++) { List<BoardBean> list1 =
		 * mainService.getMainList(i); list.add(list1); }
		 * 
		 * model.addAttribute("list", list);
		 * 
		 * List<BoardInfoBean> board_list = topMenuService.getTopMenuList();
		 * model.addAttribute("board_list", board_list);
		 */
		return "main";
	}
}
