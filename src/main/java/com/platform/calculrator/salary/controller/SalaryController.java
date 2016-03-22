package com.platform.calculrator.salary.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    	System.out.println(salaryVo);
    	salaryService.getSalary(salaryVo);
    	
    	return salaryVo;
    }
    
    @RequestMapping(value="/calculator/salary2")
    public String salaryList2(HttpServletRequest request, BoardVo boardVo) throws Exception{
    	
    	return "/calculator/salary2";
    }
    
    //json example
    @RequestMapping(
	    		value="/webservices/RCMC_LCC_SBSC_RQS_CNT_R0013/execute", 
	    		method = RequestMethod.POST,
	    		produces="application/json; charset=utf-8"
    		)
    public @ResponseBody String lhGetJson(String aa) throws Exception{
 		
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
 		String cur = sdf.format(new Date());
 		
 		JSONObject data1 = new JSONObject();
 		data1.put("CST_IDN_NO", "4408091041210");			
 		JSONArray array = new JSONArray();
 		array.add(data1);		
 						
 		JSONObject data2 = new JSONObject();
 		data2.put("RQ_DTTM", cur);
 		JSONArray array2 = new JSONArray();
 		array2.add(data2);
 		
 		JSONObject data3 = new JSONObject();
 		data3.put("SS_CODE", "Y");
 		data3.put("RS_DTTM", cur);
 		JSONArray array3 = new JSONArray();
 		array3.add(data3);
 		
 		JSONObject data4 = new JSONObject();
 		data4.put("SNM", "인천서창2(05,택2) 1블럭");
 		data4.put("CST_IDN_NO", "4408091041210");
 		data4.put("SPL_TP_CD_NM", "영구임대");
 		data4.put("LST_RSV_RNK", "91");
 		data4.put("CST_NM", "표영종");
 		data4.put("FST_RSV_RNK", "67");
 		data4.put("HTY_CD", "");
 		data4.put("SBSC_RQS_NO", "");
 		data4.put("HTY_NM","26형고령자");
 		data4.put("BZDT_NM", "");
 		data4.put("BNM", "");
 		JSONArray array4 = new JSONArray();
 		array4.add(data4);
 		
 		JSONObject json = new JSONObject();
 		json.put("dsSch", array);
 		json.put("reqHeader", array2);
 		json.put("resHeader", array3);
 		json.put("dsList", array4);
 		JSONArray array5 = new JSONArray();
 		array5.add(json);
 		
 		String body = array5.toJSONString();
    	//body = URLEncoder.encode(body , "UTF-8");
		
    	return body;
    }
    
}
