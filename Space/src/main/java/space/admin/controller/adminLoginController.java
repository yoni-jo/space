package space.admin.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import space.admin.dao.AdminLoginDAO;
import space.admin.service.AdminLoginService;
import space.common.common.CommandMap;
import space.common.dao.AbstractDAO;

@Controller
public class adminLoginController {
    protected Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="AdminLoginService")
    private AdminLoginService adminLoginService;
    
    @RequestMapping("admin/AdminLogin")
    public ModelAndView AdminLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("admin/LoginForm");
        
        return mv;
    }

    @RequestMapping(value="admin/LoginCheck", method=RequestMethod.POST)
    public ModelAndView LoginCheck(CommandMap commandMap, HttpSession session) throws Exception{
        ModelAndView mv = new ModelAndView();
        String id = (String) commandMap.get("USER_ID");
        log.debug(commandMap.get("USER_ID"));
        log.debug(commandMap.get("USER_PASSWORD"));
        Map<String, Object> login = adminLoginService.selectUserInfo(commandMap.getMap());
        
        if(login == null) {
            session.setAttribute("USER_ID",login.get("USER_ID") );
            session.setAttribute("ADMIN",true );
            mv.setViewName("admin/LoginForm");
        }else {
            
            mv.setViewName("admin/adminMain");
        }
        
        
        return mv;
}
    @RequestMapping("admin/LogOut")
    public ModelAndView LogOut(HttpSession session) throws Exception{
        
        session.invalidate();
        ModelAndView mv = new ModelAndView("admin/LoginForm");
        return mv;
    }
    }
