package space.user.res;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
public class ReserveController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private ReserveService reserveService;
	
	//결제화면
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
	//예약 결제정보창
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
	//결제내역창
	@RequestMapping("/res/resPayInfo")
	private ModelAndView payInfoView(CommandMap map) {
		ModelAndView mav = new ModelAndView("res/resFinish");
		
		mav.addObject("TYPE",map.get("TYPE"));
		mav.addObject("PRI",map.get("PRI"));
		mav.addObject("PAY_DATE",map.get("PAY_DATE"));
		return mav;
	}
	//내가 예약한 공간 첫페이지
	@RequestMapping("/res/resInfo")
	private ModelAndView myResList(CommandMap map,HttpSession session) {
		ModelAndView mav = new ModelAndView("myResList");
		String userId=(String)session.getAttribute("USER_ID");
		if(userId == null) {
			return new ModelAndView("redirect:/space/SpaceList");
		}
		
		map.put("USER_ID", userId);
		map.put("PAGE_ROW", "3");
		
		List<Map<String,Object>> list = reserveService.getResList(map.getMap());
		if(list.size()>0) {
			mav.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}else {
			mav.addObject("TOTAL", 0);
		}
		
		if(map.get("PAGE_INDEX") == null) {
			mav.addObject("PAGE_INDEX", 1);
		}else {
			mav.addObject("PAGE_INDEX", map.get("PAGE_INDEX"));
		}
		
		mav.addObject("RES_LIST", list);
		mav.addObject("TYPE", map.get("TYPE"));
		
		return mav;
	}
	
	@RequestMapping("res/resModify")
	private ModelAndView resInfoModify(CommandMap map) {
		ModelAndView mav = new ModelAndView("redirect:/res/resInfo");
		
		reserveService.modifyResInfo(map.getMap());
		
		return mav;
	}
	
	@RequestMapping("res/addReply")
	private ModelAndView addReply(HttpServletRequest request,CommandMap map,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/res/resInfo");
		
		String userId = (String)session.getAttribute("USER_ID");
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
		String savedName = null;
		String allSaveName="";
		String path = request.getSession().getServletContext().getRealPath("")+"\\resources\\";
		Iterator<String> iter = multiRequest.getFileNames();
		log.debug("files :"+ multiRequest.getFileNames());
		MultipartFile files=null;
		while(iter.hasNext()) {
			files = multiRequest.getFile(iter.next());
			if(files.isEmpty()==false) {
				savedName = createFileName(files.getOriginalFilename());

		        File target = new File(path, savedName);
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
		map.put("FILE_NAME", allSaveName);
		map.put("USER_ID", userId);
		
		reserveService.insertReply(map.getMap());
		
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
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일");
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
	private String createFileName(String filename) throws Exception{
		UUID uuid = UUID.randomUUID();
		String originalFileExtension =null;
		String savedName;
		
		originalFileExtension = filename.substring(filename.lastIndexOf("."));
		savedName = uuid+originalFileExtension;
        
        return savedName;
	}
}
