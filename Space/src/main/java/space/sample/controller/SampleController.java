package space.sample.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;
import space.user.login.LoginDAO;
import space.user.member.MemberDAO;
import space.user.member.ModifyCheckDAO;

@Controller
public class SampleController {

	Logger log = Logger.getLogger(this.getClass());

//메인폼
	@RequestMapping(value = "/main")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
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

			String alert = "로그인에 실패하였습니다.";
			mv.addObject("alert", alert);
			mv.setViewName("loginForm");

			// 로그인 성공
		} else {
			String alert = "로그인에 성공하였습니다.";
			mv.addObject("alert", alert);
			mv.setViewName("main");
			session.setAttribute("USER_ID", id);

		}

		log.debug(commandMap);

		return mv;

	}

	// 로그아웃
	@RequestMapping(value = "/login/logout")

	public ModelAndView Logout(HttpSession session) throws Exception {
		// 로그인뷰화면
		ModelAndView mv = new ModelAndView("main");

		// 로그인세션삭제

		session.invalidate();

		return mv;

	}
	// 로그인끝

//	아이디/비밀번호찾기
	@RequestMapping(value = "/login/findIdPwd")
	public ModelAndView openSampleList4(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findIdPwd");

		log.debug("오류");
		return mv;
	}

	/*
	 * // 회원가입
	 * 
	 * @RequestMapping(value = "/join/joinForm") public ModelAndView
	 * openSampleList3(Map<String, Object> commandMap) throws Exception {
	 * ModelAndView mv = new ModelAndView("joinForm");
	 * 
	 * log.debug("오류"); return mv; }
	 */

	// 정보수정 폼

	@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.GET)
	public ModelAndView pwdCheck(CommandMap commandMap) throws Exception {
		// 보여지는 화면;
		ModelAndView mv = new ModelAndView("pwdcheck");
		return mv;

	}

	// 정보수정 폼에서 패스워드가 맞을경우 or 틀릴경우
	@Resource
	private ModifyCheckDAO modifyDAO;

	@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.POST)
	public ModelAndView select(CommandMap commandMap,HttpSession session) throws Exception {
		
		//보여질페이지
		ModelAndView mv = new ModelAndView();
		String alert="";
		String id = (String) session.getAttribute("USER_ID");//세션에 저장된 ID값
		commandMap.put("USER_ID", id);
		//입력한 비번과 세션에 아이디값 을 이용해서 DB에 id값찾기
		String pw =(String)modifyDAO.pwdcheck(commandMap.getMap(),"USER_ID");
		Map<String, Object> MemberInfo;//고객정보불러오기
		
		//비번이 일치할경우 ->정보수정으로
		if(id.equals(pw)) {
			
			mv.setViewName("modify");
			MemberInfo=modifyDAO.selectInfo(id);
			mv.addObject("MemberInfo",MemberInfo);
					
			
			
			//일치하지않을경우->페이지유지
		}else{
			alert="패스워드를 잘못입력하였습니다.";
			mv.addObject("alert",alert);
			mv.setViewName("pwdcheck");
		}
		return mv;
	}
		
	//정보수정
	@Resource
	private MemberDAO memberDAO;
	@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST)
	public ModelAndView modify(CommandMap commandMap,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//패스워드체크 삭제
	commandMap.remove("pwdcheck");
	
	//회원아이디정보 등록
	commandMap.put("USER_ID",session.getAttribute("USER_ID"));
		/*
		 * System.out.println(commandMap.get("USER_PASSWORD"));
		 */
	
		//수정할 값
		memberDAO.updateDB(commandMap.getMap());
		
		
		mv.setViewName("main");
		// 보여지는 화면;
		
		return mv;
				
		
			
		}

	
	
}
