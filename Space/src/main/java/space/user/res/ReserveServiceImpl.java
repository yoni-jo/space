package space.main.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import space.main.dao.ReserveDao;



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

}
