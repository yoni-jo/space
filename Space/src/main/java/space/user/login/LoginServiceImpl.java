package space.user.login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
		 
	 
	@Resource(name="loginDAO") 
	 private LoginDAO loginDAO;
	
	
	
	@Override
	public String findAccount(Map<String, Object> map) {
		return loginDAO.getId(map);
	}



	@Override
	public String findPwd(Map<String, Object> map) {
		return loginDAO.getPwd(map);
	}
	
	@Override
	public void updateInfo(Map<String, Object> map) {		
		loginDAO.updatePwd(map);
	}

	

}
