package space.user.login;

import java.util.Map;


public interface LoginService {


	public String findAccount(Map<String, Object> map);

	public String findPwd(Map<String, Object> map);

	public void updateInfo(Map<String, Object> map);

}
