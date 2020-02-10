package space.user.mySpace;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class MySpaceDao extends AbstractDAO{
	public final static int ERR_RES_LIST = -1;
	
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
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectMySpaceList(Map<String,Object> map){
		return (List<Map<String, Object>>) selectPagingList("mySpace.selectMySpaceList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectApplySpaceList(Map<String,Object> map){
		return (List<Map<String, Object>>) selectPagingList("mySpace.selectMyApplyList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQnACompList(Map<String,Object> map){
		return (List<Map<String, Object>>) selectPagingList("mySpace.spaceQNACompList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectQnAWaitList(Map<String,Object> map){
		return (List<Map<String, Object>>) selectPagingList("mySpace.spaceQNAList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectReplyList(Map<String,Object> map){
		return (List<Map<String, Object>>) selectPagingList("mySpace.spaceReplyList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectResDate(Map<String,Object> map){
		return selectList("mySpace.selectResDate",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> searchResList(Map<String,Object> map){
		return selectList("mySpace.searchResList",map);
	}
	public int deleteSpaceBoard(Map<String,Object> map) {
		try {
			if(!selectList("mySpace.selectMyResList",map).isEmpty()) {
				throw new Exception("ResListError");
			}
			delete("mySpace.deleteSpaceBoard", map);
			return 0;
		}catch(Exception e) {
			return ERR_RES_LIST;
		}
	}
	public int deleteApplyBoard(Map<String,Object> map) {
		delete("mySpace.deleteApplyBoard", map);
		delete("mySpace.deleteResDay",map);
		delete("mySpace.deleteResDate",map);
		
		return 0;
	}
	public void holdSpaceBoard(Map<String,Object> map) {
		update("mySpace.holdSpaceBoard",map);
	}
	
	public void deleteQNAComment(Map<String,Object> map) {
		update("mySpace.deleteQNAComment", map);
	}
	public void spaceQNAComment(Map<String,Object> map) {
		update("mySpace.spaceQNAComment",map);
	}
	public void deleteReply(Map<String,Object> map) {
		update("mySpace.deleteReply",map);
	}

	
	
}
