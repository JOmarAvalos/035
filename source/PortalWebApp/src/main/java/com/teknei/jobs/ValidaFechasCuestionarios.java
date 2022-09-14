package com.teknei.jobs;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

public class ValidaFechasCuestionarios implements Job{
	
//	@Autowired
//	private 
	
	public void init(final ServletContext config) throws ServletException {
		WebApplicationContext springContext;
		springContext = WebApplicationContextUtils.getRequiredWebApplicationContext(config);
		final AutowireCapableBeanFactory beanFactory = springContext.getAutowireCapableBeanFactory();
		beanFactory.autowireBean(this);
    }

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			ServletContext servletContext = (ServletContext) context.getMergedJobDataMap().get("ServletContext");
			init(servletContext);
		} catch (Exception e) {
		}
		
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
