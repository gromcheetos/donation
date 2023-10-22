package admin.schol.sub.service.impl;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.property.EgovPropertyService;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.sub.service.impl.ScholSubscriptionDAO;
import admin.schol.sub.service.ScholSubscriptionService;
import admin.schol.special.service.Doner;
import admin.schol.special.service.ScholSpecialService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;

@Service("ScholSubscriptionService")
public class ScholSubscriptionServiceImpl extends EgovAbstractServiceImpl implements ScholSubscriptionService{

	@Resource(name = "ScholSubscriptionDAO")
    private ScholSubscriptionDAO scholSubscriptionDao;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Override
	public Map<String, Object> selectScholSubList(ScholVO scholVO) throws Exception {
		List<?> list = scholSubscriptionDao.selectScholSubList(scholVO);
		int cnt = scholSubscriptionDao.selectScholSpecialListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	
	}
	@Override
	public Map<String, Object> selectSubDonerList(ScholVO scholVO) {
		List<?> list = scholSubscriptionDao.selectSubDonerList(scholVO);
		Map<String, Object> doner = new HashMap<String, Object>();
		doner.put("resultList", list);
		return doner;
	}
	@Override
	public List<ScholVO> selectSubBenList(ScholVO scholVO) throws Exception{

		return scholSubscriptionDao.selectSubBenList(scholVO);
	}
	@Override
	public ScholVO selectScholSubDetail(ScholVO scholVO) {

		return scholSubscriptionDao.selectScholSubDetail(scholVO);
	}
	@Override
	public void updateScholCk(Schol schol) throws Exception {
		
		scholSubscriptionDao.updateScholCk(schol);
	}
	@Override
	public void updateScholConfirm(Schol schol) throws Exception {
		
		scholSubscriptionDao.updateScholConfirm(schol);
	}
	
	@Override
	public void updateScholClosed(Schol schol) throws Exception {
		
		scholSubscriptionDao.updateScholClosed(schol);
	}
	@Override
	public void insertArticle(Schol schol) throws FdlException {


		scholSubscriptionDao.insertArticle(schol);
		
	}
	@Override
	public void updateScholSubArticle(Schol schol) throws Exception {
		
		scholSubscriptionDao.updateScholSubArticle(schol);
	}	
	@Override
	public void deleteArticle(Schol schol) throws Exception {
		
		scholSubscriptionDao.deleteArticle(schol);
		
	}

}
