package space.main.service;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	Map<String,Object> getSpaceInfo(Map<String,Object> map);
	Map<String,Object> getUserInfo(Map<String,Object> map);
	void insertResInfo(Map<String,Object> map);
	List<Map<String,Object>> getResList(Map<String,Object> map);
	void modifyResInfo(Map<String,Object> map);
	void insertReply(Map<String,Object> map);
}
