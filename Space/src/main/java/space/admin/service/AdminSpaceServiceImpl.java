package space.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import space.admin.dao.AdminSpaceDAO;

	@Service("AdminSpaceService")
	public class AdminSpaceServiceImpl implements AdminSpaceService{
		Logger log = Logger.getLogger(this.getClass());
		
		@Resource(name="AdminSpaceDAO")
		private AdminSpaceDAO adminSpaceDAO;

		@Override
		public List<Map<String, Object>> selectspaceList(Map<String, Object> map) throws Exception {
		
			return adminSpaceDAO.selectspaceList(map);
		}
	}
