package admin.cmn.bene.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.cmn.bene.service.BeneShareMngService;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("BeneShareMngService")

public class BeneShareMngServiceImpl extends EgovAbstractServiceImpl implements BeneShareMngService{
	
	@Resource(name = "BeneShareMngDAO")
    private BeneShareMngDAO beneShareMngDAO;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;


	@Override
	public Map<String, Object> selectBeneShareMngList(ScholVO scholVO) throws Exception {
		// TODO Auto-generated method stub
		List<?> list = beneShareMngDAO.selectBeneShareMngList(scholVO);
		int cnt = beneShareMngDAO.selectBeneShareMngListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}
	@Override
	public ScholVO selectBeneShareMngDetail(ScholVO scholVO) {

		return beneShareMngDAO.selectBeneShareMngDetail(scholVO);
	}
	@Override
	public void deleteShare(Schol schol) throws Exception {
		
		beneShareMngDAO.deleteShare(schol);
		
	}
}