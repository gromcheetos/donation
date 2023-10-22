package admin.cmn.qna.service;

import java.util.List;

import admin.cmn.qna.service.QnaVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface CmnQnaService {
	List<?> selectQnaList(QnaVO searchVO);

	int selectQnaListCnt(QnaVO searchVO);

	QnaVO selectQnaDetail(QnaVO qnaVO) throws Exception;

	void updateQnaInqireCo(QnaVO qnaVO);

	void insertQna(QnaVO qnaVO) throws FdlException;

	void updateQna(QnaVO qnaVO);

	void deleteQna(QnaVO qnaVO);

	List<?> selectQnaAnswerList(QnaVO searchVO);

	int selectQnaAnswerListCnt(QnaVO searchVO);

	void updateQnaAnswer(QnaVO qnaVO);


}
