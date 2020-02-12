package space.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import space.common.common.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver{
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		// TODO Auto-generated method stub
		CommandMap commandMap = new CommandMap();
		log.debug("=============================CommandMap Data========================");
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		log.info("Request-CharacterEncoding : "+request.getCharacterEncoding());
		request.setCharacterEncoding("utf-8");
		Enumeration<?> enumeration = request.getParameterNames();
		
		
		String key=null;
		String[] values=null;
		while(enumeration.hasMoreElements()) {
			key = (String) enumeration.nextElement();
			values = request.getParameterValues(key);
			if(values !=null) {
				log.debug(">>>>>>>>>>>>> "+key+" : "+values[0]);
				commandMap.put(key, (values.length > 1) ? values:values[0]);
			}
		}
		log.debug("=============================CommandMap DataEnd========================");
		return commandMap;
	}
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
}
