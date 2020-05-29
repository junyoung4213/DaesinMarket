package com.daesin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	
	private void saveDestination(HttpServletRequest request) {
		
		String contextPath = request.getContextPath(); 

		String uri = request.getRequestURI();
		
		if (uri.indexOf(contextPath) == 0) {
			//요청URI의 프로젝트명 뒷부분만 추출
			uri = uri.substring(contextPath.length());
		}
		
		String query = request.getQueryString();
		if(query == null || query.equals("null")) {
			query="";
		}else {
			query="?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("destination", uri+query);
		}
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String path = request.getContextPath();
		if (session.getAttribute("member") == null) {
			saveDestination(request);
			response.sendRedirect(path+"/member/not_login");
			return false;
		}

		return true;

	}

}
