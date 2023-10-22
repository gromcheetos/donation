package admin.schol.sub.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.special.service.Doner;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("ScholSubscriptionDAO")
public class ScholSubscriptionDAO extends EgovComAbstractDAO{


	@SuppressWarnings("deprecation")
	public List<?> selectScholSubList(ScholVO scholVO) {
		return list("Scholarship.selectScholSubList", scholVO);
	}

	public int selectScholSpecialListCnt(ScholVO scholVO) {
		return (Integer)selectOne("Scholarship.selectScholIndiListCnt", scholVO);
	}

	public ScholVO selectScholSubDetail(ScholVO scholVO) {
		return (ScholVO)selectOne("Scholarship.selectScholSpecialDetail", scholVO);
	}
		
	public void insertArticle(Schol schol) {
		insert("Scholarship.insertSubscription", schol);
	}	
	public void updateScholSubArticle(Schol schol) {
		update("Scholarship.updateSpecial", schol);
	}
	
	public void deleteArticle(Schol schol) {
		update("Scholarship.deleteArticle", schol);		
	}
	
	public void updateScholCk(Schol schol){
		update("Scholarship.updateScholCk", schol);
	}
	public void updateScholConfirm(Schol schol){
		update("Scholarship.updateScholConfirm", schol);
	}

	public void updateScholClosed(Schol schol) {
		update("Scholarship.updateScholClosed", schol);
	}

	@SuppressWarnings("deprecation")
	public List<?>  selectSubDonerList(ScholVO scholVO) {
		return list("Scholarship.selectSpecialDonerList", scholVO);
		
	}
	public List<ScholVO> selectSubBenList(ScholVO scholVO) {
		return selectList("Scholarship.selectSpecialBenList", scholVO);
		
	}
	


}