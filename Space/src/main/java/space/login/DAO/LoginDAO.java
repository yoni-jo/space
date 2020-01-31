package space.login.DAO;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class LoginDAO extends AbstractDAO{

	//아이디와 패스워드를 찾는 메서드
	public Map<String, Object> findMember(Map<String, Object> map) {
		Map<String, Object> temp = new HashMap<String, Object>();
		temp=(Map<String, Object>)selectOne("login.selectLogin", map);
		return temp;
		
		
	}
	//있을경우
	
	//없을경우
	
}
