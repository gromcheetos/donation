package admin.common.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import admin.common.service.CommonService;
import admin.schol.indi.service.Schol;
import antlr.collections.List;

@Service("commonService") 

public class CommonServiceImpl implements CommonService{ 
	Logger log = Logger.getLogger(this.getClass()); 

	@Resource(name="commonDAO") 
	private CommonDAO commonDAO; 
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return commonDAO.selectFileInfo(map);
		
	}
}


