package space.user.search;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("SpaceService")
public class SpaceServiceImpl implements SpaceService{
	Logger log = Logger.getLogger(this.getClass());
	@Resource
	private SpaceDao spaceDao;
	@Override
	public Map<String, Object> selectSpaceList(Map<String, Object> map) throws Exception{
		Map<String,Object> tempMap = new HashMap<String, Object>();
		List<String> favList;
		List<Map<String,Object>> list = spaceDao.selectSpaceList();
		
		if (map.get("USER_ID") != null) {
			favList = spaceDao.selectFavoriList(map);
		}else favList = Collections.emptyList();

		tempMap.put("FAVORI_LIST", favList);
		tempMap.put("SPACE_LIST", list);
		
		return tempMap;
	}
	@Override
	public Map<String,Object> selectSearchList(Map<String, Object> map) throws Exception{
		Map<String,Object> tempMap = new HashMap<String, Object>();
		List<Map<String,Object>> list = spaceDao.selectSearchList(map);
		List<String> favList;
		
		if (map.get("USER_ID") != null) {
			favList = spaceDao.selectFavoriList(map);
		}else favList = Collections.emptyList();
		
		tempMap.put("SPACE_LIST", list);
		tempMap.put("FAVORI_LIST",favList);
		
		return tempMap;
	}
	@Override
	public Map<String, Object> selectDetailSpace(Map<String, Object> map) throws Exception{
		Map<String,Object> tempMap = new HashMap<String, Object>();
		tempMap.put("DETAIL",spaceDao.selectDetailSpace(map));
		tempMap.put("RES_LIST", spaceDao.selectSpaceRes(map));
		
		return tempMap;
	}
	@Override
	public List<String> updateFavoriSpace(Map<String, Object> map) throws Exception{
		spaceDao.updateFovoriSpace(map);
		List<String> list = spaceDao.selectFavoriList(map);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return spaceDao.selectSpaceQNA(map);
	}
	@Override
	public List<Map<String, Object>> selectReplyList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return spaceDao.selectSpaceReply(map);
	}
	@Override
	public void writeQnAPost(Map<String, Object> map) throws Exception {
		spaceDao.insertQnAPost(map);
	}
	@Override
	public void writeReplyPost(Map<String, Object> map) throws Exception {
		spaceDao.insertReplyPost(map);
	}
	@Override
	public List<String> selectCompResDate(Map<String, Object> map) throws Exception {
		return spaceDao.selectCompResDate(map);
	}
	
}
