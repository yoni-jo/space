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
import space.modify.DAO.ModifyDAO;
import space.user.login.LoginDAO;

@Controller
public class SampleController {

	Logger log = Logger.getLogger(this.getClass());

//硫붿씤�뤌
	@RequestMapping(value = "/main")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
//	濡쒓렇�씤 �뤌

	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)

	public ModelAndView Login(CommandMap commandMap) throws Exception {
		// 濡쒓렇�씤酉고솕硫�
		ModelAndView mv = new ModelAndView("loginForm");

		return mv;

	}

	// 濡쒓렇�씤 �꽦怨� or �떎�뙣�떆
	@Resource
	private LoginDAO LoginDAO;

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public ModelAndView LoginProc(CommandMap commandMap, HttpSession session) throws Exception {
		// 濡쒓렇�씤�뻽�쓣�븣 �쟾�떖諛쏆쓣 二쇱냼媛�
		ModelAndView mv = new ModelAndView();
		String id = (String) commandMap.get("USER_ID");
		String db = LoginDAO.findMember(commandMap.getMap());
		// 濡쒓렇�씤 �떎�뙣
		if (db == null) {

			String alert = "濡쒓렇�씤�뿉 �떎�뙣�븯���뒿�땲�떎.";
			mv.addObject("alert", alert);
			mv.setViewName("loginForm");

			// 濡쒓렇�씤 �꽦怨�
		} else {
			String alert = "濡쒓렇�씤�뿉 �꽦怨듯븯���뒿�땲�떎.";
			mv.addObject("alert", alert);
			mv.setViewName("main");
			session.setAttribute("USER_ID", id);

		}

		log.debug(commandMap);

		return mv;

	}

	// 濡쒓렇�븘�썐
	@RequestMapping(value = "/login/logout")

	public ModelAndView Logout(HttpSession session) throws Exception {
		// 濡쒓렇�씤�꽭�뀡�궘�젣
		session.invalidate();
		// 濡쒓렇�씤酉고솕硫�
		ModelAndView mv = new ModelAndView("main");

		return mv;

	}
	// 濡쒓렇�씤�걹

//	�븘�씠�뵒/鍮꾨�踰덊샇李얘린
	@RequestMapping(value = "/login/findIdPwd")
	public ModelAndView openSampleList4(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findIdPwd");

		log.debug("�삤瑜�");
		return mv;
	}

	/*
	 * // �쉶�썝媛��엯
	 * 
	 * @RequestMapping(value = "/join/joinForm") public ModelAndView
	 * openSampleList3(Map<String, Object> commandMap) throws Exception {
	 * ModelAndView mv = new ModelAndView("joinForm");
	 * 
	 * log.debug("�삤瑜�"); return mv; }
	 */
	// �젙蹂댁닔�젙 �뤌

	@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.GET)
	public ModelAndView pwdCheck(CommandMap commandMap) throws Exception {
		// 蹂댁뿬吏��뒗 �솕硫�;
		ModelAndView mv = new ModelAndView("pwdcheck");
		return mv;
		
		
		
	}

	// �젙蹂댁닔�젙 �뤌�뿉�꽌 �뙣�뒪�썙�뱶媛� 留욎쓣寃쎌슦 or ��由닿꼍�슦

	@Resource
	private ModifyDAO modifyDAO;
	
	@RequestMapping(value = "/member/MemberModifyForm", method = RequestMethod.POST)
	public ModelAndView select(CommandMap commandMap,HttpSession session) throws Exception {
		
		//蹂댁뿬吏덊럹�씠吏�
		ModelAndView mv = new ModelAndView();
		String alert="";
		String id = (String) session.getAttribute("USER_ID");//�꽭�뀡�뿉 ���옣�맂 ID媛�
		commandMap.put("USER_ID", id);
		String pw =(String)modifyDAO.pwdcheck(commandMap.getMap(),"USER_ID");//�엯�젰�븳 鍮꾨쾲怨� �꽭�뀡�뿉 �븘�씠�뵒媛� �쓣 �씠�슜�빐�꽌 DB�뿉 id媛믪갼湲�
		Map<String, Object> MemberInfo;//怨좉컼�젙蹂대텋�윭�삤湲�
	
		System.out.println(pw);
		//鍮꾨쾲�씠 �씪移섑븷寃쎌슦
		if(id.equals(pw)) {
			
			mv.setViewName("modify");
			MemberInfo=modifyDAO.selectInfo(id);

			mv.addObject("MemberInfo",MemberInfo);
			System.out.println(MemberInfo);
			//�씪移섑븯吏��븡�쓣寃쎌슦
		}else{
			alert="�뙣�뒪�썙�뱶瑜� �옒紐살엯�젰�븯���뒿�땲�떎.";
			mv.addObject("alert",alert);
			mv.setViewName("pwdcheck");
		}
		return mv;
		
		
		
	}

}
