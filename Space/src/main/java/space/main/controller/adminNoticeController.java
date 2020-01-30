package space.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminNoticeService;
import space.common.common.CommandMap;

@Controller
public class adminNoticeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="admin/noticeList")
	public ModelAndView AdminNoticeList(CommandMap commandMap, 
			HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("admin/noticeList");
		
		List<Map<String, Object>> list = adminNoticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="admin/noticeWriteForm")
	public ModelAndView AdminNoticeWrite(CommandMap commandMap, 
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/noticeWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="admin/noticeWrite")
	public ModelAndView insertNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		adminNoticeService.insertNotice(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="admin/noticeDetail")
	public ModelAndView AdminNoticeDetail(CommandMap commandMap) 
		throws Exception{
		ModelAndView mv = new ModelAndView("/admin/noticeDetail");
		
		Map<String, Object> map = adminNoticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="admin/deleteNotice")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		adminNoticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="admin/noticeModifyForm")
	public ModelAndView AdminNoticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/noticeModifyForm");
		
		Map<String, Object> map = adminNoticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="admin/modifyNotice")
	public ModelAndView modifynotice(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList");
		
		adminNoticeService.modifyNotice(commandMap.getMap());
		
		mv.addObject("NTC_NUM", commandMap.get("NTC_NUM"));
		
		return mv;
		
	}
	
	

}
