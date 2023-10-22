package admin.schol.indi.web;



	import java.io.BufferedReader;
	import java.io.InputStreamReader;
	import java.net.URL;
	import java.net.URLEncoder;
	import java.util.ArrayList;
	import java.util.HashMap;
	import java.util.List;
	import java.util.Map;

	import javax.annotation.Resource;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.ModelMap;
	import org.springframework.validation.BindingResult;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
	import org.springmodules.validation.commons.DefaultBeanValidator;
	import admin.schol.indi.service.ScholIndiService;
	import egovframework.com.cmm.EgovMessageSource;
	import egovframework.com.cmm.LoginVO;
	import egovframework.com.cmm.util.EgovUserDetailsHelper;
	//import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.rte.fdl.property.EgovPropertyService;
	import egovframework.rte.fdl.string.EgovStringUtil;
	import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import admin.schol.indi.service.Member;
import admin.schol.indi.service.MemberVO;
import admin.schol.indi.service.Schol;
	import admin.schol.indi.service.ScholVO;

	/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author KHN
 * @since 2019.12.02

 */

@Controller
public class ScholIndiController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ScholIndiController.class);
	
	@Resource(name = "ScholIndiService")
private ScholIndiService scholIndiService;

@Resource(name = "propertiesService")
protected EgovPropertyService propertyService;

@Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
  

    @Autowired
    private DefaultBeanValidator beanValidator;

    //protected Logger log = Logger.getLogger(this.getClass());

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
 * 게시물에 대한 목록을 조회한다.
 * 
 * @param boardVO
 * @param sessionVO
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/selectScholIndiList.do")
public String selectScholIndiList(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model) throws Exception {
	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	scholVO.setPageUnit(propertyService.getInt("pageUnit"));
	scholVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(scholVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(scholVO.getPageUnit());
	paginationInfo.setPageSize(scholVO.getPageSize());

	scholVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	scholVO.setLastIndex(paginationInfo.getLastRecordIndex());
	scholVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = scholIndiService.selectScholIndiList(scholVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	
	paginationInfo.setTotalRecordCount(totCnt);

	if(user != null) {
    	model.addAttribute("sessionUniqId", user.getUniqId());
    }
	
	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("scholVO", scholVO);
	model.addAttribute("paginationInfo", paginationInfo);
	
	return "schol/indi/ScholIndiList";
}



/**
 * 게시물에 대한 상세 정보를 조회한다.
 * 
 * @param scholVO
 * @param sessionVO
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/selectScholIndiDetail.do")
public String selectScholIndiDetail(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model, HttpServletRequest req) throws Exception {
	//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	scholVO.setScholSeq(req.getParameter("scholSeq")); //seq

	ScholVO vo = scholIndiService.selectScholIndiDetail(scholVO);
	
	model.addAttribute("result", vo);
	//model.addAttribute("sessionUniqId", user.getUniqId());
	

	return "schol/indi/ScholIndiDetail";
}

/**
 * 게시물 등록을 위한 등록페이지로 이동한다.
 * 
 * @param scholVO
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/insertScholIndiView.do")
public String insertScholIndiView(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model) throws Exception {

	model.addAttribute("scholVO", new ScholVO());
	return "schol/indi/ScholIndiRegist";
	
}

/**
 * 게시물을 등록한다.
 * 
 * @param scholVO
 * @param schol
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/insertArticle.do")
public String insertArticle(final @ModelAttribute("searchVO") ScholVO scholVO,
    @ModelAttribute("schol") Schol schol, BindingResult bindingResult, SessionStatus status, 
    ModelMap model) throws Exception {
    	schol.setScholNote(unscript(schol.getScholNote()));	// XSS 방지
	    scholIndiService.insertArticle(schol);
	
		return "forward:/schol/indi/selectScholIndiList.do";						
    }

   
    /**
 * 게시물 수정을 위한 수정페이지로 이동한다.
 * 
 * @param scholVO
 * @param vo
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/updateScholIndiView.do")
public String updateScholIndiView(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("scholVO") ScholVO vo, ModelMap model, HttpServletRequest request)
    throws Exception {
	
	scholVO.setScholSeq(request.getParameter("scholSeq"));
	ScholVO indivo = scholIndiService.selectScholIndiDetail(scholVO);
	
	//System.out.println("####  indivo.getMemName() ### >>>"+indivo.getMemName());

	model.addAttribute("scholVO", indivo);

	return "schol/indi/ScholIndiUpdt";		
}

/**
 * 게시물에 대한 내용을 수정한다.
 * 
 * @param scholVO
 * @param schol
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/updateArticle.do")
public String updateScholIndiArticle(@ModelAttribute("scholVO") ScholVO scholVO, BindingResult bindingResult)throws Exception {

	beanValidator.validate(scholVO, bindingResult);
	if (bindingResult.hasErrors()) {
		System.out.println("============");
        bindingResult.getAllErrors().forEach(c ->{
            System.out.println(c.toString());
        });
	    return "schol/indi/ScholIndiUpdt";
	}
	    
	    scholIndiService.updateScholIndiArticle(scholVO);
        

	    return "forward:/schol/indi/selectScholIndiList.do";
    	
    }
/**
 * 확정처리
 * 
 * @param scholVO
 * @param schol
 * @param model
 * @return
 * @throws Exception
 */
@RequestMapping("/schol/indi/updateScholCk.do")
public String updateScholCk(@ModelAttribute("searchVO") ScholVO scholVO,
   @ModelAttribute("schol") Schol schol, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {
	model.addAttribute("scholCk",schol.getScholCk());
	
    
	if(schol.getScholCk().equals("0")){
		schol.setScholCk("scholCk"); 
    	scholIndiService.updateScholCk(schol);
    	
    	return "forward:/schol/indi/selectScholIndiList.do";
    	
    }else if(schol.getScholCk().equals("1")){
    	schol.setScholCk("scholCk"); 
    	scholIndiService.updateScholConfirm(schol);
    	
    	return "forward:/schol/indi/selectScholIndiList.do";
    }
	 
	return "forward:/schol/indi/selectScholIndiList.do";
}

/**
 * 게시물에 대한 내용을 삭제한다.
 * 
 * @param ScholVO
 * @param schol
 * @param model
 * @return
 * @throws Exception
 */
   @RequestMapping("/schol/indi/deleteArticle.do")
public String deleteBoardArticle(HttpServletRequest request, @ModelAttribute("searchVO") ScholVO ScholVO, @ModelAttribute("schol") Schol schol,
    ModelMap model) throws Exception {
			    
		scholIndiService.deleteArticle(schol);
	

		return "forward:/schol/indi/selectScholIndiList.do";
	
   }

   /**
 * 모달조회
 * @return String
 * @exception Exception
 */
@RequestMapping(value="/schol/indi/EgovModal.do")
public String selectDonerIdModal(@ModelAttribute("searchVO") Member member, MemberVO memberVO, ModelMap model)  throws Exception {
    	
	return "schol/indi/DonerNamePop";
}


@RequestMapping(value = "/schol/indi/DonerIdList.do")
public String selectDonerId(@ModelAttribute("searchVO")Member member, @ModelAttribute("memberVO") MemberVO memberVO, ModelMap model, SessionStatus status) throws Exception {
	/*member.setPageUnit(propertyService.getInt("pageUnit"));
	member.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();
	
	paginationInfo.setCurrentPageNo(member.getPageIndex());
	paginationInfo.setRecordCountPerPage(member.getPageUnit());
	paginationInfo.setPageSize(member.getPageSize());

	member.setFirstIndex(paginationInfo.getFirstRecordIndex());
	member.setLastIndex(paginationInfo.getLastRecordIndex());
	member.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());*/


	model.addAttribute("emailId",member.getEmailId());
	System.out.println(member.getEmailId());
	Map<String, Object> map = scholIndiService.selectDonerId(member);
	//int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
	
	//paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("member", member);
	model.addAttribute("resultCnt", map.get("resultCnt"));
	//model.addAttribute("paginationInfo", paginationInfo);


	return "schol/indi/DonerNamePop";
		}
	    

	    
	   
	    



}
