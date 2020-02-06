package space.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import space.common.common.CommandMap;
import space.main.service.ReserveService;

@Controller
public class ReserveController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private ReserveService reserveService;
	
	@RequestMapping("/res/resPay")
	private ModelAndView getPayInfo(CommandMap map,HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("res/resPayPage");
		Map<String,Object> spaceInfo;
		Map<String,Object> userInfo;
		
		String resNum=createResNum(map);
		
		String id = (String)session.getAttribute("USER_ID");
		map.put("USER_ID", id);
		
		spaceInfo = reserveService.getSpaceInfo(map.getMap());
		userInfo = reserveService.getUserInfo(map.getMap());
		
		mav.addObject("SPACE_INFO",spaceInfo);
		mav.addObject("USER_INFO",userInfo);
		mav.addObject("RES_NUM",resNum);
		mav.addObject("RES_TIME",map.get("RES_TIME"));
		mav.addObject("RES_PRI",map.get("RES_PRI"));
		return mav;
	}
	
	@RequestMapping("/res/insertresInfo")
	private ModelAndView resfinish(CommandMap map, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("res/next");
		
		String date = formatDate((String)map.get("RES_APPLY_DATE"));
		String userId = (String)session.getAttribute("USER_ID");
		map.put("USER_ID", userId);
		map.put("RES_APPLY_DATE", date);
		reserveService.insertResInfo(map.getMap());
		
		mav.addObject("TYPE",map.get("RES_REQ"));
		mav.addObject("PRI",map.get("RES_PRI"));
		mav.addObject("PAY_DATE",nextDate());
		return mav;
	}
	@RequestMapping("/res/resPayInfo")
	private ModelAndView payInfoView(CommandMap map) {
		ModelAndView mav = new ModelAndView("res/resFinish");
		
		mav.addObject("TYPE",map.get("TYPE"));
		mav.addObject("PRI",map.get("PRI"));
		mav.addObject("PAY_DATE",map.get("PAY_DATE"));
		return mav;
	}
	
	
	private String createResNum(CommandMap map) throws Exception{
		String[] time = ((String)map.get("RES_TIME")).split("-");
		String spaceId = (String)map.get("SPACE_ID");
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int day = cal.get(Calendar.DAY_OF_WEEK);
		
		String resNum=time[0]+""+spaceId+""+time[1]+""+day+""+time[2];
		log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+resNum);
		String temp="";
		for(int i = resNum.length()-1;i>=0;i--) {
			temp += resNum.charAt(i);
		}
		resNum = temp;
		log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+resNum);
		return resNum;
	}
	private String formatDate(String str) throws Exception {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy³â MM¿ù ddÀÏ");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = format1.parse(str);
		return format2.format(date);
	}
	private Date nextDate() {
		Calendar cal =Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 1);
		return cal.getTime();
	}
}
