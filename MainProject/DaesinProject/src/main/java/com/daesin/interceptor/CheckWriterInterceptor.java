package com.daesin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.daesin.beans.BoardBean;
import com.daesin.beans.MemberBean;
import com.daesin.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor {

	@Autowired
	private BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String contextPath = request.getContextPath();
		try {
			HttpSession session = request.getSession();
			MemberBean member = (MemberBean)session.getAttribute("member");
			String str1 = request.getParameter("bNo");
			int bNo = Integer.parseInt(str1);

			BoardBean currentContentBean = boardService.getContentInfo(bNo);

			if (currentContentBean.getbMno()!= member.getmNo()) {
				response.sendRedirect(contextPath + "/board/not_writer");
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
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
