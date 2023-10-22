package admin.schol.special.service.impl;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.property.EgovPropertyService;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.special.service.impl.ScholSpecialDAO;
import admin.schol.special.service.Doner;
import admin.schol.special.service.ScholSpecialService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;

@Service("ScholSpecialService")
public class ScholSpecialServiceImpl extends EgovAbstractServiceImpl implements ScholSpecialService{

	@Resource(name = "ScholSpecialDAO")
    private ScholSpecialDAO scholSpecialDao;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
	@Override
	public Map<String, Object> selectScholSpecialList(ScholVO scholVO) throws Exception {
		List<?> list = scholSpecialDao.selectScholSpecialList(scholVO);
		int cnt = scholSpecialDao.selectScholSpecialListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	
	}
	
	@Override
	public ScholVO selectScholSpecialDetail(ScholVO scholVO) {

		return scholSpecialDao.selectScholSpecialDetail(scholVO);
	}
	
	@Override
	public void insertArticle(Schol schol) throws FdlException {
		scholSpecialDao.insertArticle(schol);
		
	}
	
	@Override
	public void updateScholSpecialArticle(Schol schol) throws Exception {
		
		scholSpecialDao.updateScholSpecialArticle(schol);
	}
	
	@Override
	public void deleteArticle(Schol schol) throws Exception {
		
		scholSpecialDao.deleteArticle(schol);
		
	}
	@Override
	public void updateScholCk(Schol schol) throws Exception {
		
		scholSpecialDao.updateScholCk(schol);
	}
	@Override
	public void updateScholConfirm(Schol schol) throws Exception {
		
		scholSpecialDao.updateScholConfirm(schol);
	}
	
	@Override
	public void updateScholClosed(Schol schol) throws Exception {
		
		scholSpecialDao.updateScholClosed(schol);
	}
	/*@Override
	public Map<String, Object> selectSpecialDonerList(ScholVO scholVO) throws Exception {
		List<?> list = scholSpecialDao.selectSpecialDonerList(scholVO);
		//int cnt = scholSpecialDao.selectScholSpecialListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		//map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	
	}*/
	
	@Override
	public  Map<String, Object> selectSpecialDonerList(ScholVO scholVO) throws Exception{
		List<?> list = scholSpecialDao.selectSpecialDonerList(scholVO);
		Map<String, Object> doner = new HashMap<String, Object>();
		doner.put("resultList", list);
		return doner;
	}
	@Override
	public List<ScholVO> selectSpecialBenList(ScholVO scholVO) throws Exception{

		return scholSpecialDao.selectSpecialBenList(scholVO);
	}
}
