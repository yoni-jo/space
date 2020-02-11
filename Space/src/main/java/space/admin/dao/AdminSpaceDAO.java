package space.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("AdminSpaceDAO")
public class AdminSpaceDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSpaceList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("admin.selectspaceList", map);
	}
}