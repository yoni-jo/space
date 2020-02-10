package space.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminMemberService;
import space.common.common.CommandMap;


@Controller
public class adminMemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/memberList")
    public ModelAndView memberList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/memberList");
    	
    	return mv;
    }
	
	@RequestMapping(value="admin/selectmemberList")
	public ModelAndView AdminSelectMemberList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
}