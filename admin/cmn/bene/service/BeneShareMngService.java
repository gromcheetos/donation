package admin.cmn.bene.service;

import java.util.Map;

import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;

public interface BeneShareMngService {

	public Map<String, Object> selectBeneShareMngList(ScholVO scholVO) throws Exception;
	public ScholVO selectBeneShareMngDetail(ScholVO scholVO) throws Exception;
	public void deleteShare(Schol schol) throws Exception;

}
