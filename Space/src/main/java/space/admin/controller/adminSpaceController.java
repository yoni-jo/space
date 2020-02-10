package space.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.admin.service.AdminSpaceService;
import space.common.common.CommandMap;

@Controller
public class adminSpaceController {
	
	Logger log = Logger.getLogger(this.getClass());
 
	@Resource(name="AdminSpaceService")
	private AdminSpaceService adminSpaceService;
	
	@RequestMapping(value="/admin/spaceList")
    public ModelAndView spaceList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/spaceList");
    	
    	List<Map<String,Object>> list = adminSpaceService.selectspaceList(commandMap.getMap());
    	mv.addObject("list", list);
    	return mv;
    }
}