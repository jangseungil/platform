package com.platform.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.board.vo.BoardVo;

@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());
    
    
    @RequestMapping(value="/")
    public String mainList(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
        return "/main/main";
    }
 
}
