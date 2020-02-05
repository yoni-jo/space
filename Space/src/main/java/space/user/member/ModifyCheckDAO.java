package space.user.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import space.common.dao.AbstractDAO;

@Repository
public class ModifyCheckDAO extends AbstractDAO{
//정보수정 pwd 확인
public String pwdcheck(Map<String,Object> map,String id) {
		return (String) selectOne("select.selectMyLogin",map);
	}

//정보수정 화면 넘어왔을때 고객정보 불러오기 
public Map<String,Object> selectInfo(String id) {
	return (Map<String,Object>) selectOne("select.selectMyInfo",id);
}


}
 