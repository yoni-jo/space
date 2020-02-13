package space.user.login;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import space.common.common.CommandMap;
import space.main.service.JoinService;


@Controller
public class loginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService")
	private JoinService joinService;
	@Resource(name = "loginService")
	private LoginService loginService;
	
//	로그인 폼

	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)

	public ModelAndView Login(CommandMap commandMap) throws Exception {
		// 로그인뷰화면
		ModelAndView mv = new ModelAndView("loginForm");

		return mv;

	}

	// 로그인 성공 or 실패시
	@Resource
	private LoginDAO LoginDAO;

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public ModelAndView LoginProc(CommandMap commandMap, HttpSession session) throws Exception {
		// 로그인했을때 전달받을 주소값
		ModelAndView mv = new ModelAndView();
		String id = (String) commandMap.get("USER_ID");
		String db = LoginDAO.findMember(commandMap.getMap());
		// 로그인 실패
		if (db == null) {
			mv.setViewName("loginForm");

			// 로그인 성공
		} else {
			mv.setViewName("redirect:/main");
			session.setAttribute("USER_ID", id);

		}

		log.debug(commandMap);

		return mv;

	}

	// 로그아웃
	@RequestMapping(value = "/login/logout")

	public ModelAndView Logout(HttpSession session) throws Exception {
		// 로그인뷰화면
		ModelAndView mv = new ModelAndView("redirect:/main");

		// 로그인세션삭제

		session.invalidate();

		return mv;

	}

  // 아이디 비번찾기 페이지
	@RequestMapping(value = "/login/findIdPwd")
	public ModelAndView findIdPwd(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("login/findIdPwd");
		
		if(commandMap.get("resultMsg")!=null) {
			mav.addObject("resultMsg",commandMap.get("resultMsg"));
		}
		
		
		return mav;
	}	
	
	
 
 // 아이디 찾기  
  @RequestMapping(value = "/login/findId", method = RequestMethod.POST)
  public String sendMailId(HttpSession session, CommandMap map, RedirectAttributes ra) {
	  String user = loginService.findAccount(map.getMap()); 
	  String email = (String)map.get("user_email");
	  if (user != null) {
		  String subject = "아이디 찾기 안내 입니다."; 
		  StringBuilder sb = new  StringBuilder(); 
		  sb.append("귀하의 아이디는 " + user + " 입니다.");
	  	  joinService.send(subject, sb.toString(), "webProjectTeam2@gmail.com", email, null); 
	  	  ra.addFlashAttribute("resultMsg", "이메일로 가입하신 아이디를 발송했습니다."); 
	  } else {
		  ra.addFlashAttribute("resultMsg", "해당 이메일로 가입된 아이디가 존재하지 않습니다."); 
	  } 
	  return "redirect:/login/findIdPwd"; //메인페이지로 추후 수정 
   }  
  
  
  // 비밀번호 찾기
  @RequestMapping(value = "/login/findPwd", method = RequestMethod.POST)
  public String sendMailPassword(HttpSession session, CommandMap map, RedirectAttributes ra) {
	  String email = (String)map.get("user_email");
	  String user = loginService.findPwd(map.getMap()); 
      if (user == null) {
			  ra.addFlashAttribute("resultMsg", "입력하신 아이디와 이메일이 일치하지 않습니다."); 
			  return  "redirect:/login/findIdPwd"; //메인페이지로 추후 수정 
		  } 
          int ran = new Random().nextInt(100000) + 10000;
          String password = String.valueOf(ran);
          
          map.put("password", password);
          loginService.updateInfo(map.getMap()); 

          String subject = "<공간>임시 비밀번호입니다."; 
		  StringBuilder sb = new  StringBuilder();
		  sb.append("귀하의 임시 비밀번호는 " + password + " 입니다. 로그인 후 패스워드를 변경해 주세요.");
		  joinService.send(subject, sb.toString(), "webProjectTeam2@gmail.com",  email, null); 
		  ra.addFlashAttribute("resultMsg", "이메일로 임시 비밀번호를 발송했습니다.");  
	   
	  return "redirect:/login/findIdPwd"; 

  }   
  
  
  
}
 


