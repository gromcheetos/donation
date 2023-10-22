package admin.cmn.faq.service;

import java.util.List;

import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface EgovFaqService {

	List<?> selectFaqList(FaqVO searchVO);

	int selectFaqListCnt(FaqVO searchVO);

	FaqVO selectFaqDetail(FaqVO searchVO) throws Exception;

	void insertFaq(FaqVO faqVO);

	void updateFaq(FaqVO faqVO);

	void deleteFaq(FaqVO faqVO);

}
