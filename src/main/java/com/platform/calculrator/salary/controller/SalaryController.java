package com.platform.calculrator.salary.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.platform.calculrator.salary.service.SalaryService;
import com.platform.calculrator.salary.vo.SalaryVo;

import first.board.vo.BoardVo;

@Controller
public class SalaryController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Autowired
    private SalaryService salaryService;
    
    @RequestMapping(value="/calculator/salary")
    public String salaryList(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
        return "/calculator/salary";
    }
 
    
    @RequestMapping(value="/calculator/salary/get")
    public @ResponseBody Object salaryJson(@RequestBody SalaryVo salaryVo) throws Exception{
    	
    	salaryService.getSalary(salaryVo);
    	
    	return salaryVo;
    }
    
    
    @RequestMapping(value="/calculator/salary2")
    public String salaryList2(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
    	return "/calculator/salary2";
    }
    
}
