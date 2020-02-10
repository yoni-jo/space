package space.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminMemberDAO;


@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
		
	@Override
	public List<Map<String, Object>> memberPageList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDAO.memberPageList(map);
	}


	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}