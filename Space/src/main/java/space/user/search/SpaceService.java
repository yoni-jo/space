package space.main.service;

import java.util.List;
import java.util.Map;

public interface SpaceService {
	Map<String,Object> selectSpaceList(Map<String,Object> map) throws Exception;
	Map<String,Object> selectSearchList(Map<String,Object> map) throws Exception;
	Map<String,Object> selectDetailSpace(Map<String,Object> map) throws Exception;
	List<String> updateFavoriSpace(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> selectQnAList(Map<String,Object> map) throws Exception;
	List<Map<String,Object>> selectReplyList(Map<String,Object> map) throws Exception;
	List<String> selectCompResDate(Map<String,Object> map) throws Exception;
	void writeQnAPost(Map<String,Object> map) throws Exception;
	void writeReplyPost(Map<String,Object> map) throws Exception;
}
