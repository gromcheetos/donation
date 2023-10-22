package admin.cmn.faq.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import admin.cmn.faq.service.EgovFaqService;
import admin.cmn.faq.service.FaqVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
*
* FAQ내용을 처리하는 비즈니스 구현 클래스
* @author KHN

*/

@Controller
public class EgovFaqController {
	
	@Resource(name = "EgovFaqService")
	private EgovFaqService egovFaqService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	// Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/**
	 * FAQ 목록을 조회한다.
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqList"
	 * @throws Exception
	 */
	@IncludedInfo(name = "FAQ관리", order = 540, gid = 50)
	@RequestMapping(value = "/cmn/faq/selectFaqList.do")
	public String selectFaqList(@ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.SiteList */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> FaqList = egovFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", FaqList);

		int totCnt = egovFaqService.selectFaqListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cmn/faq/EgovFaqList";
	}
	
	/**
	 * FAQ 목록에 대한 상세정보를 조회한다.
	 * @param faqVO
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqDetail"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/selectFaqDetail.do")
	public String selectFaqDetail(FaqVO faqVO, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		FaqVO vo = egovFaqService.selectFaqDetail(searchVO);

		model.addAttribute("result", vo);

		return "cmn/faq/EgovFaqDetail";
	}
	
	/**
	 * FAQ를 등록하기 위한 전 처리
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqRegist"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/insertFaqView.do")
	public String insertFaqView(@ModelAttribute("searchVO") FaqVO searchVO, Model model) throws Exception {

		model.addAttribute("faqVO", new FaqVO());

		return "cmn/faq/EgovFaqRegist";

	}
	
	/**
	 * FAQ를 등록한다.
	 * @param multiRequest
	 * @param searchVO
	 * @param faqVO
	 * @param bindingResult
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/insertFaq.do")
	public String insertFaqCn(@ModelAttribute("searchVO") FaqVO searchVO, @ModelAttribute("faqManageVO") FaqVO faqVO, BindingResult bindingResult) throws Exception {
		

		beanValidator.validate(faqVO, bindingResult);

		if (bindingResult.hasErrors()) {
			return "cmn/faq/EgovFaqRegist";
		}
		

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		String frstRegisterId = loginVO.getUniqId();

		faqVO.setFrstRegisterId(frstRegisterId); // 최초등록자ID
		faqVO.setLastUpdusrId(frstRegisterId); // 최종수정자ID
		
		egovFaqService.insertFaq(faqVO);
		
		return "forward:/cmn/faq/selectFaqList.do";
	}
	
	/**
	 * FAQ를 수정하기 위한 전 처리
	 * @param faqId
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqUpdt"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/updateFaqView.do")
	public String updateFaqView(@RequestParam("faqId") String faqId, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		FaqVO faqVO = new FaqVO();

		// Primary Key 값 세팅
		faqVO.setFaqId(faqId);

		// 변수명은 CoC 에 따라 JSTL사용을 위해
		model.addAttribute("faqVO", egovFaqService.selectFaqDetail(faqVO));

		return "cmn/faq/EgovFaqUpdt";
	}

	/**
	 * FAQ를 수정처리한다.
	 * @param atchFileAt
	 * @param multiRequest
	 * @param searchVO
	 * @param faqVO
	 * @param bindingResult
	 * @param model
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/updateFaq.do")
	public String updateFaqCn(@ModelAttribute("searchVO") FaqVO searchVO, @ModelAttribute("faqVO") FaqVO faqVO, BindingResult bindingResult, ModelMap model) throws Exception {

		// Validation
		beanValidator.validate(faqVO, bindingResult);
		if (bindingResult.hasErrors()) {
			return "cmn/faq/EgovFaqUpdt";
		}

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String lastUpdusrId = loginVO.getUniqId();
		faqVO.setLastUpdusrId(lastUpdusrId); // 최종수정자ID

		egovFaqService.updateFaq(faqVO);

		return "forward:/cmn/faq/selectFaqList.do";

	}

	/**
	 * FAQ를 삭제처리한다.
	 * @param faqVO
	 * @param searchVO
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/faq/deleteFaq.do")
	public String deleteFaq(FaqVO faqVO, @ModelAttribute("searchVO") FaqVO searchVO) throws Exception {

		egovFaqService.deleteFaq(faqVO);

		return "forward:/cmn/faq/selectFaqList.do";
	}
	
}
