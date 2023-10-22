package admin.cmn.qna.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;
import admin.cmn.qna.service.CmnQnaService;
import admin.cmn.qna.service.QnaVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
//import egovframework.com.cmm.service.EgovFileMngService;
//import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import admin.cmn.qna.service.QnaDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CmnQnaController {
	@Resource(name = "CmnQnaService")
	private CmnQnaService cmnQnaService;
	
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

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
	 * Qna 목록을 조회한다.
	 * @param searchVO
	 * @param model
	 * @return	"/qna/CmnQnaList"
	 * @throws Exception
	 */
	@IncludedInfo(name = "Qna관리", order = 540, gid = 50)
	@RequestMapping(value = "/cmn/qna/selectQnaList.do")
	public String selectQnaList(@ModelAttribute("searchVO") QnaVO searchVO, ModelMap model) throws Exception {
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

		List<?> QnaList = cmnQnaService.selectQnaList(searchVO);
		model.addAttribute("resultList", QnaList);

		int totCnt = cmnQnaService.selectQnaListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cmn/qna/CmnQnaList";
	}
	
	/**
	 * Q&A정보 목록에 대한 상세정보를 조회한다.
	 * @param passwordConfirmAt
	 * @param qnaVO
	 * @param searchVO
	 * @param model
	 * @return	"/qna/CmnQnaDetail"
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/cmn/qna/selectQnaDetail.do")
	public String selectQnaDetail(@RequestParam("qnaSeq") String qnaSeq, QnaVO qnaVO, @ModelAttribute("searchVO") QnaDefaultVO searchVO, ModelMap model) throws Exception {

		qnaVO.setQnaSeq(qnaSeq);
		
		QnaVO vo = cmnQnaService.selectQnaDetail(qnaVO);

		
		model.addAttribute("result", vo);

		return "cmn/qna/CmnQnaDetail";
	}
	
	/**
	 * Q&A정보를 등록하기 위한 전 처리(인증체크)
	 * @param searchVO
	 * @param qnaManageVO
	 * @param model
	 * @return	"/cmn/qna/EgovQnaRegist"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/qna/insertQnaView.do")
	public String insertQnaView(@ModelAttribute("searchVO") QnaVO searchVO, Model model) throws Exception {
			
			model.addAttribute("qnaVO", new QnaVO());
			return "cmn/qna/CmnQnaRegister";
	}
	
	/**
	 * Q&A정보를 등록한다.
	 * @param searchVO
	 * @param qnaVO
	 * @param bindingResult
	 * @return	"forward:/cmn/qna/selectQnaList.do"
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/cmn/qna/insertQna.do")
	public String insertQna(@ModelAttribute("searchVO") QnaVO searchVO, @ModelAttribute("qnaVO") QnaVO qnaVO, BindingResult bindingResult,
			ModelMap model) throws Exception {

		beanValidator.validate(qnaVO, bindingResult);

		if (bindingResult.hasErrors()) {
			return "cmn/qna/CmnQnaRegist";
		}

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		int memNumber = Integer.parseInt(loginVO.getUniqId());
		String qnaName = loginVO.getName();
		
		qnaVO.setMemNumber(memNumber); 
		qnaVO.setQnaName(qnaName);
		
		cmnQnaService.insertQna(qnaVO);

		return "forward:/cmn/qna/selectQnaList.do";
	}
	
	/**
	 * Q&A정보를 수정하기 위한 전 처리
	 * @param qnaVO
	 * @param searchVO
	 * @param model
	 * @return	"/cmn/qna/CmnQnaUpdt
	 * @throws Exception
	 */

	@RequestMapping("/cmn/qna/updateQnaView.do")
	public String updateQnaView(QnaVO qnaVO, @ModelAttribute("searchVO") QnaVO searchVO, ModelMap model) throws Exception {

		QnaVO vo = cmnQnaService.selectQnaDetail(qnaVO);

		model.addAttribute("qnaVO", vo);

		return "cmn/qna/CmnQnaUpdt";
	}
	
	/**
	 * Q&A정보를 수정처리한다.
	 * @param searchVO
	 * @param qnaVO
	 * @param bindingResult
	 * @return	"forward:/cmn/qna/selectQnaList.do"
	 * @throws Exception
	 */

	@RequestMapping("/cmn/qna/updateQna.do")
	public String updateQna(
    		HttpServletRequest request,
			@ModelAttribute("searchVO") QnaVO searchVO,
			@ModelAttribute("qnaVO") QnaVO qnaVO, 
			BindingResult bindingResult) throws Exception {

		// Validation
		beanValidator.validate(qnaVO, bindingResult);

		if (bindingResult.hasErrors()) {
			return "cmn/qna/CmnQnaUpdt";
		}
		
    	

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//String lastUpdusrId = loginVO.getUniqId();
		//System.out.println();
		//int memNumber = Integer.parseInt(loginVO.getUniqId());
		String qnaName = loginVO.getName();
		
		//qnaVO.setMemNumber(memNumber); 
		qnaVO.setQnaName(qnaName);

		cmnQnaService.updateQna(qnaVO);

		return "forward:/cmn/qna/selectQnaList.do";

	}
	
	/**
	 * Q&A정보를 삭제처리한다.
	 * @param qnaVO
	 * @param searchVO
	 * @return	"forward:/cmn/qna/selectQnaList.do"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/qna/deleteQna.do")
	public String deleteQna(
    		HttpServletRequest request,
			QnaVO qnaVO, 
			@ModelAttribute("searchVO") QnaVO searchVO) throws Exception {

    	//--------------------------------------------------------------------------------------------
    	// @ XSS 사용자권한체크 START
    	// param1 : 사용자고유ID(uniqId,esntlId)
    /*	//--------------------------------------------------------
    	LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
    	
    	//step1 DB에서 해당 게시물의 uniqId 조회
    	QnaVO vo = egovQnaService.selectQnaDetail(qnaVO);;
    	
    	//step2 EgovXssChecker 공통모듈을 이용한 권한체크
    	EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
      	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
    	//--------------------------------------------------------
    	// @ XSS 사용자권한체크 END
    	//--------------------------------------------------------------------------------------------
*/    
		cmnQnaService.deleteQna(qnaVO);

		return "forward:/cmn/qna/selectQnaList.do";
	}
	
	/**
	 * Q&A답변정보 목록을 조회한다. (pageing)
	 * @param searchVO
	 * @param model
	 * @return	"/cmn/qna/CmnQnaAnswerList"
	 * @throws Exception
	 */
	@IncludedInfo(name = "Q&A답변관리", order = 551, gid = 50)
	@RequestMapping(value = "/cmn/qna/selectQnaAnswerList.do")
	public String selectQnaAnswerList(@ModelAttribute("searchVO") QnaVO searchVO, ModelMap model) throws Exception {

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

		List<?> QnaAnswerList = cmnQnaService.selectQnaAnswerList(searchVO);
		model.addAttribute("resultList", QnaAnswerList);

		int totCnt = cmnQnaService.selectQnaAnswerListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cmn/qna/EgovQnaAnswerList";
	}
	
	/**
	 * Q&A답변정보 목록에 대한 상세정보를 조회한다.
	 * @param qnaVO
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/qna/EgovQnaAnswerDetail"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/qna/selectQnaAnswerDetail.do")
	public String selectQnaAnswerDetail(QnaVO qnaVO, @ModelAttribute("searchVO") QnaVO searchVO, ModelMap model) throws Exception {

		QnaVO vo = cmnQnaService.selectQnaDetail(qnaVO);

		model.addAttribute("result", vo);

		return "cmn/qna/EgovQnaAnswerDetail";
	}
	
	/**
	 * Q&A답변정보를 수정하기 위한 전 처리(공통코드 처리)
	 * @param qnaVO
	 * @param searchVO
	 * @param model
	 * @return	"/com/qna/EgovQnaAnswerUpdt"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/qna/updateQnaAnswerView.do")
	public String updateQnaAnswerView(QnaVO qnaVO, @ModelAttribute("searchVO") QnaVO searchVO, ModelMap model) throws Exception {

		// 공통코드를 가져오기 위한 Vo
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM028");

		List<?> _result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("qnaProcessSttusCode", _result);

		qnaVO = cmnQnaService.selectQnaDetail(qnaVO);
		model.addAttribute("qnaVO", qnaVO);

		return "cmn/qna/EgovQnaAnswerUpdt";
	}
	
	/**
	 * Q&A답변정보를 수정처리한다.
	 * @param qnaVO
	 * @param searchVO
	 * @return	"forward:/cmn/qna/selectQnaAnswerList.do"
	 * @throws Exception
	 */
	@RequestMapping("/cmn/qna/updateQnaAnswer.do")
	public String updateQnaAnswer(QnaVO qnaVO, @ModelAttribute("searchVO") QnaVO searchVO) throws Exception {

		/*// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String lastUpdusrId = loginVO.getUniqId();
		qnaVO.setLastUpdusrId(lastUpdusrId); // 최종수정자ID
*/
		cmnQnaService.updateQnaAnswer(qnaVO);

		return "forward:/cmn/qna/selectQnaAnswerList.do";

	}
}
