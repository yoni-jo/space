package space.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import space.admin.service.AdminResService;
import space.common.common.CommandMap;

@Controller
public class adminResController {
	
	Logger log = Logger.getLogger(this.getClass());
 
	@Resource(name="AdminResService")
	private AdminResService adminResService;
	
	@RequestMapping(value="/admin/memberResList")
    public ModelAndView memberResList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/memberResList");
    	
    	List<Map<String,Object>> list = adminResService.selectAdminResList(commandMap.getMap());
    	mv.addObject("list", list);
    	log.debug(list.get(0).get("USER_ID"));
    	return mv;
    }
}