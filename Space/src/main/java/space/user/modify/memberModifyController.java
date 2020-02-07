package space.user.modify;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;
import space.user.member.MemberDAO;
import space.user.member.MemberDeleteDAO;
import space.user.member.ModifyCheckDAO;

@Controller
public class memberModifyController {
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

		
		//탈퇴하기
		@Resource
		private MemberDeleteDAO memberDeleteDAO;
		
		@RequestMapping(value = "/member/memberDelete")
		public ModelAndView delete(CommandMap commandMap,HttpSession session) throws Exception {
			commandMap.put("USER_ID", session.getAttribute("USER_ID"));

			memberDeleteDAO.memberDelete(commandMap.getMap());
			// 보여지는 화면;
			ModelAndView mv = new ModelAndView("main");
			//세션 아이디랑 비번 삭제 
			session.invalidate();
			return mv;

		}

}
