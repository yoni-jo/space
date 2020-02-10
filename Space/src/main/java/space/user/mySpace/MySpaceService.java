package space.user.mySpace;

import java.util.List;
import java.util.Map;

interface MySpaceService {
	List<Map<String,Object>> selectMySpaceList(Map<String,Object> map);
	void deleteApplyBoard(Map<String,Object> map);
	void deleteSpaceBoard(Map<String,Object> map);
	void holdSpaceBoard(Map<String,Object> map);
	void modifySpaceBoard(Map<String,Object> map);
	
	//Map<String,Object> selectSpaceList(Map<String,Object> map) throws Exception;
	//List<String> updateFavSpace(Map<String,Object> map) throws Exception;
	
	Map<String, Object> selectFav(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFavList(Map<String, Object> map) throws Exception;
	int countFavList(Map<String, Object> map) throws Exception;
	void updateFavCountDec(Map<String, Object> map) throws Exception;
	void deleteFav(Map<String, Object> map) throws Exception;
	void addFav(Map<String, Object> map) throws Exception;
	
	
}
