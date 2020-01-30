package space.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
public class adminReqController {
	
	@RequestMapping("admin/reqList")
	public ModelAndView AdminReqList(CommandMap commandMap,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/reqList");
		return mv;
	}

}
