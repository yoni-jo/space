package space.myInfo.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserAdQNAList(Map<String, Object> map) throws Exception{
	  return (List<Map<String, Object>>)selectPagingList("myqna.selectUserAdQNAList", map);
		
	}
	

	public void insertUserAdQNAWrite(Map<String, Object> map) throws Exception{
		insert("myqna.insertUserAdQNAWrite", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminQNADetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("myqna.selectAdminQNADetail", map);
	}
	
	public void updateAdQNA(Map<String, Object> map) throws Exception{
		update("myqna.updateAdQNA", map);
	}
	
	public void deleteQNA(Map<String, Object> map) throws Exception{
		delete("myqna.deleteQNA", map);
	}
	
	}


