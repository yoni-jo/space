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
		String type=(String)map.get("TYPE");
		if(type.equals("COMP")) {
			return mySpaceDao.selectMySpaceList(map);
		}else if(type.equals("WAIT")) {
			return mySpaceDao.selectApplySpaceList(map);
		}else {
			return Collections.emptyList();
		}
	}
	@Override
	public List<Map<String, Object>> selectMyQnAList(Map<String, Object> map) {
		String type=(String)map.get("QnATYPE");
		if(type.equals("QnACOMP")) {
			return mySpaceDao.selectQnACompList(map);
		}else if(type.equals("QnAWAIT")) {
			return mySpaceDao.selectQnAWaitList(map);
		}else {
			return Collections.emptyList();
		}
	}
	@Override
	public List<Map<String, Object>> selectMyReplyList(Map<String, Object> map) {
		return mySpaceDao.selectReplyList(map);
	}
	@Override
	public int deleteSpaceBoard(Map<String, Object> map) {
		int result=0;
		String type=(String)map.get("TYPE");
		if(type.equals("COMP")) {
			result=mySpaceDao.deleteSpaceBoard(map);
		}else if(type.equals("WAIT")) {
			result=mySpaceDao.deleteApplyBoard(map);
		}
		return result;
	}

	@Override
	public void holdSpaceBoard(Map<String, Object> map) {
		mySpaceDao.holdSpaceBoard(map);
	}

	@Override
	public void modifySpaceBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Map<String,Object> modifySpaceBoard(Map<String, Object> map) {//02-11수정
		String type=(String)map.get("TYPE");
		if(type.equals("COMP")) {
			return mySpaceDao.modifySpaceBoard(map);
		}else if(type.equals("WAIT")) {
			return mySpaceDao.modifyApplyBoard(map);
		}
		
		return mySpaceDao.modifySpaceBoard(map);
	}
	public List<Map<String,Object>> getResDate(Map<String,Object> map){
		return mySpaceDao.getResDate(map);
	}
	public Map<String,Object> getResDay(Map<String,Object> map){
		return mySpaceDao.getResDay(map);
	}
	
	public void applyModifySpaceBoard(Map<String,Object> map) {
		mySpaceDao.updateApplyinfo(map);

	}
	@Override
	public void applySpaceBoard(Map<String, Object> map) {
		mySpaceDao.updateApplyinfo(map);
	}
	@Override
	public String selectSpaceId(Map<String, Object> map) {
		return mySpaceDao.selectSpaceId(map);
	}
	@Override
	public List<Map<String, Object>> selectResDateList(Map<String, Object> map) {
		return mySpaceDao.selectResDate(map);
	}

	@Override
	public List<Map<String, Object>> searchResSpaceList(Map<String, Object> map) {
		return mySpaceDao.searchResList(map);
	}
	@Override
	public void deleteQNAComment(Map<String, Object> map) {
		mySpaceDao.deleteQNAComment(map);
		
	}
	@Override
	public void spaceQNAComment(Map<String, Object> map) {
		mySpaceDao.spaceQNAComment(map);
		
	}
	@Override
	public void deleteReply(Map<String, Object> map) {
		mySpaceDao.deleteReply(map);
	}
}
