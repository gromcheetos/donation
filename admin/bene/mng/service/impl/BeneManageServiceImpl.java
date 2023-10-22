package admin.bene.mng.service.impl;

import java.util.Map;
import java.util.Map.Entry;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.transaction.TransactionException;
import org.apache.log4j.Logger;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import egovframework.rte.fdl.property.EgovPropertyService;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.bene.mng.service.BeneManageService;
import admin.bene.mng.service.BeneMngVO;
import admin.bene.mng.service.impl.BeneManageDAO;
import admin.common.util.CommonUtils;
import admin.common.util.FileUtils;
import admin.schol.sub.service.ScholSubscriptionService;
import admin.schol.special.service.Doner;
import admin.schol.special.service.ScholSpecialService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;


@Service("BeneManageService")

public class BeneManageServiceImpl extends EgovAbstractServiceImpl implements BeneManageService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "BeneManageDAO")
    private BeneManageDAO beneManageDao;

	@Resource(name="fileUtils")
	private FileUtils fileUtils;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
	
    
    @Resource(name = "txManager")
    private DataSourceTransactionManager txManager;
    
    
	@Override
	public Map<String, Object> selectBeneMngList(ScholVO scholVO) throws Exception {
		List<?> list = beneManageDao.selectBeneMngList(scholVO);
		int cnt = beneManageDao.selectScholSpecialListCnt(scholVO);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	
	}
	
	@Override
	public ScholVO selectBeneMngDetail(ScholVO scholVO) {
		
		return beneManageDao.selectBeneMngDetail(scholVO);
	}

	
	@Override
	public Map<String, Object> selectScholItemList(ScholVO scholVO) throws Exception {
		List<?> list = beneManageDao.selectScholItemList(scholVO);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", list);
		
		return map;
	}
	
	
	@Override
	public void updateBeneCk(BeneMngVO beneMngVO) throws Exception {
		
		beneManageDao.updateBeneCk(beneMngVO);
	}
	@Override
	public void updateBeneConfirm(BeneMngVO beneMngVO) throws Exception {
		
		beneManageDao.updateBeneConfirm(beneMngVO);
	}
	@Override
	public void deleteArticle(Schol schol) throws Exception {
		
		beneManageDao.deleteArticle(schol);
		
	}
	@Override
	public void updateBeneMng(BeneMngVO beneMngVO) throws Exception {
		
		beneManageDao.updateBeneMng(beneMngVO);
	}
	@Override
	public List<ScholVO> selectScholItem(ScholVO scholVO) throws Exception{

		return beneManageDao.selectScholItem(scholVO);
	}
}
