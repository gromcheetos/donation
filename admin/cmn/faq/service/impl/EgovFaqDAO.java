package admin.cmn.faq.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import admin.cmn.faq.service.FaqVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("EgovFaqDAO")
public class EgovFaqDAO extends EgovComAbstractDAO {

	public List<?> selectFaqList(FaqVO searchVO) {
		return selectList("FaqManage.selectFaqList", searchVO);
	}

	public int selectFaqListCnt(FaqVO searchVO) {
		return (Integer) selectOne("FaqManage.selectFaqListCnt", searchVO);
	}

	public void updateFaqInqireCo(FaqVO searchVO) {
		update("FaqManage.updateFaqInqireCo", searchVO);
	}

	public FaqVO selectFaqDetail(FaqVO searchVO) {
		return (FaqVO) selectOne("FaqManage.selectFaqDetail", searchVO);
	}

	public void insertFaq(FaqVO faqVO) {
		insert("FaqManage.insertFaq", faqVO);
	}

	public void updateFaq(FaqVO faqVO) {
		update("FaqManage.updateFaq", faqVO);
	}

	public void deleteFaq(FaqVO faqVO) {
		delete("FaqManage.deleteFaq", faqVO);
	}

}
