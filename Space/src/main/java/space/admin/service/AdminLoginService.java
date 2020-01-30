package space.admin.service;

import java.util.Map;

public interface AdminLoginService {
	
	Map<String, Object> selectUserInfo(Map<String, Object>map) throws Exception;

}
