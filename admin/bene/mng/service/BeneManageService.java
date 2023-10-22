package admin.bene.mng.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import java.util.List;
public interface BeneManageService {
	
	public Map<String, Object> selectBeneMngList(ScholVO scholVO) throws Exception;
	public ScholVO selectBeneMngDetail(ScholVO scholVO) throws Exception;
	public void updateBeneCk(BeneMngVO beneMngVO) throws Exception;
	public void updateBeneConfirm(BeneMngVO beneMngVO )throws Exception;
	public Map<String, Object> selectScholItemList(ScholVO scholVO)throws Exception;
	public void deleteArticle(Schol schol) throws Exception;
	public void updateBeneMng(BeneMngVO beneMngVO) throws Exception;
	public List<ScholVO> selectScholItem(ScholVO scholVO) throws Exception;

}
