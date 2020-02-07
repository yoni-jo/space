package space.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminQNADAO;

@Service("adminQNAService")
public class AdminQNAServiceImpl implements AdminQNAService {
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminQNADAO")
	private AdminQNADAO adminQNADAO;
	
	@Override
	public List<Map<String, Object>> selectQNAList(Map<String, Object> map) throws Exception {
		return adminQNADAO.selectQNAList(map);
	}
	
	@Override
	public void deleteQNA(Map<String, Object> map) throws Exception{
		adminQNADAO.deleteQNA(map);
	}
	
	@Override
	public void insertComment(Map<String, Object> map) throws Exception{
		adminQNADAO.insertComment(map);
	}
	
	@Override
	public void deleteComment(Map<String, Object> map) throws Exception{
		adminQNADAO.deleteComment(map);
	}
	
	
	
	@Override
	public List<Map<String, Object>> selectQNADetail(Map<String, Object> map) throws Exception{
		return adminQNADAO.selectQNADetail(map);
	}
	
	@Override
	public void modifyQNA(Map<String, Object> map) throws Exception{
		adminQNADAO.modifyQNA(map);
	}
	
	


}
