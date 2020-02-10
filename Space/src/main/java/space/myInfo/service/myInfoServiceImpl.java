package space.myInfo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.myInfo.DAO.MyInfoDAO;

@Service("myInfoService")
public class myInfoServiceImpl implements myInfoService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myInfoDAO")
	private MyInfoDAO myInfoDAO;

	@Override
	public List<Map<String, Object>> selectUserAdQNAList(Map<String, Object> map) throws Exception {
		return myInfoDAO.selectUserAdQNAList(map);
	}

	@Override
	public void insertUserAdQNAWrite(Map<String, Object> map) throws Exception {
		myInfoDAO.insertUserAdQNAWrite(map);
		
	}
	
	@Override
	public Map<String, Object> selectAdminQNADetail(Map<String, Object> map) throws Exception{
		myInfoDAO.selectAdminQNADetail(map);
		Map<String, Object> resultMap = myInfoDAO.selectAdminQNADetail(map);
		return resultMap;
	}
	
	@Override
	public void updateAdQNA(Map<String, Object> map) throws Exception{
		myInfoDAO.updateAdQNA(map);
	}
	
	@Override
	public void deleteQNA(Map<String, Object> map) throws Exception{
		myInfoDAO.deleteQNA(map);
	}	
}

