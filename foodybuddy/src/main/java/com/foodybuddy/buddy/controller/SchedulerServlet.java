package com.foodybuddy.buddy.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.foodybuddy.buddy.service.DeleteScheduler;

@WebServlet(urlPatterns = {"/scheduler"}, loadOnStartup = 1)
public class SchedulerServlet extends HttpServlet {
	
	 @Override
	    public void init(ServletConfig config) throws ServletException {
	        super.init(config);
	        
	        // 스케줄러 시작
	        DeleteScheduler.startScheduler();
	        
	        System.out.println("스케줄러가 시작되었습니다.");
	    }
}
