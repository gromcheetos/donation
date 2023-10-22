package admin.schol.indi.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import admin.schol.indi.service.ScholVO;
import admin.schol.indi.service.Member;
import admin.schol.indi.service.MemberVO;
import admin.schol.indi.service.Schol;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
/*import egovframework.com.cop.bbs.service.Board;*/
/*import egovframework.com.cop.bbs.service.BoardVO;*/

@Repository("ScholIndiDAO")
public class ScholIndiDAO extends EgovComAbstractDAO {

	@SuppressWarnings("deprecation")
	public List<?> selectScholIndiList(ScholVO scholVO) {
		return list("Scholarship.selectScholIndiList", scholVO);
	}

	public int selectScholIndiListCnt(ScholVO scholVO) {
		return (Integer)selectOne("Scholarship.selectScholIndiListCnt", scholVO);
	}

	public ScholVO selectScholIndiDetail(ScholVO scholVO) {
		return (ScholVO)selectOne("Scholarship.selectScholIndiDetail", scholVO);
	}
	
	
	public void insertArticle(Schol schol) {
		insert("Scholarship.insertArticle", schol);
	}

	
	public void updateScholIndiArticle(Schol schol) {
		update("Scholarship.updateArticle", schol);
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
	
	/*public int selectLoginUser(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectLoginUser", boardVO);
	}*/

	public List<?> selectDonerId(Member member) {
		// TODO Auto-generated method stub
		return selectList("Member.selectDonerId", member);
	}


}
