package space.user.join;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
public class joinController {

	private static final String sendEmailId = null;

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService")
	private JoinService joinService;	

	@RequestMapping(value="/join/joinForm")
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("/join/joinForm");
		return mav;
	}
	
	//가입
	@RequestMapping(value="/join/signUp")
	 public ModelAndView signUp(CommandMap commandMap) throws Exception {
	  joinService.insertUserData(commandMap.getMap());	  
	 
	  ModelAndView mav = new ModelAndView("/join/signUpComplete"); //  메인 생기면 메인 경로로 변경할것
	  mav.addObject("msg", "정상적으로 회원가입이 되었습니다.");
	  
	  return mav;
	}
	//아이디 중복체크
	@RequestMapping(value="/join/idCheck")
	@ResponseBody
	 public int checkUserID(CommandMap commandMap) throws Exception {
	 
	  int checkResult = joinService.selectUserID(commandMap.getMap());
	 
	  return checkResult;
	 }
	
    //이메일 인증-회원가입
    @RequestMapping(value = "/join/auth", produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String user_email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "<공간> 회원가입 인증 코드입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return joinService.send(subject, sb.toString(), "webProjectTeam2@gmail.com", user_email, null);
    }
    
    @RequestMapping(value = "/join/authCheck", produces = "application/json")
    @ResponseBody
    public ModelAndView emailAuth(HttpSession session, @RequestParam String joinCode) {
    	ModelAndView mav = new ModelAndView("jsonView");
    	String originalJoinCode = (String)session.getAttribute("joinCode");
    	log.debug("originalJoinCode >>>>"+originalJoinCode +" & "+joinCode);
    	if(originalJoinCode.equals(joinCode)) mav.addObject("result","complete");
    	else mav.addObject("result","fail");
    	
    	return mav;
    }
	
	

}