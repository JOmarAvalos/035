package com.teknei.common.webapp.logging;

import static com.teknei.common.webapp.RequestUtils.getCurrentUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class NavigationLogger extends HandlerInterceptorAdapter {
	private static final Logger LOGGER = Logger.getLogger(NavigationLogger.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {

		String requestUrl = request.getRequestURL().toString();
		
		if(!requestUrl.contains("/resources") && !requestUrl.contains("localhost")) {
			long startTime = System.currentTimeMillis();		
			request.setAttribute("startTime", startTime);
			long handlerCode = startTime;
			request.setAttribute("handler", handlerCode);
			
			LOGGER.info("REQUEST [" + handlerCode + "], "
					+ "USER [" + getCurrentUser() + "], "
					+ "RESOURCE [" + requestUrl + (request.getQueryString() != null ? ("?" + request.getQueryString()) : "") + "]");
		}

		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
		Object handler, ModelAndView modelAndView) throws Exception {
		
		if(request.getAttribute("handler") != null) {
			long startTime = (Long) request.getAttribute("startTime");
			long handlerCode = (Long) request.getAttribute("handler");
			long endTime = System.currentTimeMillis();
			long executeTime = endTime - startTime;
			
			LOGGER.info("RESPONSE [" + handlerCode + "], TIME [" + executeTime + "ms]");
		}
	}
	
}
