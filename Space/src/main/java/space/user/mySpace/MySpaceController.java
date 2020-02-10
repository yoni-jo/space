package space.user.mySpace;

import java.util.List;
import java.util.Map;

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
public class MySpaceController {

	Logger log=Logger.getLogger(this.getClass());
		
		@Resource(name = "mySpaceService")
		private MySpaceService mySpaceService;
		
		@RequestMapping(value="/mypage/myFavList")
		public ModelAndView favSpaceList(CommandMap commandMap,HttpSession session) throws Exception{
			ModelAndView mv=new ModelAndView("/mypage/myFav");
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


}