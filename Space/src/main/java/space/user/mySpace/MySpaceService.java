package space.user.mySpace;

import java.util.List;
import java.util.Map;

interface MySpaceService {
	List<Map<String,Object>> selectMySpaceList(Map<String,Object> map);
	List<Map<String,Object>> selectMyQnAList(Map<String,Object> map);
	List<Map<String,Object>> selectMyReplyList(Map<String,Object> map);
	int deleteSpaceBoard(Map<String,Object> map);
	void holdSpaceBoard(Map<String,Object> map);
	Map<String,Object> modifySpaceBoard(Map<String,Object> map); //02-11 수정
	List<Map<String,Object>> getResDate(Map<String,Object> map);//02-11 수정
	Map<String,Object> getResDay(Map<String,Object> map);//02-11 수정
	void applyModifySpaceBoard(Map<String,Object> map);//02-11수정
	void applySpaceBoard(Map<String,Object> map);// 수정
	String selectSpaceId(Map<String,Object> map);//수정
	void deleteQNAComment(Map<String,Object> map);
	void spaceQNAComment(Map<String,Object> map);
	void deleteReply(Map<String,Object> map);
	List<Map<String,Object>> selectResDateList(Map<String,Object> map);
	List<Map<String,Object>> searchResSpaceList(Map<String,Object> map);
	
	Map<String, Object> selectFav(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFavList(Map<String, Object> map) throws Exception;
	int countFavList(Map<String, Object> map) throws Exception;
	void updateFavCountDec(Map<String, Object> map) throws Exception;
	void deleteFav(Map<String, Object> map) throws Exception;
	void addFav(Map<String, Object> map) throws Exception;
	
	
}
