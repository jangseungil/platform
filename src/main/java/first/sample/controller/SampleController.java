package first.sample.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import first.sample.service.SampleService;
import first.sample.vo.SampleVo;

@Controller
public class SampleController {
    Logger log = Logger.getLogger(this.getClass());
    
    @Autowired
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/sampleBoardList")
    public String openSampleBoardList(HttpServletRequest request, SampleVo sampleVo) throws Exception{
         
    	List<SampleVo> list = sampleService.selectBoardList(sampleVo);
        
        request.setAttribute("list", list);
        
        return "/sample/boardList";
    }

}
