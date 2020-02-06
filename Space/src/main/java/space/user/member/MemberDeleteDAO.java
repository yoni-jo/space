package space.user.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class MemberDeleteDAO extends AbstractDAO{

	//탈퇴하기 
	
	public void memberDelete(Map<String,Object>map) throws Exception{
		update("select.deleteUser_Id",map);
	}
	
}
