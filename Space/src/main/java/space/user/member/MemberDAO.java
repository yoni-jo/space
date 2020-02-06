package space.user.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;
@Repository
public class MemberDAO extends AbstractDAO{

	//수정버튼을 눌렀을때 DB정보 수정
	public void updateDB(Map<String,Object> map) {
		update("select.updateMyInfo", map);
	}


}
