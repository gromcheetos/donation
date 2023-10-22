package admin.schol.special.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.special.service.Doner;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
/*import egovframework.com.cop.bbs.service.BoardVO;*/

@Repository("ScholSpecialDAO")
public class ScholSpecialDAO extends EgovComAbstractDAO{


	@SuppressWarnings("deprecation")
	public List<?> selectScholSpecialList(ScholVO scholVO) {
		return list("Scholarship.selectScholSpecialList", scholVO);
	}

	public int selectScholSpecialListCnt(ScholVO scholVO) {
		return (Integer)selectOne("Scholarship.selectScholIndiListCnt", scholVO);
	}

	
	
	public ScholVO selectScholSpecialDetail(ScholVO scholVO) {
		return (ScholVO)selectOne("Scholarship.selectScholSpecialDetail", scholVO);
	}
	
	
	public void insertArticle(Schol schol) {
		insert("Scholarship.insertSpecial", schol);
	}

	
	public void updateScholSpecialArticle(Schol schol) {
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
	public List<?> selectSpecialDonerList(ScholVO scholVO) {
		return list("Scholarship.selectSpecialDonerList", scholVO);
		
	}
	public List<ScholVO> selectSpecialBenList(ScholVO scholVO) {
		return selectList("Scholarship.selectSpecialBenList", scholVO);
		
	}
	


}