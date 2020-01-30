package space.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("adminNoticeDAO")
public class AdminNoticeDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) 
		throws Exception{
		return (List<Map<String, Object>>) selectList("admin.selectAdminNoticeList", map);
	}
	
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("admin.insertNotice", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("admin.updateNoticeHitCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) 
		throws Exception{
		return (Map<String, Object>) selectOne("admin.selectAdminNoticeDetail", map);
	}
	
	public void modifyNotice(Map<String, Object> map) throws Exception{
		update("admin.modifyNotice", map);
	}
	
	public void deleteNotice(Map<String, Object> map) throws Exception{
		delete("admin.deleteNotice", map);
	}


}
