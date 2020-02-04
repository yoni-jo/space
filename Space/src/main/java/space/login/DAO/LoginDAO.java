package space.login.DAO;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class LoginDAO extends AbstractDAO{

	//아이디와 패스워드를 찾는 메서드
	public String findMember(Map<String, Object> map) {
		return (String) selectOne("login.selectLogin", map);
		
		
	}

	
}
