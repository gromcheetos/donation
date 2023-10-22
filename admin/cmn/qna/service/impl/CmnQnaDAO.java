package admin.cmn.qna.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import admin.cmn.qna.service.QnaVO;

@Repository("CmnQnaDAO")
public class CmnQnaDAO extends EgovComAbstractDAO {

	public List<?> selectQnaList(QnaVO searchVO) {
		return selectList("QnaManage.selectQnaList", searchVO);
	}

	public int selectQnaListCnt(QnaVO searchVO) {
		return (Integer) selectOne("QnaManage.selectQnaListCnt", searchVO);
	}

	public QnaVO selectQnaDetail(QnaVO qnaVO) {
		return (QnaVO) selectOne("QnaManage.selectQnaDetail", qnaVO);
	}

	public void updateQnaInqireCo(QnaVO qnaVO) {
		update("QnaManage.updateQnaInqireCo", qnaVO);
	}

	public void insertQna(QnaVO qnaVO) {
		insert("QnaManage.insertQna", qnaVO);
	}

	public void updateQna(QnaVO qnaVO) {
		update("QnaManage.updateQna", qnaVO);
	}

	public void deleteQna(QnaVO qnaVO) {
		delete("QnaManage.deleteQna", qnaVO);
	}

	public List<?> selectQnaAnswerList(QnaVO searchVO) {
		return list("QnaManage.selectQnaAnswerList", searchVO);
	}

	public int selectQnaAnswerListCnt(QnaVO searchVO) {
		return (Integer) selectOne("QnaManage.selectQnaAnswerListCnt", searchVO);
	}

	public void updateQnaAnswer(QnaVO qnaVO) {
		update("QnaManage.updateQnaAnswer", qnaVO);
	}

}
