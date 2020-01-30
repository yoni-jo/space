package space.admin.dao;

import java.util.Map;

import space.common.dao.AbstractDAO;

public class AdminLoginDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserInfo(Map<String, Object> map) 
	throws Exception{
		return (Map<String, Object>) selectOne("user.selectUserInfo", map);
	}

}
