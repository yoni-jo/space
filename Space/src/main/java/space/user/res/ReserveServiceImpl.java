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
	@Override
	public void insertMessage(Map<String, Object> map) {
		Map<String,Object> spaceMap = reserveDao.getSpaceInfo(map);
		String userId = (String)spaceMap.get("SPACE_HOST");
		String title = (String)spaceMap.get("SPACE_TITLE");
		String content = "게시하신 ["+title + "] 에 대한 예약요청이 들어왔습니다.\n"
				+ "내 공간 예약상황 페이지에서 확인 부탁드립니다.";
		spaceMap.put("USER_ID", userId);
		spaceMap.put("TITLE", "예약 요청이 들어왔습니다.");
		spaceMap.put("CONTENT", content);
		
		reserveDao.insertMessage(spaceMap);
	}
	
}
