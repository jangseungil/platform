package first.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.board.service.BoardService;
import first.board.vo.BoardVo;

@Controller
public class MainController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Autowired
    private BoardService boardService;
     
    @RequestMapping(value="/")
    public String openSampleBoardList(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
        return "/main/main";
    }
 
}
