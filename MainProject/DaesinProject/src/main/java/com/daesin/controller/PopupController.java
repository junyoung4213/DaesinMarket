package com.daesin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/popup")
public class PopupController {

	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "popup/jusoPopup";
	}
	@RequestMapping("/sertPopup")
	public String sertPopup() {
		return "popup/sertPopup";
	}
}
