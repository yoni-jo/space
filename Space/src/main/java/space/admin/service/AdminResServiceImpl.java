package space.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminResDAO;

	@Service("AdminResService")
	public class AdminResServiceImpl implements AdminResService{
		Logger log = Logger.getLogger(this.getClass());
		
		@Resource(name="AdminResDAO")
		private AdminResDAO adminResDAO;

		@Override
		public List<Map<String, Object>> selectAdminResList(Map<String, Object> map) throws Exception {
		
			return adminResDAO.selectAdminResList(map);
		}
		

		@Override
		public void deleteResList(Map<String, Object> map) throws Exception{
			adminResDAO.deleteResList(map);
		}
	}
