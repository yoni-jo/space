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
    	
    	return mv;
    }
	@RequestMapping(value="/admin/selectreqList")
    public ModelAndView selectreqList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminReqService.selectreqList(commandMap.getMap());
    	mv.addObject("list", list);

    	if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
    }
	
	@RequestMapping(value="admin/insertreqList")
	public ModelAndView insertreqList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/insertreqList");
		
		adminReqService.insertreqList(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value="admin/deletereqList")
	public ModelAndView deletereqList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/deletereqList");
		
		adminReqService.deletereqList(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping(value="admin/deletereq")
	public ModelAndView deletereq(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/deletereq");
		
		adminReqService.deletereq(commandMap.getMap());
		
		return mv;
	}
}