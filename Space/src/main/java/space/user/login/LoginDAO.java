package space.user.login;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class LoginDAO extends AbstractDAO{
	
	public String findMember(Map<String, Object> map) {
		return (String) selectOne("login.selectLogin", map);		
	}
		
	public String getId(Map<String, Object> map) {
		return (String) selectOne("login.findId", map);
	}
	
	public String getPwd(Map<String, Object> map) {
		return (String) selectOne("login.findPwd", map);
	}
	public void updatePwd(Map<String, Object> map) {
		update("login.updatePwd", map);
	}




}
