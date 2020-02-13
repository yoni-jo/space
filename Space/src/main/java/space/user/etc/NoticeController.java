package space.user.etc;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminNoticeService;
import space.common.common.CommandMap;

@Controller
public class NoticeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value="/etc/noticeList")
	public ModelAndView AdminNoticeList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("noticeList");
		
		return mv;
	}
	
	@RequestMapping(value="/etc/selectnoticeList")
	public ModelAndView AdminSelectNoticeList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = noticeService.selectNoticeList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
		
	@RequestMapping(value="/etc/noticeDetail")
	public ModelAndView AdminNoticeDetail(CommandMap commandMap) 
		throws Exception{
		ModelAndView mv = new ModelAndView("/etc/noticeDetail");
		
		Map<String, Object> map = noticeService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
}
