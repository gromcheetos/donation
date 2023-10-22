package admin.bene.mng.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import admin.bene.mng.service.BeneMngVO;
import admin.schol.indi.service.Member;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.special.service.Doner;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("BeneManageDAO")
public class BeneManageDAO extends EgovComAbstractDAO{


	@SuppressWarnings("deprecation")
	public List<?> selectBeneMngList(ScholVO scholVO) {
		return selectList("Scholarship.selectBeneMngList", scholVO);
	}

	public int selectScholSpecialListCnt(ScholVO scholVO) {
		return (Integer)selectOne("Scholarship.selectScholIndiListCnt", scholVO);
	}

	public ScholVO selectBeneMngDetail(ScholVO scholVO) {
		return (ScholVO)selectOne("Scholarship.selectBeneMngDetail", scholVO);
	}
	
	public List<?> selectScholItemList(ScholVO scholVO) {
		// TODO Auto-generated method stub
		return selectList("Scholarship.selectScholItemList", scholVO);
	}

	public void updateBeneCk(BeneMngVO beneMngVO){
		update("Scholarship.updateBeneCk", beneMngVO);
	}
	public void updateBeneConfirm(BeneMngVO beneMngVO){
		update("Scholarship.updateBeneConfirm", beneMngVO);
	}
	public void deleteArticle(Schol schol) {
		update("Scholarship.deleteBenefit", schol);		
	}
	
	public void updateBeneMng(BeneMngVO beneMngVO) {
		update("Scholarship.updateBeneMng", beneMngVO);
	}

	public List<ScholVO> selectScholItem(ScholVO scholVO) {

		return selectList("Scholarship.selectScholItem",scholVO );
	}
}