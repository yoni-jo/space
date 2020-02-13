package space.user.mySpace;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
@SessionAttributes
public class MySpaceController {

	Logger log=Logger.getLogger(this.getClass());
		
		@Resource(name = "mySpaceService")
		private MySpaceService mySpaceService;
		
		@Resource(name="uploadPath")
		String path;
		
		@RequestMapping(value="/mypage/myFavList")
		public ModelAndView favSpaceList(CommandMap commandMap,HttpSession session) throws Exception{
			ModelAndView mv=new ModelAndView("myFav");
			commandMap.put("USER_ID", "admin");
			
			List<Map<String,Object>> list = mySpaceService.selectFavList(commandMap.getMap());
			
			mv.addObject("LIKE_LIST",list);
			return mv;
		}
		
		@RequestMapping(value="/mypage/deleteFav")
		public ModelAndView updateFav(CommandMap map)throws Exception{
			
			ModelAndView mav = new ModelAndView("redirect:/mypage/myFavList");
			mySpaceService.deleteFav(map.getMap());
			//mySpaceService.updateFavCountDec(map.getMap());

			return mav;
		}
		
		//예약상황
	@RequestMapping("/mySpace/ResPage")
	public ModelAndView mySpaceResPage(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("mySpaceResList");
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectResDateList(map.getMap());
		
		mv.addObject("DATE_LIST",list);
		return mv;
	}
	@RequestMapping("/mySpace/ResList")
	public ModelAndView getResList(CommandMap map,HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		if(session.getAttribute("USER_ID") == null) {
			return new ModelAndView("redirect:/space/SpaceList");
		}
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.searchResSpaceList(map.getMap());
		
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/mySpace/spaceForm")
	public ModelAndView SpaceForm(CommandMap map) {
		ModelAndView mv = new ModelAndView("spaceForm");
		
		return mv;
	}
	@RequestMapping("/mySpace/SpaceFormSend")
	public ModelAndView SpaceFormSend(HttpServletRequest request, CommandMap map,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		String userId = (String) session.getAttribute("USER_ID");
		String spaceId = mySpaceService.selectSpaceId(map.getMap());
		String pri;
		String nowFile;
		map.put("USER_ID", userId);
		map.put("APPLY_NUM", spaceId);

		if (map.get("PRIVAL_LIST").equals("dateRequest")) {
			List<Map<String, String>> dateList = setTransformDate((String[]) map.get("DATE_LIST"));
			pri = dateList.get(0).get("RST");
			map.put("APPLY_DATE_LIST", dateList);
		} else {
			Map<String, String> dayMap = setTransformDay((String) map.get("PRIVAL_LIST"));
			pri = dayMap.get("RST");
			map.put("APPLY_DAY_LIST", dayMap);
		}

		map.put("APPLY_PRI", pri);

		nowFile=uploadImage(request,(String) map.get("APPLY_NUM"));
		map.put("APPLY_IMG",nowFile);

		mySpaceService.applySpaceBoard(map.getMap());

		return mv;
	}
	@RequestMapping("/mySpace/modifySpaceForm")
	public ModelAndView modifySpaceForm(CommandMap map) {
		ModelAndView mv = new ModelAndView("mySpace/modifySpaceForm");
		
		String modify; 
		if(map.get("TYPE").equals("COMP")) modify="Y";
		else modify="N";
		
		Map<String,Object> temp = mySpaceService.modifySpaceBoard(map.getMap());
		mv.addObject("list",temp);
		mv.addObject("modifyMode",modify);
		return mv;
	}
	@RequestMapping("/mySpace/getResData")
	public ModelAndView getResData(CommandMap map) {
		ModelAndView mv = new ModelAndView("jsonView");
		String type=(String)map.get("TYPE");
		Object temp=null;
		
		if(type.equals("DATE")) {
			temp=mySpaceService.getResDate(map.getMap());
		}else if(type.equals("DAY")) {
			temp=mySpaceService.getResDay(map.getMap());
		}
		
		mv.addObject("resData",temp);
		return mv;
	}
	@RequestMapping("/mySpace/modifyFormSend")
	public ModelAndView applyModifySpace(HttpServletRequest request, CommandMap map, HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");

		String userId = (String) session.getAttribute("USER_ID");
		String pri;
		String oldFile = (String)map.get("OLD_IMG");
		String nowFile;
		map.put("USER_ID", userId);

		if (map.get("PRIVAL_LIST").equals("dateRequest")) {
			List<Map<String, String>> dateList = setTransformDate((String[]) map.get("DATE_LIST"));
			pri = dateList.get(0).get("RST");
			map.put("APPLY_DATE_LIST", dateList);
		} else {
			Map<String, String> dayMap = setTransformDay((String) map.get("PRIVAL_LIST"));
			pri = dayMap.get("RST");
			map.put("APPLY_DAY_LIST", dayMap);
		}

		map.put("APPLY_PRI", pri);

		deleteImage((String) map.get("APPLY_NUM"),(String) map.get("DEL_IMG"));
		nowFile=uploadImage(request,(String) map.get("APPLY_NUM"));
		if(oldFile!=null) {
			if(nowFile.equals("")) nowFile = oldFile;
			else nowFile = oldFile+","+nowFile;
		}
		map.put("APPLY_IMG",nowFile);

		mySpaceService.applyModifySpaceBoard(map.getMap());

		return mv;
	}

	@RequestMapping("/mySpace/SpaceControl")
	public ModelAndView mySpaceControlView(CommandMap map) {
		ModelAndView mav = new ModelAndView("controlList");
		
		return mav;
	}
	@RequestMapping("/mySpace/getSpaceList")
	public ModelAndView getSpaceList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMySpaceList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping("/mySpace/deleteSpace")
	public ModelAndView deleteSpaceList(CommandMap map) {
		ModelAndView mv = new ModelAndView("alert/alertPage");
		int result;
		result=mySpaceService.deleteSpaceBoard(map.getMap());
		if(result == MySpaceDao.ERR_RES_LIST) {
			mv.addObject("MESSAGE","해당 공간에 잡혀있는 예약이 있습니다.");
		}else {
			mv.addObject("MESSAGE","삭제되었습니다.");
		}
		
		return mv;
	}
	@RequestMapping("/mySpace/holdSpace")
	public ModelAndView holdSpaceList(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.holdSpaceBoard(map.getMap());
		
		return mv;
	}
	
	
	@RequestMapping("/mySpace/getQnAList")
	public ModelAndView getQnAList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMyQnAList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		
		return mv;
	}
	@RequestMapping("/mySpace/QnAcomment")
	public ModelAndView insertQnAcomment(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.spaceQNAComment(map.getMap());
		
		return mv;
	}
	
