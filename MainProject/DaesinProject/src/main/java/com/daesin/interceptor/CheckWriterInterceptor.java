package com.daesin.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.daesin.beans.BoardBean;
import com.daesin.beans.MemberBean;
import com.daesin.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor {

	@Resource(name = "loginUserBean")
	@Lazy
	private MemberBean loginUserBean;
	@Autowired
	private BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		String str1 = request.getParameter("content_idx");
		int content_idx = Integer.parseInt(str1);

		BoardBean currentContentBean = boardService.getContentInfo(content_idx);

		if (currentContentBean.getBMno() != loginUserBean.getmNo()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
