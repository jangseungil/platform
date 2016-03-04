package com.platform.calculrator.salary.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.board.vo.BoardVo;

@Controller
public class SalaryController {
    Logger log = Logger.getLogger(this.getClass());
    
    @RequestMapping(value="/calculator/salary")
    public String salaryList(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
        return "/calculator/salary";
    }
 
    
    @RequestMapping(value="/calculator/salary2")
    public String salaryList2(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
    	return "/calculator/salary2";
    }
    
}
