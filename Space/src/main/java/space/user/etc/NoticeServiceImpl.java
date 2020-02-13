package space.user.etc;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminNoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectNoticeList(map);
	}
	
	@Override
	public void insertNotice(Map<String, Object> map) throws Exception{
		noticeDAO.insertNotice(map);
	}
	
	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
		noticeDAO.updateHitCnt(map);
		Map<String, Object> resultMap = noticeDAO.selectNoticeDetail(map);
		return resultMap;
	}
	
	@Override
	public void modifyNotice(Map<String, Object> map) throws Exception{
		noticeDAO.modifyNotice(map);
	}
	
	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception{
		noticeDAO.deleteNotice(map);
	}

}
