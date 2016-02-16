package com.collectview.app.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.sample.vo.SampleVo;

@Controller
public class IssueInController {
    @RequestMapping(value="/issuein/list")
    public String openSampleBoardList(HttpServletRequest request, SampleVo sampleVo) throws Exception{
         
        return "/issuein/issueinlist";
    }
    
    @RequestMapping(value="/issuein")
    public String openSampleBoard(HttpServletRequest request, SampleVo sampleVo) throws Exception{
    	
    	return "/issuein/issuein";
    }
}
