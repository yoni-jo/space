package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminReqService {
	
	List<Map<String, Object>> selectreqList (Map<String, Object> map) throws Exception;

}
