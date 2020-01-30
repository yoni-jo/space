package space.main.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
public class adminLoginController {
	
	
	@RequestMapping("admin/LoginForm")
	public ModelAndView adminLoginForm(CommandMap commandMap, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin/LoginForm");
		return mv;
	}
	

	
	
	
	
	

}
