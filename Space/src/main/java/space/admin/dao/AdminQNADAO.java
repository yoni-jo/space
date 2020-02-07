package space.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("adminQNADAO")
public class AdminQNADAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNAList(Map<String, Object> map) 
		throws Exception{
		return (List<Map<String, Object>>) selectPagingList("admin.selectAdminQNAList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNADetail(Map<String, Object> map) 
		throws Exception{
		return (List<Map<String, Object>>) selectList("admin.selectAdminQNADetail", map);
	}
	
	public void deleteQNA(Map<String, Object> map) throws Exception{
		delete("admin.deleteQNA", map);
	}
	
	public void insertComment(Map<String, Object> map) throws Exception{
		insert("admin.insertComment", map);
	}
	
	public void deleteComment(Map<String, Object> map) throws Exception{
		delete("admin.deleteComment", map);
	}
	
	public void modifyQNA(Map<String, Object> map) throws Exception{
		update("admin.modifyQNA", map);
	}
	
}
