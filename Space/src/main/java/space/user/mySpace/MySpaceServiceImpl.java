package space.user.mySpace;


import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import space.user.search.SpaceDao;

@Service("mySpaceService")
public class MySpaceServiceImpl implements MySpaceService{
	
	@Resource
	private SpaceDao spaceDao;
	
	@Resource
	private MySpaceDao mySpaceDao;
	
	@Override
	public Map<String, Object> selectFav(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> space=mySpaceDao.selectFav(map);
		Map<String,Object> temp_map = new HashMap<String,Object>();
		for(int i=0 ; i < space.size() ; i++) {
			String rn = String.valueOf(space.get(i).get("space_id"));
			temp_map.put(rn,"space_id");
		}
		return temp_map;
	}
	
	@Override
	public List<Map<String, Object>> selectFavList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> space=mySpaceDao.selectFavList(map); // 맵 객체에 찜한 공간 번호 저장(dao-mapper의 userId spaceId)
		if(space.size()==0) return Collections.emptyList();
		return mySpaceDao.selectFavList(map); //반복된 작업을 거친 favSpace 리스트 객체를 리턴.
	}
	
	@Override
	public int countFavList(Map<String, Object> map) throws Exception {
		return mySpaceDao.countFavList(map); //반복된 작업을 거친 favSpace 리스트 객체를 리턴.
	}	
	
	
	@Override
	public void deleteFav(Map<String, Object> map) throws Exception {
		mySpaceDao.deleteFav(map);
	}
	

	@Override
	public void updateFavCountDec(Map<String, Object> map) throws Exception {
		mySpaceDao.updateFavCountDec(map);
	}


	@Override
	public void addFav(Map<String, Object> map) throws Exception {
		mySpaceDao.addFav(map);
		mySpaceDao.updateFavCountInc(map);
	}
	
	
	
	
	
	
	

	@Override
	public List<Map<String, Object>> selectMySpaceList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteApplyBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSpaceBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void holdSpaceBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifySpaceBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	
/*
	@Override
	public Map<String, Object> selectSpaceList(Map<String, Object> map) throws Exception {
		Map<String,Object> tempMap = new HashMap<String, Object>();
		List<String> favList;
		List<Map<String,Object>> list = spaceDao.selectSpaceList();
		
		if (map.get("USER_ID") != null) {
			favList = spaceDao.selectFavoriList(map);
		}else favList = Collections.emptyList();

		tempMap.put("LIKE_LIST", favList);
		tempMap.put("SPACE_LIST", list);
		
		return tempMap;
	}


	@Override
	public List<String> updateFavSpace(Map<String, Object> map) throws Exception {
		spaceDao.updateFovoriSpace(map);
		List<String> list = spaceDao.selectFavoriList(map);
		return list;
	}
	
	
*/
}
