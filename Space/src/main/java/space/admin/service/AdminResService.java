package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminResService {
	
	List<Map<String, Object>> selectAdminResList (Map<String, Object> map) throws Exception;

}
