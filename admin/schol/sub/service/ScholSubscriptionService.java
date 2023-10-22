package admin.schol.sub.service;

import java.util.Map;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import java.util.List;
public interface ScholSubscriptionService {
	
	public Map<String, Object> selectScholSubList(ScholVO scholVO) throws Exception;
	public List<ScholVO> selectSubBenList(ScholVO scholVO)throws Exception;
	public ScholVO selectScholSubDetail(ScholVO scholVO) throws Exception;
	public Map<String, Object> selectSubDonerList(ScholVO scholVO)throws Exception;
	public void updateScholCk(Schol schol) throws Exception;
	public void updateScholConfirm(Schol schol )throws Exception;
	public void updateScholClosed(Schol schol)throws Exception;
	public void insertArticle(Schol schol) throws FdlException;
	public void updateScholSubArticle(Schol schol) throws Exception;
	public void deleteArticle(Schol schol) throws Exception;
		
	
}
