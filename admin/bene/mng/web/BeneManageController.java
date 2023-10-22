package admin.bene.mng.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import admin.bene.mng.service.BeneManageService;
import admin.bene.mng.service.BeneMngVO;
import admin.common.web.CommandMap;
import admin.schol.indi.service.Schol;
import admin.schol.indi.service.ScholVO;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller


public class BeneManageController {
	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;


	Logger log = Logger.getLogger(this.getClass());
	
			@Resource(name = "BeneManageService")
		    private BeneManageService beneManageService;
		    
		    @Resource(name = "propertiesService")
		    protected EgovPropertyService propertyService;
		    
		    @Resource(name="egovMessageSource")
		    EgovMessageSource egovMessageSource;
		  
		    @Resource(name = "EgovFileMngService")
			private EgovFileMngService fileService;
		  		    
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
		     * 수혜자신청 목록을 조회한다.
		     * 
		     * @param scholVO
		     * @param sessionVO
		     * @param model
		     * @return
		     * @throws Exception
		     */
		    @RequestMapping("/bene/mng/selectBeneMngList.do")
		    public String selectBeneMngList(@ModelAttribute("searchVO") ScholVO scholVO, ModelMap model ) throws Exception {

				scholVO.setPageUnit(propertyService.getInt("pageUnit"));
				scholVO.setPageSize(propertyService.getInt("pageSize"));
			
				PaginationInfo paginationInfo = new PaginationInfo();
				
				paginationInfo.setCurrentPageNo(scholVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(scholVO.getPageUnit());
				paginationInfo.setPageSize(scholVO.getPageSize());
			
				scholVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				scholVO.setLastIndex(paginationInfo.getLastRecordIndex());
				scholVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
				
				scholVO.setBenAppField(scholVO.getBenAppField());
				System.out.println(scholVO.getBenAppField());

				//장학금신청분야코드 조회
				ComDefaultCodeVO vo = new ComDefaultCodeVO();
				vo.setCodeId("COM014");
				//vo.setCodeNm("codeNm");
				
				List<?> list = cmmUseService.selectCmmCodeDetail(vo);
				
				Map<String, Object> map = beneManageService.selectBeneMngList(scholVO);
				int totCnt = Integer.parseInt((String)map.get("resultCnt"));
				
				
				paginationInfo.setTotalRecordCount(totCnt);
			
				model.addAttribute("item", list);
				model.addAttribute("resultList", map.get("resultList"));
				model.addAttribute("resultCnt", map.get("resultCnt"));
				model.addAttribute("scholVO", scholVO);
				model.addAttribute("paginationInfo", paginationInfo);
				return "bene/BeneManageList";
		    }
		    /**
		     * 수혜신청 상세목록을 조회한다.
		     * 
		     * @param scholVO
		    
		     * @param model
		     * @return
		     * @throws Exception
		     */
		    @RequestMapping("/bene/mng/selectBeneMngDetail.do")
		    public String selectBeneMngDetail(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("schol") Schol schol, ModelMap model, HttpServletRequest req) throws Exception {
		    	scholVO.setScholSeq(req.getParameter("scholSeq")); //seq
				model.addAttribute("benAppSeq",schol.getBenAppSeq());
				schol.setBenAppSeq("benAppSeq");
				//System.out.println(getBenAppSeq());
		    	//Map<String, Object> map = beneManageService.selectScholItemList(scholVO); //장학금 상위분류
				//장학금신청분야코드 조회

		 				
				ScholVO detail = beneManageService.selectBeneMngDetail(scholVO);

				model.addAttribute("result", detail);
				model.addAttribute("scholVO", scholVO);
				model.addAttribute("scholSeq",scholVO.getScholSeq());
		    	
				scholVO.setScholSeq("scholSeq");

				return "bene/BeneManageDetail";
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
		    @RequestMapping("/bene/mng/updateBeneCk.do")
		    public String updateBeneCk(@ModelAttribute("searchVO") ScholVO scholVO,
			   @ModelAttribute("beneMngVO") BeneMngVO beneMngVO, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {
		    	model.addAttribute("benAppSeq",beneMngVO.getBenAppSeq());
		    	model.addAttribute("benCk",beneMngVO.getBenCk());
		    	model.addAttribute("scholGubun",beneMngVO.getScholGubun());
		    	model.addAttribute("benAppField",beneMngVO.getBenAppField());
		   
				if(beneMngVO.getBenCk().equals("0")){
					beneMngVO.setBenCk("benCk");
					beneMngVO.setScholGubun(beneMngVO.getScholGubun()); 
					beneMngVO.setBenAppField(beneMngVO.getBenAppField());
					
			    	beneManageService.updateBeneCk(beneMngVO);
			    	
			    	return "forward:/bene/mng/selectBeneMngList.do";
			    	
			    }else if(beneMngVO.getBenCk().equals("1")){
			    	beneMngVO.setBenCk("benCk");
			    	//schol.setScholGubun("scholGubun");
			    	//schol.setBenAppField("benAppField");
			    	beneManageService.updateBeneConfirm(beneMngVO);
			    	
			    	return "forward:/bene/mng/selectBeneMngList.do";
			    }
				 
				return "forward:/bene/mng/selectBeneMngList.do";
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
		   @RequestMapping("/bene/mng/deleteArticle.do")
		    public String deleteSpecialArticle(HttpServletRequest request, @ModelAttribute("searchVO") ScholVO ScholVO, @ModelAttribute("schol") Schol schol,
			    ModelMap model) throws Exception {
						    
					beneManageService.deleteArticle(schol);
				

					return "forward:/bene/mng/selectBeneMngList.do";			
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
		   @RequestMapping("/bene/mng/updateBeneMngView.do")
		   public String updateBeneMngView(@ModelAttribute("searchVO") ScholVO scholVO, @ModelAttribute("beneMngVO") BeneMngVO vo, ModelMap model, HttpServletRequest request)
		       throws Exception {
			ComDefaultCodeVO bscholvo = new ComDefaultCodeVO();

		   	scholVO.setBenAppSeq(request.getParameter("benAppSeq"));
			ScholVO detail = beneManageService.selectBeneMngDetail(scholVO);
			
	    	bscholvo.setCodeId("COM002");
	    	List<?> com002 = cmmUseService.selectCmmCodeDetail(bscholvo);
	    	
			model.addAttribute("combo1", com002);
		   	model.addAttribute("beneMngVO", detail);

		   	return "bene/BeneManageUpdt";		
		   }
		   
		    
		    /**
			 * 장학금 하위분류 ajax
			 * @param scholGubun
			 * @param model
			 * @return
			 * @throws Exception
			 */
			@RequestMapping(value="/bene/mng/getSub.do", method=RequestMethod.POST)
			@ResponseBody
			public Object scholItemAjax(
					@RequestParam("scholGubun") String scholGubun, ModelMap model, @ModelAttribute("schol") Schol schol) throws Exception {
				
				ScholVO param = new ScholVO();
				
				param.setScholGubun(scholGubun.trim());
				List<ScholVO> list = new ArrayList<ScholVO>();
				list = beneManageService.selectScholItem(param);
				
				Map<String, Object> retVal = new HashMap<String, Object>();
				
				retVal.put("item", list); 
				
				retVal.put("count", list.size());
				
				return retVal;
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
		   @RequestMapping("/bene/mng/updateBeneMng.do")
		   public String updateBeneMng(@ModelAttribute("searchVO") ScholVO scholVO,
		      @ModelAttribute("beneMngVO") BeneMngVO beneMngVO, BindingResult bindingResult) throws Exception {
			   	//System.out.println("benAppSeq>>>"+beneMngVO.getBenAppSeq());
		   	beanValidator.validate(beneMngVO, bindingResult);
		   	if (bindingResult.hasErrors()) {   
		   		System.out.println("============");
	            bindingResult.getAllErrors().forEach(c ->{
	                System.out.println(c.toString());
	            });

		   		return "bene/BeneManageUpdt";		
		   	}
		   		if(beneMngVO.getBenCk() == null){ //수혜확정 안하고 그대로 수정으로 넘어가면 계속 심사중
		   			beneMngVO.setBenCk("0");
		   		}
		   	    
		   	beneManageService.updateBeneMng(beneMngVO);
		           

		   	    return "forward:/bene/mng/selectBeneMngList.do";
		       	
		       }
}

