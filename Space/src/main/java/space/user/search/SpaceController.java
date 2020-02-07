package space.user.search;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
@SessionAttributes
public class SpaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private SpaceService spaceService;
	
	@RequestMapping("/space/SpaceList")
	private ModelAndView selectSpaceList(CommandMap map, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("main/main");
		
		if(session.getAttribute("USER_ID") != null) 
			map.put("USER_ID", session.getAttribute("USER_ID"));
		
		Map<String,Object> tempMap = spaceService.selectSpaceList(map.getMap());
		List<Map<String,Object>> list=(List<Map<String,Object>>)tempMap.get("SPACE_LIST");
		List<String> favList = (List<String>)tempMap.get("FAVORI_LIST");
		
		mav.addObject("SPACE_LIST", list);
		mav.addObject("FAVORI_LIST",favList);
		mav.addObject("SEARCH_TYPE",map.get("SEARCH_TYPE"));
		
		return mav;
	}
	
	@RequestMapping("/space/SearchList")
	private ModelAndView selectSearchList(CommandMap map, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("main/spaceList");
		
		if(session.getAttribute("USER_ID") != null) 
			map.put("USER_ID", session.getAttribute("USER_ID"));
		
		if (map.get("START_DATE") == null) {
			map.put("START_DATE", "2020-02-01");
			map.put("END_DATE", "2020-02-01");
		}
		String start = (String)map.get("START_DATE");
		String end =(String)map.get("END_DATE");
		List<String> dowList = toDAY_OF_WEEK(start,end);
		/*
		 * map.put("TITLE","1"); map.put("POS", "����3��");
		 */
		map.put("DAY_LIST", dowList);
		
		Map<String,Object> tempMap = spaceService.selectSearchList(map.getMap());
		List<Map<String,Object>> list=(List<Map<String,Object>>)tempMap.get("SPACE_LIST");
		List<String> favList = (List<String>)tempMap.get("FAVORI_LIST");
		if(favList == null) {
			favList = Collections.emptyList();
		}
		/*
		 * for(String str : favList) { log.debug("-------------------favList > " +
		 * str+"-------------------");
		 * 
		 * } Iterator<Map<String,Object>> i = list.iterator(); Map<String,Object> m =
		 * new HashMap<String,Object>(); Set<String> key; String str="";
		 * while(i.hasNext()) { str=""; m=i.next(); key = m.keySet(); for(String k :
		 * key) { str +=m.get(k)+",";
		 * 
		 * } log.debug(key + " >>> "+str+"---------------------------------------"); }
		 */
		
		mav.addObject("START_DATE", map.get("START_DATE"));
		mav.addObject("END_DATE", map.get("END_DATE"));
		mav.addObject("SPACE_LIST" , list);
		mav.addObject("FAVORI_LIST" , favList);
		mav.addObject("USE",map.get("USE"));
		mav.addObject("SIZE",map.get("SIZE"));
		mav.addObject("POS",map.get("POS"));
		mav.addObject("SEARCH_TYPE",map.get("SEARCH_TYPE"));
		
		return mav;
	}
	
	@RequestMapping("/space/detailSpace")
	private ModelAndView selectDetailSpace(CommandMap map) throws Exception{
		ModelAndView mav = new ModelAndView("main/spaceDetail");
		Map<String,Object> spaceMap = spaceService.selectDetailSpace(map.getMap());
		
		if (spaceMap.get("DETAIL") != null) {
			Map<String, Object> temp = (Map<String, Object>) spaceMap.get("DETAIL");

			Set<String> sKey = temp.keySet();
			log.debug("==========================DETAIL LIST=====================================");
			for (String s : sKey) {
				/*
				 * log.debug(s + " >>> " + temp.get(s) +
				 * "---------------------------------------");
				 */
				if(s.equals("SPACE_TAG")) mav.addObject("TAG",divisionString("#",(String)temp.get(s)));
				else if(s.equals("SPACE_OPT")) mav.addObject("OPT",divisionString("/",(String)temp.get(s)));
				else if(s.equals("SPACE_USE")) mav.addObject("USE",divisionString("/",(String)temp.get(s)));
				else if(s.equals("SPACE_IMG")) mav.addObject("IMG",divisionString(",",(String)temp.get(s)));
			}
			log.debug("==========================DETAIL LIST END=====================================");
			mav.addObject("DETAIL",temp);
		}
		List<Map<String, Object>> list = (List<Map<String, Object>>) spaceMap.get("RES_LIST");
		mav.addObject("RES_LIST",list);
		return mav;
		
	}
	
	@RequestMapping("/space/updateFavori")
	private ModelAndView updateFovoriSpace(CommandMap map, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView("jsonView");
		String id;
		if(session.getAttribute("USER_ID") != null) {
			id=(String)session.getAttribute("USER_ID");
			map.put("USER_ID", session.getAttribute("USER_ID"));
			List<String> list = spaceService.updateFavoriSpace(map.getMap());
			
			mav.addObject("favList",list);
			mav.addObject("USER_ID",id);
		}
		return mav;
	}
	
	@RequestMapping("/space/SpacePostList")
	private ModelAndView getSpacePostList(CommandMap map) throws Exception {
		ModelAndView mav=new ModelAndView("jsonView");
		String type=(String)map.get("TYPE");
		List<Map<String,Object>> list;
		
		if(type.equals("QNA_LIST")) {
			list = spaceService.selectQnAList(map.getMap());
		}else if(type.equals("REPLY_LIST")){
			list = spaceService.selectReplyList(map.getMap());
		}else list = Collections.emptyList();
		
		log.debug(type);
		
		if(list.size()>0) {mav.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));}
		else {mav.addObject("TOTAL", 0);}
		
		mav.addObject("TYPE",type);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/space/writeQnA")
	private ModelAndView writeQnAPost(CommandMap map) throws Exception{
		ModelAndView mav= new ModelAndView("redirect:/space/detailSpace");
		spaceService.writeQnAPost(map.getMap());
		
		mav.addObject("SPACE_ID",map.get("SPACE_ID"));
		return mav;
	}
	
	@RequestMapping("/space/writeReply")
	private ModelAndView writeReplyPost(CommandMap map) throws Exception{
		ModelAndView mav= new ModelAndView("redirect:/space/detailSpace");
		spaceService.writeReplyPost(map.getMap());
		
		mav.addObject("SPACE_ID",map.get("SPACE_ID"));
		return mav;
	}
	
	@RequestMapping("/dd")
	public String test() {
		return "index";
	}
	
	
	private List<String> divisionString(String div,String str){
		String[] strArr = str.split(div);
		List<String> arrList = new ArrayList<String>();
		log.debug("[ ���ڿ� ]" +str+" [ ������ ] "+div);
		for(String s:strArr) {
			log.debug(">>>>>>>>>>>>>>>>  "+s);
			arrList.add(s);
		}
		return arrList;
		
	}
	
	private List<String> toDAY_OF_WEEK(String start,String end) throws Exception{
		List<String> list = new ArrayList<String>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=dateFormat.parse(start);
		Date endDate=dateFormat.parse(end);
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(startDate);
		cal2.setTime(endDate);

		int sDayNum = 0;
		while(true) {
			if(cal1.compareTo(cal2) == 1 || sDayNum == 7) {
				break;
			}
			list.add(insertDayOfWeek(cal1.get(Calendar.DAY_OF_WEEK)));
			sDayNum++;
			cal1.add(Calendar.DATE, 1);
		}
		
		return list;
	}

	private String insertDayOfWeek(int num) {
		String day = null;
		switch (num) {
		case Calendar.SUNDAY:
			day = "SRES_SUN";
			break;
		case Calendar.MONDAY:
			day = "SRES_MON";
			break;
		case Calendar.TUESDAY:
			day = "SRES_TUE";
			break;
		case Calendar.WEDNESDAY:
			day = "SRES_WED";
			break;
		case Calendar.THURSDAY:
			day = "SRES_THU";
			break;
		case Calendar.FRIDAY:
			day = "SRES_FRI";
			break;
		case Calendar.SATURDAY:
			day = "SRES_SAT";
			break;

		}
		return day;
	}
}
