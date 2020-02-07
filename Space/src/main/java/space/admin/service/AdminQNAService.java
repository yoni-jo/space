package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminQNAService {
	
	List<Map<String, Object>> selectQNAList(Map<String, Object> map) throws Exception;
	
	void insertComment(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectQNADetail(Map<String, Object> map) throws Exception;
	
	void modifyQNA(Map<String, Object> map) throws Exception;
	
	void deleteQNA(Map<String, Object> map) throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;

}
