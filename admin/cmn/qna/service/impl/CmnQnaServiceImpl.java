package admin.cmn.qna.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import admin.cmn.qna.service.CmnQnaService;
import admin.cmn.qna.service.QnaVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("CmnQnaService")
public class CmnQnaServiceImpl extends EgovAbstractServiceImpl implements CmnQnaService {

	@Resource(name = "CmnQnaDAO")
	private CmnQnaDAO cmnQnaDao;

	/** ID Generation */
	@Resource(name = "egovQnaManageIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Override
	public List<?> selectQnaList(QnaVO searchVO) {
		return cmnQnaDao.selectQnaList(searchVO);
	}

	@Override
	public int selectQnaListCnt(QnaVO searchVO) {
		return cmnQnaDao.selectQnaListCnt(searchVO);
	}

	@Override
	public QnaVO selectQnaDetail(QnaVO qnaVO) throws Exception {
		QnaVO resultVO = cmnQnaDao.selectQnaDetail(qnaVO);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	@Override
	public void updateQnaInqireCo(QnaVO qnaVO) {
		cmnQnaDao.updateQnaInqireCo(qnaVO);
	}

	@Override
	public void insertQna(QnaVO qnaVO) throws FdlException {
;
		
		cmnQnaDao.insertQna(qnaVO);
	}

	@Override
	public void updateQna(QnaVO qnaVO) {
		cmnQnaDao.updateQna(qnaVO);
	}

	@Override
	public void deleteQna(QnaVO qnaVO) {
		cmnQnaDao.deleteQna(qnaVO);
	}

	@Override
	public List<?> selectQnaAnswerList(QnaVO searchVO) {
		return cmnQnaDao.selectQnaAnswerList(searchVO);
	}

	@Override
	public int selectQnaAnswerListCnt(QnaVO searchVO) {
		return cmnQnaDao.selectQnaAnswerListCnt(searchVO);
	}

	@Override
	public void updateQnaAnswer(QnaVO qnaVO) {
		cmnQnaDao.updateQnaAnswer(qnaVO);
	}

}
