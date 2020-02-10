package space.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class AdminLoginDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserInfo(Map<String, Object> map) 
	throws Exception{
		return (Map<String, Object>) selectOne("admin.selectAdminLogin", map);
	}

	
	
}
