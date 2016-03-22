package com.platform.board.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.platform.board.service.BoardService;
import com.platform.common.common.CommandMap;


@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
    private BoardService boardService;
	
	@RequestMapping(value="/board/boardList")
	public ModelAndView openBoardList(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardList");
		//System.out.println("= "+ log.isDebugEnabled() +" =");
		log.debug("인터셉터 테스트");
		
		List<Map<String,Object>> list = boardService.selectBoardList(commandMap);
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/board/boardWrite")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardWrite");
	     
	    return mv;
	}
	
	@RequestMapping(value="/board/insertBoard")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/boardList");
	     
	    boardService.insertBoard(commandMap.getMap());
	     
	    return mv;
	}
	
	@RequestMapping(value="/board/boardDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardDetail");
	     
	    Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
	    mv.addObject("map", map);
	     
	    return mv;
	}
	
	@RequestMapping(value="/board/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/boardList");
	     
	    boardService.deleteBoard(commandMap.getMap());
	     
	    return mv;
	}
	
	
	@RequestMapping(value="/board/testMapArgumentResolver")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("");
		
		if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
		return mv;
	}
}
