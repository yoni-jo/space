package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminNoticeService {
	
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	void insertNotice(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;
	
	void modifyNotice(Map<String, Object> map) throws Exception;
	
	void deleteNotice(Map<String, Object> map) throws Exception;
	
}
