package admin.common.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.schol.indi.service.Schol;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("commonDAO")
public class CommonDAO extends EgovComAbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("Scholarship.selectFileInfo", map);
	}

}
