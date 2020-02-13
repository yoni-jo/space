package space.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("AdminResDAO")
public class AdminResDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminResList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("admin.selectAdminResList", map);
	}
	
	public void deleteResList(Map<String, Object> map) throws Exception{
		delete("admin.deleteResList", map);
	}
}