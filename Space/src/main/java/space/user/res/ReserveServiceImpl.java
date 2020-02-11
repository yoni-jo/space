package space.user.res;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service
public class ReserveServiceImpl implements ReserveService{
	
	@Resource
	private ReserveDao reserveDao;

	@Override
	public Map<String, Object> getSpaceInfo(Map<String, Object> map) {
		return reserveDao.getSpaceInfo(map);
	}

	@Override
	public Map<String, Object> getUserInfo(Map<String, Object> map) {
		return reserveDao.getUserInfo(map);
	}

	@Override
	public void insertResInfo(Map<String, Object> map) {
		reserveDao.insertResInfo(map);
		
	}

	@Override
	public List<Map<String, Object>> getResList(Map<String, Object> map) {
		return reserveDao.selectMyResList(map);
	}

	@Override
	public void modifyResInfo(Map<String, Object> map) {
		reserveDao.updateResInfo(map);
	}
	@Override
	public void insertReply(Map<String, Object> map) {
		reserveDao.insertReply(map);
		
	}
	
}
