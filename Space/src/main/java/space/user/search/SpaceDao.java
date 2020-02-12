package space.user.search;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class SpaceDao extends AbstractDAO{
	
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
		if(type.equals("DAY")) {
			List<Map<String,Object>> list = (List<Map<String,Object>>)selectList("space.selectResDay",map);
			list.get(0).put("TYPE","DAY");
			return list;
		}	
		else {
			List<Map<String,Object>> list = (List<Map<String,Object>>)selectList("space.selectResDate",map);
			list.get(0).put("TYPE","DATE");
			return list;
		}
			
		
	}
	@SuppressWarnings("unchecked")
	public List<String> selectCompResDate(Map<String,Object> map){
		return selectList("space.selectCompResDate",map);
	}
	public void updateFovoriSpace(Map<String,Object> map)throws Exception{
		update("updateFavoriSpace",map);
	}
	public void insertQnAPost(Map<String,Object> map)throws Exception{
		insert("insertQnAWrite",map);
	}
	public void insertReplyPost(Map<String,Object> map)throws Exception{
		insert("insertQnAWrite",map);
	}
}
