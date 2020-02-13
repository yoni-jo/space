package space.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminReqDAO;


	@Service("AdminReqService")
	public class AdminReqServiceImpl implements AdminReqService{
		Logger log = Logger.getLogger(this.getClass());
		
		@Resource(name="AdminReqDAO")
		private AdminReqDAO adminReqDAO;

		@Override
		public List<Map<String, Object>> selectreqList(Map<String, Object> map) throws Exception {
		
			return adminReqDAO.selectreqList(map);
		}
		@Override
		public void insertreqList(Map<String, Object> map) throws Exception{
			adminReqDAO.insertreqList(map);
		}
		
		@Override
		public void deletereqList(Map<String, Object> map) throws Exception{
			adminReqDAO.deletereqList(map);
		}
		
		@Override
		public void deletereq(Map<String, Object> map) throws Exception{
			adminReqDAO.deletereq(map);
		}
	} 
