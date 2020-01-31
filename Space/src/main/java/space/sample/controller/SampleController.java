package space.sample.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.join.DAO.JoinDAO;
import space.login.DAO.LoginDAO;

@Controller
public class SampleController {
	@Resource
	private JoinDAO joinDAO;
	
	Logger log = Logger.getLogger(this.getClass());
//메인
	@RequestMapping(value = "/main")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");
	
		log.debug("오류");
		return mv;
	}
//	로그인
	
	@Resource
	private LoginDAO LoginDAO;
	
	@RequestMapping(value = "/login/loginForm")
	public ModelAndView openSampleList2(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		commandMap.put(" USER_ID","ssss");
		commandMap.put(" USER_PASSWORD","ssss");
		Map<String,Object> map = LoginDAO.findMember(commandMap);
		
	
		log.debug(map.get("USER_ID"));
		
		return mv;
	}
	
//	아이디/비밀번호찾기
	@RequestMapping(value = "/login/findIdPwd")
	public ModelAndView openSampleList4(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findIdPwd");

		log.debug("오류");
		return mv;
	}
	//회원가입
	@RequestMapping(value = "/join/joinForm")
	public ModelAndView openSampleList3(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("joinForm");

		log.debug("오류");
		return mv;
	}

	
	
	  //정보수정 패스워드확인
	  
	  @RequestMapping(value = "/member/MemberPwdCheck") public ModelAndView
	  openSampleList5(Map<String, Object> commandMap) throws Exception {
	  ModelAndView mv = new ModelAndView("modifyform");
	 
	  log.debug("오류"); 
	  return mv; 
	  }
	 
	  @RequestMapping(value = "/member/MemberModifyForm") public ModelAndView
	  openSampleList6(Map<String, Object> commandMap) throws Exception {
	  ModelAndView mv = new ModelAndView("modifyform");
	 
	  log.debug("오류"); 
	  return mv; 
	  }
	 

}
