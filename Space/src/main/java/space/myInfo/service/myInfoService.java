package space.myInfo.service;

import java.util.List;
import java.util.Map;

public interface myInfoService {

	List<Map<String, Object>> selectUserAdQNAList(Map<String, Object> Map) throws Exception;

    void insertUserAdQNAWrite(Map<String,Object> map) throws Exception;
    
    Map<String, Object> selectAdminQNADetail(Map<String, Object> map) throws Exception;
    
    void updateAdQNA(Map<String, Object> map) throws Exception;
	
    void deleteQNA(Map<String, Object> map) throws Exception;
    
}
