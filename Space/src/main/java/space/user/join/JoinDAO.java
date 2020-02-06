package space.user.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	public void insertUserData(Map<String, Object> map) throws Exception {
		  insert("memberMapper_test.insertUserData", map);
	}
	@SuppressWarnings("unchecked")
	 public int selectUserID(Map<String, Object> map) throws Exception {
	  Map<String, Object> resultMap = (Map<String, Object>)selectOne("memberMapper_test.selectUserID", map);
	  
	  int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
	  
	  return result;
	 }
}
