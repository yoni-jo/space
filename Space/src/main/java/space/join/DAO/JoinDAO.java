package space.join.DAO;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class JoinDAO extends AbstractDAO{
	public void insertMember(Map<String,Object> map) {
		insert("memberMapper_test.insertUser_List", map);
	
	
	}
}
