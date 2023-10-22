package admin.schol.special.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
import org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodProcessor;

import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import admin.schol.special.service.ScholSpecialService;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class ScholSpecialController {

	//private static final Logger LOGGER = LoggerFactory.getLogger(ScholIndiController.class);
	
	@Resource(name = "ScholSpecialService")
    private ScholSpecialService scholSpecialService;
    
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
     * 특별장학금 목록을 조회한다.
     * 
     * @param scholVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/schol/special/selectScholSpecialList.do")
    public String selectScholSpecialList(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model ) throws Exception {
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
	
		Map<String, Object> map = scholSpecialService.selectScholSpecialList(scholVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getUniqId());
	    }
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("scholVO", scholVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		/*//서브리스트
		String seq = "";
		
		seq = pramSeq
		if(seq != null || seq ==""){
		
		Map<String, Object> map = scholSpecialService.selectScholSpecialList(seq);
		model.addAttribute("resultList", map.get("resultList"));
		//
		 */
		return "schol/special/ScholSpecialList";
    }
    
    /**
	 * 수혜자목록 가져오기
	 * @param ben_doAppSeq
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/schol/special/beneficiaryAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Object beneficiaryAjax(
			@RequestParam("scholSeq") String scholSeq, ModelMap model) throws Exception {
		
		ScholVO param = new ScholVO();
		
		param.setScholSeq(scholSeq.trim());
		
		List<ScholVO> list = new ArrayList<ScholVO>();
		
		list = scholSpecialService.selectSpecialBenList(param);
		//System.out.println(list.containsValue(benName));
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		
		retVal.put("beneficialy", list); 
	
		retVal.put("count", list.size());
		
		return retVal;
	}
		    
    /**
     * 게시물에 대한 상세목록을 조회한다.
     * 
     * @param scholVO
    
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/schol/special/selectScholSpecialDetail.do")
    public String selectScholSpecialDetail(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("schol") Schol schol, ModelMap model, HttpServletRequest req) throws Exception {
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		scholVO.setScholSeq(req.getParameter("scholSeq")); //seq
		ScholVO vo = scholSpecialService.selectScholSpecialDetail(scholVO);


		model.addAttribute("result", vo);
		//model.addAttribute("sessionUniqId", user.getUniqId());
		
		model.addAttribute("emailId",scholVO.getEmailId());
    	scholVO.setEmailId("emailId");
    	

    	Map<String, Object> doner = scholSpecialService.selectSpecialDonerList(scholVO);
    	
		model.addAttribute("resultList", doner.get("resultList"));
		
		model.addAttribute("ScholVO", scholVO);

		return "schol/special/ScholSpecialDetail";

    }
    

    /**
     * 게시물 등록을 위한 등록페이지로 이동한다.
     * 
     * @param scholVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/schol/special/insertScholSpecialView.do")
    public String insertScholSpecialView(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model) throws Exception {
    	if(!EgovUserDetailsHelper.isAuthenticated()) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "cmm/uat/uia/EgovLoginUsr";
    	}
		model.addAttribute("schol", new ScholVO());
		return "schol/special/ScholSpecialRegist";
		
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
    @RequestMapping("/schol/special/insertArticle.do")
    public String insertArticle(final @ModelAttribute("searchVO") ScholVO scholVO,
	    @ModelAttribute("schol") Schol schol, BindingResult bindingResult, SessionStatus status, 
	    ModelMap model) throws Exception {

		    	schol.setScholNote(unscript(schol.getScholNote()));	// XSS 방지
		    	scholSpecialService.insertArticle(schol);
		   	
			return "forward:/schol/special/selectScholSpecialList.do";						
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
    @RequestMapping("/schol/special/updateScholSpecialView.do")
    public String updateScholSpecialView(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("schol") ScholVO vo, ModelMap model)
	    throws Exception {
		ScholVO indivo = scholSpecialService.selectScholSpecialDetail(scholVO);
	
		model.addAttribute("schol", indivo);
		
			return "schol/special/ScholSpecialUpdt";
		
		
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
    @RequestMapping("/schol/special/updateArticle.do")
    public String updateScholSpecialArticle(@ModelAttribute("searchVO") ScholVO scholVO,
	   @ModelAttribute("schol") Schol schol, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		beanValidator.validate(schol, bindingResult);
		if (bindingResult.hasErrors()) {

		    return "schol/special/ScholSpecialUpdt";
		}

	   		if(schol.getScholCk() == null){ // 장학금 심사중일때 수정시 
	   			schol.setScholCk("0"); 
	   		}
			 
		    schol.setScholNote(unscript(schol.getScholNote()));	// XSS 방지
		    
		    scholSpecialService.updateScholSpecialArticle(schol);
	        

		    return "forward:/schol/special/selectScholSpecialList.do";
	    	
	    }
    /**
     * 확정처리.
     * 
     * @param scholVO
     * @param schol
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/schol/special/updateScholCk.do")
    public String updateScholCk(@ModelAttribute("searchVO") ScholVO scholVO,
	   @ModelAttribute("schol") Schol schol, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {
    	model.addAttribute("scholCk",schol.getScholCk());
		
		//System.out.println(schol.getScholCk());
	    
		if(schol.getScholCk().equals("0")){
			schol.setScholCk("scholCk"); 
	    	scholSpecialService.updateScholCk(schol);
	    	
	    	return "forward:/schol/special/selectScholSpecialList.do";
	    	
	    }else if(schol.getScholCk().equals("1")){
	    	schol.setScholCk("scholCk"); 
	    	scholSpecialService.updateScholConfirm(schol);
	    	
	    	return "forward:/schol/special/selectScholSpecialList.do";
	    }
		 
		return "forward:/schol/special/selectScholSpecialList.do";
    }

    @RequestMapping("/schol/special/closeScholCk.do") //마감처리
    public String closeScholCk(@ModelAttribute("searchVO") ScholVO scholVO,
	   @ModelAttribute("schol") Schol schol, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {
    	model.addAttribute("scholCk",schol.getScholCk());
    	schol.setScholCk("scholCk"); 
    	scholSpecialService.updateScholClosed(schol);
    	return "forward:/schol/special/selectScholSpecialList.do";
    	
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
    @RequestMapping("/schol/special/deleteArticle.do")
    public String deleteSpecialArticle(HttpServletRequest request, @ModelAttribute("searchVO") ScholVO ScholVO, @ModelAttribute("schol") Schol schol,
	    ModelMap model) throws Exception {
				    
	   scholSpecialService.deleteArticle(schol);
		
	   return "forward:/schol/special/selectScholSpecialList.do";			
   }


   /**
     * 수혜자 목록을 조회한다.
     * 
     * @param scholVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    /*@RequestMapping("/schol/special/selectSpecialBenList.do")
    public String selectSpecialBenList(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("schol") Schol schol,  ModelMap model) throws Exception {

		
    	model.addAttribute("dScholItem",schol.getdScholItem());
    	System.out.println(schol.getdScholItem());
    	schol.setdScholItem("dScholItem");

		ScholVO beneficialy = scholSpecialService.selectSpecialBenList(schol);								
		
		model.addAttribute("resultList", beneficialy);
		model.addAttribute("ScholVO", scholVO);
		
		return  "schol/special/ScholSpecialList";
    }*/

}

