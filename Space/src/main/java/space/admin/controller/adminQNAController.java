package space.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminQNAService;
import space.common.common.CommandMap;

@Controller
public class adminQNAController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminQNAService")
	private AdminQNAService adminQNAService;
	
	@RequestMapping(value="admin/QNAList")
	public ModelAndView AdminQNAList(CommandMap commandMap, 
			HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("admin/QNAList");
		
		return mv;
	}
	
	@RequestMapping(value="admin/selectQNAList")
	public ModelAndView AdminSelectQNAList(CommandMap commandMap, 
			HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminQNAService.selectQNAList(commandMap.getMap());
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	@RequestMapping(value="admin/QNADetail")
	public ModelAndView AdminQNADetail(CommandMap commandMap, HttpServletRequest request) 
		throws Exception{
		ModelAndView mv = new ModelAndView("/admin/QNADetail");
		
		List<Map<String, Object>> list = adminQNAService.selectQNADetail(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="admin/deleteQNA")
	public ModelAndView deleteQNA(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/QNAList");
		
		adminQNAService.deleteQNA(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="admin/insertComment")
	public ModelAndView insertComment(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/QNADetail");
		
		adminQNAService.insertComment(commandMap.getMap());
		
		mv.addObject("ADQNA_NUM", commandMap.get("ADQNA_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value="admin/deleteComment")
	public ModelAndView deleteComment(CommandMap commandMap) throws Exception{
ModelAndView mv = new ModelAndView("redirect:/admin/QNADetail");
		
		adminQNAService.deleteComment(commandMap.getMap());
		
		mv.addObject("ADQNA_NUM", commandMap.get("ADQNA_NUM"));
		
		return mv;
	}
	
	
	
	@RequestMapping(value="admin/QNAWriteForm")
	public ModelAndView AdminQNAWrite(CommandMap commandMap, 
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/QNAWriteForm");
		
		return mv;
	}
	

	
	@RequestMapping(value="admin/modifyQNA")
	public ModelAndView modifyQNA(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/QNAList");
		
		adminQNAService.modifyQNA(commandMap.getMap());
		
		mv.addObject("ADQNA_NUM", commandMap.get("ADQNA_NUM"));
		
		return mv;
		
	}

}
