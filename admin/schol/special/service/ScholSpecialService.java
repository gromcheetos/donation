package admin.schol.special.service;

import java.util.Map;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import java.util.List;
public interface ScholSpecialService {
	
	public Map<String, Object> selectScholSpecialList(ScholVO scholVO) throws Exception;
	public ScholVO selectScholSpecialDetail(ScholVO scholVO) throws Exception;
	public void insertArticle(Schol schol) throws FdlException;
	public void updateScholSpecialArticle(Schol schol) throws Exception;
	public void deleteArticle(Schol schol) throws Exception;
	public void updateScholCk(Schol schol) throws Exception;
	public void updateScholConfirm(Schol schol )throws Exception;
	public void updateScholClosed(Schol schol)throws Exception;
	public Map<String, Object> selectSpecialDonerList(ScholVO scholVO)throws Exception;
	
	public List<ScholVO> selectSpecialBenList(ScholVO scholVO)throws Exception;
	
}
