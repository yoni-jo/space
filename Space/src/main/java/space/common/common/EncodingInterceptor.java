package space.common.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import space.common.logger.LoggerInterceptor;

public class EncodingInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(this.getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info(">>>>>>>>>>>>>AUTO ENCODING SET EUC-KR<<<<<<<<<<<<<<<");
		request.getSession().setAttribute("encoding", "EUC-KR");
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}
	
}