	@RequestMapping("/mySpace/deleteQnA")
	public ModelAndView deleteQnAcomment(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.deleteQNAComment(map.getMap());
		
		return mv;
	}
	@RequestMapping("/mySpace/getReplyList")
	public ModelAndView getReplyList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMyReplyList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		
		return mv;
	}
	@RequestMapping("mySpace/deleteReply")
	public ModelAndView deleteReply(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.deleteReply(map.getMap());
		
		return mv;
	}
	

	private List<Map<String,Object>> textReplace(List<Map<String,Object>> list,String type) {
		String temp;
		
		for(int i = 0;i<list.size();i++) {
			temp = (String)list.get(i).get(type);
			temp = temp.replace("\r\n", "<br>");
			list.get(i).put("type", temp);
			if(type.equals("QNA_CNT")&&list.get(i).get("QNA_CMT")!=null) {
				temp = (String)list.get(i).get("QNA_CMT");
				temp = temp.replace("\r\n", "<br>");
				list.get(i).put("QNA_CMT", temp);
			}
		}
		
		return list;
		
	}
	private List<Map<String, String>> setTransformDate(String[] strArr) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> tempMap;
		String[] temp;
		int resultPri=0;
		for (String s : strArr) {
			temp = s.split("/");
			tempMap = new HashMap<String, String>();
			tempMap.put("DATE", temp[0]);
			tempMap.put("PRI", temp[1]);
			resultPri+=Integer.valueOf(tempMap.get("PRI"));
			list.add(tempMap);
		}
		list.get(0).put("RST", String.valueOf(Math.round(resultPri/strArr.length)));
		return list;
	}
	private Map<String,String> setTransformDay(String dayStr){
		Map<String, String> tempMap = new HashMap<String,String>();
		int resultPri = 0;
		int count=0;
		String [] sArr = dayStr.split(",");
		for(int i=0;i<sArr.length;i++) {
			switch(i) {
			case 0:
				tempMap.put("MON", sArr[i]);
				break;
			case 1:
				tempMap.put("TUE", sArr[i]);
				break;
			case 2:
				tempMap.put("WED", sArr[i]);
				break;
			case 3:
				tempMap.put("THU", sArr[i]);
				break;
			case 4:
				tempMap.put("FRI", sArr[i]);
				break;
			case 5:
				tempMap.put("SAT", sArr[i]);
				break;
			case 6:
				tempMap.put("SUN", sArr[i]);
				break;
			}
			if(Integer.valueOf(sArr[i])>0) count++;
			resultPri+=Integer.valueOf(sArr[i]);
		}
		
		tempMap.put("RST", String.valueOf(Math.round(resultPri/count)));
		log.info("RST : "+resultPri/count);
		return tempMap;
	}
	private void deleteImage(String id,String delName)throws Exception{
		if(delName == null) return;
		String[] str = delName.split(",");
		for(String fileName : str) {
			File target = new File(path,id+"_"+fileName);
			target.delete();
		}
	}
	private String uploadImage(HttpServletRequest request,String id) throws Exception {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		String savedName = null;
		String allSaveName="";
		String imagePath = request.getSession().getServletContext().getRealPath("")+"\\resources\\";
		Iterator<String> iter = multiRequest.getFileNames();
		log.debug("imagePath :"+ imagePath);
		MultipartFile files=null;
		while(iter.hasNext()) {
			files = multiRequest.getFile(iter.next());
			if(files.isEmpty()==false) {
				savedName = id+"_"+files.getOriginalFilename();			
		        File target = new File(imagePath, savedName);
		        if(target.exists()) {
		        	String temp = savedName.substring(savedName.lastIndexOf("."));
		        	savedName = savedName.substring(0,savedName.lastIndexOf("."));
		        	while(true) {
		        		if(!target.exists()) {
		        			savedName=target.getName();
		        			break;
		        		}
		        		target = new File(imagePath, savedName+new Random().nextInt(9999)+temp);
		        	}
		        }
		        FileCopyUtils.copy(files.getBytes(),target);
		        
		        allSaveName+=savedName;
		        if(iter.hasNext()) {
		        	allSaveName+=",";
		        }
			}else {
				if(allSaveName.lastIndexOf(",")>0) {
					allSaveName = allSaveName.substring(0,allSaveName.lastIndexOf(","));
				}
			}
		}
		log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>file upload"+allSaveName);
		return allSaveName;
	}
}