package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminReqService {
	
	List<Map<String, Object>> selectreqList (Map<String, Object> map) throws Exception;

	void insertreqList(Map<String, Object> map) throws Exception;
	
	void deletereqList(Map<String, Object> map) throws Exception;
	
	void deletereq(Map<String, Object> map) throws Exception;
}
