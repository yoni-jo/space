package space.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminReqService;
import space.common.common.CommandMap;

@Controller
public class adminReqController { 
	
	Logger log = Logger.getLogger(this.getClass());
 
	@Resource(name="AdminReqService")
	private AdminReqService adminReqService;
	
	@RequestMapping(value="/admin/reqList")
    public ModelAndView reqList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/reqList");
    	
    	List<Map<String,Object>> list = adminReqService.selectreqList(commandMap.getMap());
    	mv.addObject("list", list);
    	return mv;
    }
}