package space.admin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import space.admin.dao.AdminLoginDAO;
import space.common.dao.AbstractDAO;


@Service("AdminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {
	
@Resource
private AdminLoginDAO adminLoginDao;
	
	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) adminLoginDao.selectUserInfo(map);
	}

	
}
