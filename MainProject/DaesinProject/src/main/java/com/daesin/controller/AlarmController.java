package com.daesin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesin.beans.AlarmBean;
import com.daesin.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Autowired
	private AlarmService alarmService;

	@PostMapping("/save")
	@ResponseBody
	public String add(@ModelAttribute("alarmBean") AlarmBean alarmBean, @RequestParam("receiver") String receiver,@RequestParam("caller") String caller,@RequestParam("boardNum") int boardNum) {
		
		
		alarmBean.setAReceiver(receiver);
		alarmBean.setACaller(caller);
		alarmBean.setABno(boardNum);
		

		try {
			alarmService.addAlarm(alarmBean);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	


}
