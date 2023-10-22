package admin.cmn.bene.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;
import admin.schol.indi.service.Schol;

import admin.cmn.bene.service.BeneShareMngService;
import admin.schol.indi.service.ScholVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class BeneShareMngController {

	
	@Resource(name = "BeneShareMngService")
    private BeneShareMngService beneShareMngService;
    
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
     * 수혜자 후기 목록을 조회한다.
     * 
     * @param scholVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/bene/sharelist.do")
    public String selectBeneShareMngList(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model) throws Exception {
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		scholVO.setPageUnit(propertyService.getInt("pageUnit"));
		scholVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(scholVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(scholVO.getPageUnit());
		paginationInfo.setPageSize(scholVO.getPageSize());
	
		scholVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		scholVO.setLastIndex(paginationInfo.getLastRecordIndex());
		scholVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = beneShareMngService.selectBeneShareMngList(scholVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		/*if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getUniqId());
	    }*/
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("scholVO", scholVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "cmn/bene/BeneShareList";
    }
    
    
   
    /**
     * 수혜자 후기 상세 정보를 조회한다.
     * 
     * @param scholVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmn/bene/BeneShareMngDetail.do")
    public String selectBeneShareMngDetail(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model, HttpServletRequest req) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		scholVO.setShareSeq(req.getParameter("shareSeq")); //seq

		ScholVO vo = beneShareMngService.selectBeneShareMngDetail(scholVO);
		
		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());
		

		return "cmn/bene/BeneShareDetail";
    }
    
    

    


    /**
     * 수혜자 후기 내용을 삭제한다.
     * 
     * @param ScholVO
     * @param schol
     * @param model
     * @return
     * @throws Exception
     */
   @RequestMapping("/cmn/bene/deleteShare.do")
    public String deleteShare(HttpServletRequest request, @ModelAttribute("searchVO") ScholVO ScholVO, @ModelAttribute("schol") Schol schol,
	    ModelMap model) throws Exception {
				    
	   beneShareMngService.deleteShare(schol);
		

			return "forward:/cmn/bene/sharelist.do";
	
   }
}
