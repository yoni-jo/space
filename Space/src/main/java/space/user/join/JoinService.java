package space.user.join;

import java.util.Map;

public interface JoinService {

	void insertUserData(Map<String, Object> map) throws Exception;

	int selectUserID(Map<String, Object> map) throws Exception;
	
	public boolean send(String subject, String text, String from, String to, String filePath);	

	

}
