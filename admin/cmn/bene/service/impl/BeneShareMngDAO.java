package admin.cmn.bene.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("BeneShareMngDAO")
public class BeneShareMngDAO extends EgovComAbstractDAO{

	@SuppressWarnings("deprecation")
	public List<?> selectBeneShareMngList(ScholVO scholVO) {
		return list("Scholarship.selectBeneShareList", scholVO);
	}

	public int selectBeneShareMngListCnt(ScholVO scholVO) {
		return (Integer)selectOne("Scholarship.selectScholIndiListCnt", scholVO);
	}
	public ScholVO selectBeneShareMngDetail(ScholVO scholVO) {
		return (ScholVO)selectOne("Scholarship.selectBeneShareDetail", scholVO);
	}
	public void deleteShare(Schol schol) {
		update("Scholarship.deleteShare", schol);
		
	}
}
