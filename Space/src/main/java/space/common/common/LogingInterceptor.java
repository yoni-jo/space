package space.common.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogingInterceptor extends HandlerInterceptorAdapter{
	Logger log = Logger.getLogger(this.getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("request URL " + request.getRequestURL());
		log.info(request.getRequestURL().toString().contains("/admin/"));
		RequestDispatcher ds;
		
		if(request.getSession().getAttribute("USER_ID")==null) {
			if(request.getRequestURL().toString().contains("/admin/")) {
				log.info("request.getSession().getAttribute(\"ADMIN\") : "+request.getSession().getAttribute("ADMIN"));
				if(request.getSession().getAttribute("ADMIN")==null) {
					
					request.setAttribute("msg", "관리자 권환이 필요합니다");
					request.setAttribute("nextView", request.getContextPath()+"/admin/AdminLogin");
					ds = request.getRequestDispatcher("/space/alertPage");
					ds.forward(request, response);
					return false;
				}
			}
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("nextView", request.getContextPath()+"/login/loginForm");
			ds = request.getRequestDispatcher("/space/alertPage");
			ds.forward(request, response);
			return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}
}
