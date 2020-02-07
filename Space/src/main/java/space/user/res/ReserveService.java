package space.user.res;

import java.util.Map;

public interface ReserveService {
	Map<String,Object> getSpaceInfo(Map<String,Object> map);
	Map<String,Object> getUserInfo(Map<String,Object> map);
	void insertResInfo(Map<String,Object> map);
}
