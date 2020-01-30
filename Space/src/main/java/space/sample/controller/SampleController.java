package space.sample.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
//메인
	@RequestMapping(value = "/testmain")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		log.debug("오류");
		return mv;
	}
//	로그인
	@RequestMapping(value = "/login/loginForm")
	public ModelAndView openSampleList2(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");

		log.debug("오류");
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
