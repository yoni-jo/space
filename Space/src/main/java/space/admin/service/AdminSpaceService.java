package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminSpaceService {
	
	List<Map<String, Object>> selectspaceList (Map<String, Object> map) throws Exception;

}
