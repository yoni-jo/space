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
	// �젙蹂댁닔�젙 �뤌

		@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.GET)
		public ModelAndView pwdCheck(CommandMap commandMap) throws Exception {
			// 蹂댁뿬吏��뒗 �솕硫�;
			ModelAndView mv = new ModelAndView("pwdcheck");
			return mv;

		}

		// �젙蹂댁닔�젙 �뤌�뿉�꽌 �뙣�뒪�썙�뱶媛� 留욎쓣寃쎌슦 or ��由닿꼍�슦
		@Resource
		private ModifyCheckDAO modifyDAO;

		@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.POST)
		public ModelAndView select(CommandMap commandMap,HttpSession session) throws Exception {
			
			//蹂댁뿬吏덊럹�씠吏�
			ModelAndView mv = new ModelAndView();
			String alert="";
			String id = (String) session.getAttribute("USER_ID");//�꽭�뀡�뿉 ���옣�맂 ID媛�
			commandMap.put("USER_ID", id);
			//�엯�젰�븳 鍮꾨쾲怨� �꽭�뀡�뿉 �븘�씠�뵒媛� �쓣 �씠�슜�빐�꽌 DB�뿉 id媛믪갼湲�
			String pw =(String)modifyDAO.pwdcheck(commandMap.getMap(),"USER_ID");
			Map<String, Object> MemberInfo;//怨좉컼�젙蹂대텋�윭�삤湲�
			
			//鍮꾨쾲�씠 �씪移섑븷寃쎌슦 ->�젙蹂댁닔�젙�쑝濡�
			if(id.equals(pw)) {
				
				mv.setViewName("modify");
				MemberInfo=modifyDAO.selectInfo(id);
				mv.addObject("MemberInfo",MemberInfo);
						
				
				
				//�씪移섑븯吏��븡�쓣寃쎌슦->�럹�씠吏��쑀吏�
			}else{
				alert="�뙣�뒪�썙�뱶瑜� �옒紐살엯�젰�븯���뒿�땲�떎.";
				mv.addObject("alert",alert);
				mv.setViewName("pwdcheck");
			}
			return mv;
		}
			
		//�젙蹂댁닔�젙
		@Resource
		private MemberDAO memberDAO;
		@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST)
		public ModelAndView modify(CommandMap commandMap,HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			//�뙣�뒪�썙�뱶泥댄겕 �궘�젣
		commandMap.remove("pwdcheck");
		
		//�쉶�썝�븘�씠�뵒�젙蹂� �벑濡�
		commandMap.put("USER_ID",session.getAttribute("USER_ID"));
			/*
			 * System.out.println(commandMap.get("USER_PASSWORD"));
			 */
		
			//�닔�젙�븷 媛�
			memberDAO.updateDB(commandMap.getMap());
			
			
			mv.setViewName("redirect:/main");
			// 蹂댁뿬吏��뒗 �솕硫�;
			
			return mv;
					
			
				
			}

		
		//�깉�눜�븯湲�
		@Resource
		private MemberDeleteDAO memberDeleteDAO;
		
		@RequestMapping(value = "/member/memberDelete")
		public ModelAndView delete(CommandMap commandMap,HttpSession session) throws Exception {
			commandMap.put("USER_ID", session.getAttribute("USER_ID"));

			memberDeleteDAO.memberDelete(commandMap.getMap());
			// 蹂댁뿬吏��뒗 �솕硫�;
			ModelAndView mv = new ModelAndView("main");
			//�꽭�뀡 �븘�씠�뵒�옉 鍮꾨쾲 �궘�젣 
			session.invalidate();
			return mv;

		}

}
