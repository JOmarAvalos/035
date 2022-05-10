package com.teknei.listeners;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.quartz.impl.StdSchedulerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

//import com.teknei.admin.bsn.JobManager;
//import com.teknei.vo.JobVO;


//@WebListener
//@Repository
public class QuartzListener extends QuartzInitializerListener{
    private static final Logger LOG = LoggerFactory.getLogger(QuartzListener.class);

    private static Scheduler scheduler=null;


    public static Scheduler getScheduler() {
        return scheduler;
    }

//	@Autowired
//	private JobManager jobsManager;

    public void init(final ServletContext config) throws ServletException {
    	WebApplicationContext springContext;
    	springContext = WebApplicationContextUtils.getRequiredWebApplicationContext(config);
        final AutowireCapableBeanFactory beanFactory = springContext.getAutowireCapableBeanFactory();
        beanFactory.autowireBean(this);
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
    public void contextInitialized(ServletContextEvent sce) {
        super.contextInitialized(sce);
        ServletContext ctx = sce.getServletContext();

        try {
			init(ctx);
		} catch (ServletException e1) {
			e1.printStackTrace();
		}
//
//        if(jobsManager!=null)
//        {
//            StdSchedulerFactory factory = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
//
//    			try
//    			{
//
//    				List<JobVO> lstJobs = jobsManager.getJobNames();
//    				/*
//	        		List<JobVO> lstJobs = new ArrayList<JobVO>();
//
//	        		Calendar fchJob = Calendar.getInstance();
//	        		fchJob.add(Calendar.MINUTE, 1);
//
//	    			JobVO x = new JobVO();
//	    			x.setActive(1);
//	    			x.setCron("0 " + String.format("%02d", fchJob.get(Calendar.MINUTE)) + " " + String.format("%02d",fchJob.get(Calendar.HOUR_OF_DAY)) + " 1/1 * ? *");
//	    			x.setDescription("Test");
//	    			x.setId(0);
//	        		//x.setJavaClass("com.teknei.jobs.ProcesosNominaJob"); x.setName("NominaJobX");
//	        		//x.setJavaClass("com.teknei.jobs.ProcesosPedidosJob"); x.setName("PedidosJobX");
////	    			x.setJavaClass("com.teknei.jobs.ActualizaDivisasJob"); x.setName("ActualizaDivisasJob");
////	    			x.setJavaClass("com.teknei.jobs.ValidaICARJob"); x.setName("ValidaICARJob");
////	    			x.setJavaClass("com.teknei.jobs.ValidaListasNegrasJob"); x.setName("ValidaListasNegrasJob");
////	    			x.setJavaClass("com.teknei.jobs.LiberaTokensJob"); x.setName("LiberaTokensJob");
//	        		lstJobs.add(x);
//	        		*/
//
//	        		if(lstJobs!=null && !lstJobs.isEmpty())
//	        		{
//	        			LOG.info("------------------------------------------------------------");
//	        			LOG.info("---------------- Programando jobs --------------------------");
//	        			LOG.info("------------------------------------------------------------");
//
//	        			LOG.info("Obteniendo Jobs de la base de datos a configurar.");
//
//	        			for(JobVO j : lstJobs)
//	        			{
//	        				LOG.info("Job: " + j.toString());
//
//	        				//Active parameter validation
//	        				/**Actualizar a 1 para produccion */
//	        				if(j.getActive()!= 1)
//	        					continue;
//
//	        				//print job
//	        				if(scheduler==null)
//	        					scheduler = factory.getScheduler();
//
//	        	            Class c  = Class.forName(j.getJavaClass());
//
//	        	            if(c==null)
//		    	            	{
//		    	            		LOG.error("Null Pointer para la clase... " + j.getJavaClass());
//		    	            		continue;
//		    	            	}
//	        	            else
//	        	            {
//	        	            		LOG.info("Clase cargada y programada... " + c.getName());
//	        	            }
//
//	        	            JobDataMap jobDataMap = new JobDataMap();
//	        	            jobDataMap.put("ServletContext", sce.getServletContext());
//	        	            JobDetail job = JobBuilder.newJob( c ).usingJobData(jobDataMap).build();
//
//	        	            Trigger trigger = null;
//	        	            if(j.getTimeZone() != null && !j.getTimeZone().isEmpty()){
//		        	            trigger = TriggerBuilder.newTrigger().withIdentity(j.getName()).withSchedule(CronScheduleBuilder.cronSchedule(j.getCron()).inTimeZone(TimeZone.getTimeZone(j.getTimeZone()))).startNow().build();
//	        	            }else {
//		        	            trigger = TriggerBuilder.newTrigger().withIdentity(j.getName()).withSchedule(CronScheduleBuilder.cronSchedule(j.getCron())).startNow().build();
//	        	            }
//
//
//	        	            scheduler.scheduleJob(job, trigger);
//	        	            scheduler.start();
//
//	        			}
//	        		}
//	        		else
//	        			LOG.info("No se obtuvieron jobs a programar.");
//
//    			}
//	    		catch(Exception e)
//	    		{
//	    			e.printStackTrace();
//	    		}
//	    	}
//	    	else
//	    	{
//	    		LOG.error("Es conexión nula en spring database()");
//	    	}
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    	System.out.println("*************************************** INITIAL DESTROYED");

        try {
        	if (sce!=null && sce.getServletContext()!=null) {
        	        ServletContext context = sce.getServletContext();
        	        StdSchedulerFactory sch = (StdSchedulerFactory) context.getAttribute("org.quartz.impl.StdSchedulerFactory.KEY");

        	        if(sch!=null){
        	                LOG.info("call quartz Scheduler.shutdown()");
        	                Collection<Scheduler> col = sch.getAllSchedulers();
        	                for(Scheduler s:col)
        	                    s.shutdown();

        	                Thread.sleep(1000);
        	        }
        	    }
		} catch (Exception e) {
			LOG.error("*************************************** SCHEDULER DESTROYED");
			LOG.error(e.getMessage());
		}

        try {
			org.postgresql.Driver.deregister();
		} catch (SQLException e) {
			LOG.error("*************************************** ERROR DB DESTROYED");
			LOG.error(e.getMessage());
		}

        super.contextDestroyed(sce);

        System.out.println("*************************************** FINAL DESTROYED");
    }

}
