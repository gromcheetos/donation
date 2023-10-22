package admin.cmn.notice.web;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
//import egovframework.cop.bbs.service.Board;
//import egovframework.cop.bbs.service.BoardMaster;
//import egovframework.cop.bbs.service.BoardMasterVO;
//import egovframework.cop.bbs.service.BoardVO;
//import egovframework.cop.bbs.service.EgovBBSAttributeManageService;
//import egovframework.cop.bbs.service.EgovBBSManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import admin.cmn.notice.service.CmnNoticeService;
import admin.cmn.notice.service.Board;
import admin.cmn.notice.service.BoardVO;
import admin.cmn.notice.service.BoardMaster;
import admin.cmn.notice.service.BoardMasterVO;

/**
 * 공지사항 관리를 위한 컨트롤러 클래스
 * @author SSY
 * @since 2019.11.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2019.11.26  SSY          최초 생성
 *
 *  </pre>
 */
@Controller
public class CmnNoticeController {

    @Resource(name = "CmnNoticeService")
    private CmnNoticeService cmnNoticeService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;


    @Autowired
    private DefaultBeanValidator beanValidator;

    /**
     * XSS 방지 처리.
     *
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

    /**
     * 공지사항목록 가져오기
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/list.do")
    public String selectCmnNoticeList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	//boardVO.setBbsId(boardVO.getBbsId());
    	boardVO.setBbsNm(boardVO.getBbsNm());

    	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
    	boardVO.setPageSize(propertyService.getInt("pageSize"));

    	PaginationInfo paginationInfo = new PaginationInfo();

    	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
    	paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
    	paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = cmnNoticeService.selectNoticeList(boardVO);
		
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);


		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("paginationInfo", paginationInfo);

		return "cmn/notice/CmnNoticeList";
    }

    /**
     * 공지사항에 대한 상세 정보를 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/view.do")
    public String selectCmnNoticeView(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	LoginVO user = new LoginVO();

    	if(EgovUserDetailsHelper.isAuthenticated()){
	    	user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		}

		BoardVO vo = cmnNoticeService.selectCmnNoticeView(boardVO);

		model.addAttribute("result", vo);

		return "cmn/notice/CmnNoticeView";
    }

    /**
     * 공지사항 등록을 위한 등록페이지 호출
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/insertView.do")
    public String cmnNoticeInsertView(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	// 사용자권한 처리
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "cmm/uat/uia/EgovLoginUsr";
    	}

    	return "cmn/notice/CmnNoticeRegist";
    }
    
    /**
     * 공지사항등록
     * @param boardVO
     * @param board
     * @param bindingResult
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/insert.do")
    public String insertCmnNotice(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, 
    		BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
    	//사용자권한 처리
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "cmm/uat/uia/EgovLoginUsr";
    	}

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    	beanValidator.validate(board, bindingResult);
    	
    	if (bindingResult.hasErrors()) {
    		return "cmn/notice/CmnNoticeRegist";
    	}

    	if (isAuthenticated) {
    		board.setFrstRegisterId(user.getId());

    		board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

    		cmnNoticeService.insertCmnNotice(board);
    	}

    	status.setComplete();
    	
    	return "forward:/cmn/notice/list.do";
    }


    /**
     * 공지사항 수정을 위한 수정페이지로 이동한다.
     *
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/updateView.do")
    public String selectCmnNoticeUpdateView(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

    	// 사용자권한 처리 (자유게시판에 대한 요청이 아닌 경우는 로긴화면으로 이동)
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "cmm/uat/uia/EgovLoginUsr";
    	}

    	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    	BoardVO bdvo = new BoardVO();

    	if (isAuthenticated) {
    		bdvo = cmnNoticeService.selectCmnNoticeView(boardVO);
    	}

    	model.addAttribute("result", bdvo);

    	return "cmn/notice/CmnNoticeUpdt";
    }

    /**
     * 게시물에 대한 내용을 수정한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/update.do")
    public String updateCmnNotice(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

    	// 사용자권한 처리
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "cmm/uat/uia/EgovLoginUsr";
    	}

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();


    	beanValidator.validate(board, bindingResult);
    	if (bindingResult.hasErrors()) {
    		BoardVO bdvo = new BoardVO();
    		bdvo = cmnNoticeService.selectCmnNoticeView(boardVO);
    		model.addAttribute("result", bdvo);
    		return "cmn/notice/CmnNoticeUpdt";
    	}

    	if (isAuthenticated) {
    		board.setLastUpdusrId(user.getId());
    		board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
    		cmnNoticeService.updateCmnNotice(board);
    	}

    	return "forward:/cmn/notice/list.do";
    }

    /**
     * 게시물에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/notice/delete.do")
    public String deleteCmnNotice(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, ModelMap model) throws Exception {

    	// 사용자권한 처리
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "cmm/uat/uia/EgovLoginUsr";
    	}

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

    	if (isAuthenticated) {
    		board.setLastUpdusrId(user.getId());
    		cmnNoticeService.deleteCmnNotice(board);
    	}

    	return "forward:/cmn/notice/list.do";
    }

}
