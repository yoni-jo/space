package space.user.mySpace;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class MySpaceDao extends AbstractDAO{
	
	
	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> selectFav(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("mySpace.myFav",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFavList(Object rn) throws Exception{
		return (List<Map<String,Object>>)selectList("mySpace.myFavList",rn);
	}
	
	@SuppressWarnings("unchecked")
	public int countFavList(Map<String, Object> map) throws Exception{
		return Integer.valueOf((String)selectOne("mySpace.countFavList", map));
	}
	
	public void deleteFav(Map<String, Object> map) throws Exception{
		delete("mySpace.deleteFav",map);
	}

	public void updateFavCountDec(Map<String, Object> map) throws Exception {		
		update("mySpace.updateFavCountDec",map);
	}
	public void updateFavCountInc(Map<String, Object> map) throws Exception {
		update("mySpace.updateFavCountInc",map);
	}	

	public void addFav(Map<String, Object> map) throws Exception {
		insert("mySpace.addFav", map);
	}

	
	
	
	
	
	
	
	
	/*
	@SuppressWarnings("unchecked")
	public List<String> myFav(Map<String,Object> map)throws Exception{
		return (List<String>)selectList("mySpace.myFav",map);
	}
	*/
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSpaceList(){
		return (List<Map<String,Object>>)selectList("space.selectDefaultList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSearchList(Map<String,Object> map)throws Exception{
		return (List<Map<String,Object>>)selectList("space.selectSearchList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> selectFavoriList(Map<String,Object> map)throws Exception{
		return (List<String>)selectList("space.favoriList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectDetailSpace(Map<String,Object> map)throws Exception{
		update("spaceReadCount", map);
		return (Map<String,Object>)selectOne("space.detailSpace",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSpaceQNA(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("space.selectQNAList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSpaceReply(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("space.selectReplyList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectSpaceRes(Map<String,Object> map) throws Exception{
		String type = (String)selectOne("space.selectResType",map);
		if(type.equals("DAY")) 
			return (List<Map<String,Object>>)selectList("space.selectResDay",map);
		else 
			return (List<Map<String,Object>>)selectList("space.selectResDate",map);		
	}

	
	
}
