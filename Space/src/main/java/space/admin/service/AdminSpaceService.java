package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminSpaceService {
	
	List<Map<String, Object>> selectSpaceList (Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectWaitSpaceList (Map<String, Object> map) throws Exception;
	
	void deleteSpace(Map<String, Object> map) throws Exception;
	
}
