package admin.schol.indi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.MemberVO;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholIndiService;
import admin.schol.indi.service.ScholVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("ScholIndiService")
public class ScholIndiServiceImpl extends EgovAbstractServiceImpl implements ScholIndiService {

	@Resource(name = "ScholIndiDAO")
    private ScholIndiDAO scholIndiDao;


    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;


	@Override
	public Map<String, Object> selectScholIndiList(ScholVO scholVO) throws Exception {
		// TODO Auto-generated method stub
		List<?> list = scholIndiDao.selectScholIndiList(scholVO);
		int cnt = scholIndiDao.selectScholIndiListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}
 
	@Override
	public ScholVO selectScholIndiDetail(ScholVO scholVO) {

		return scholIndiDao.selectScholIndiDetail(scholVO);
	}
	
	@Override
	public void insertArticle(Schol schol) throws FdlException {
		scholIndiDao.insertArticle(schol);
		
	}
	
	@Override
	public void updateScholIndiArticle(Schol schol) throws Exception {
		
		scholIndiDao.updateScholIndiArticle(schol);
	}
	
	@Override
	public void deleteArticle(Schol schol) throws Exception {
		
		scholIndiDao.deleteArticle(schol);
		
	}
	@Override
	public void updateScholCk(Schol schol) throws Exception {
		
		scholIndiDao.updateScholCk(schol);
	}
	@Override
	public void updateScholConfirm(Schol schol) throws Exception {
		
		scholIndiDao.updateScholConfirm(schol);
	}
	
	@Override
	public Map<String, Object> selectDonerId(Member member) throws Exception {
		List<?> list = scholIndiDao.selectDonerId(member);
		//int cnt = scholIndiDao.selectScholIndiListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		
		return map;
	}




	
/*	
	@Override
	public int selectLoginUser(BoardVO boardVO){
		return scholIndiDao.selectLoginUser(boardVO);
	}
	

*/

}
