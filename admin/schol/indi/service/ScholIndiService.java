package admin.schol.indi.service;

import java.util.List;
import java.util.Map;
import admin.schol.indi.service.MemberVO;
import admin.schol.indi.service.ScholVO;
import admin.schol.indi.service.Schol;
import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface ScholIndiService {
	
	public Map<String, Object> selectScholIndiList(ScholVO scholVO) throws Exception;
	public ScholVO selectScholIndiDetail(ScholVO scholVO) throws Exception;
	public void insertArticle(Schol schol) throws FdlException;
	public void updateScholIndiArticle(Schol schol) throws Exception;
	public void deleteArticle(Schol schol) throws Exception;
	public void updateScholCk(Schol schol) throws Exception;
	public void updateScholConfirm(Schol schol )throws Exception;
	/*public Map<String, Object> selectDonerId(MemberVO memberVO)throws Exception;*/
	public Map<String, Object> selectDonerId(Member member) throws Exception;
}
