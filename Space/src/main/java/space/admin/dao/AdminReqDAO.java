package space.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("AdminReqDAO")
public class AdminReqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectreqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("admin.selectreqList", map);
	}
	
	public void insertreqList(Map<String, Object> map) throws Exception{
		String type = (String)selectOne("admin.selectApplyResType",map);
		update("admin.insertreqList",map);
		if(type.equals("DAY")) {
			update("admin.putResDayInfo",map);
			delete("admin.deleteApplyResDay",map);
		}else {
			update("admin.putResDateInfo",map);
			delete("admin.deleteApplyResDate",map);
		}
		delete("admin.deleteApplyBoard",map);
	}
	
	public void deletereqList(Map<String, Object> map) throws Exception{
		delete("admin.deletereqList", map);
	}
	
	public void deletereq(Map<String, Object> map) throws Exception{
		delete("admin.deletereq", map);
	}
}