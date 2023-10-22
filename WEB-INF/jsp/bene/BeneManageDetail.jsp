<%
 /**
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.26   KHN              최초 생성
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
		<title>${pageTitle} <spring:message code="title.detail" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
		<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="<c:url value='/js/jquery.js' />"></script>
		<script src="<c:url value='/js/jqueryui.js' />"></script>
		<script src="<c:url value='/js/common.js'/>"></script>
		<style>
			#doner {display:none;}
		</style>
		<script type="text/javascript">
			$( document ).ready(function() {

				$( "#scholGubun" ).change(function() {
					var selectedVal = $("#scholGubun option:selected").val();
					//alert("value==>"+selectedVal);
				  
				  /* $.ajax({
					  url : "<c:url value='/example01.do'/>",
					  data : {
					    sampleInput : "sampleData"
					  },
					  success : function(data, textStatus, jqXHR) {
					    //Sucess시, 처리
					  }, 
					  error : function(jqXHR, textStatus, errorThrown){
					    //Error시, 처리
					}
					}); */
				  
				});
			});
		
		
			/* 초기화 */
			function fn_init(){
				var benCk = ${result.benCk}; 

				if(benCk == 1){
					$("#btn_no").css("display", "inline")
				}else if(benCk == 0){
					$("#btn_ok").css("display", "inline")
				}			
			}
			
			/* 수정폼호출 */
			function fn_updateForm(){
				document.form.action = "<c:url value='/bene/mng/updateBeneMngView.do'/>";
	  			document.form.submit();
			}

			/* 삭제처리 */
			function fn_delete(form){
				if(confirm("<spring:message code="common.delete.msg" />")){	
					// Delete하기 위한 키값을 셋팅
					form.submit();	
				}	
			}	

			/* function fn_downloadFile(obj){
					var fileNo = obj.parent().find("#fileNo").val();
					var comSubmit = new ComSubmit();
					comSubmit.setUrl = ("<c:url value='/common/downFile.do' />");
					comSubmit.addParam("benAppSeq", benAppSeq);
					comSubmit.submit();
			} */ 
	
			function fn_egov_scholCk_ok(benCk, benAppSeq) {
				function setValues(benAppSeq){
					//var benAppField = document.getElementById("scholsearch").value;
					scholGubun.value = $("#scholGubun option:selected").value;
					benAppField.value = $("#benAppField option:selected").value;
					coneole.log(benAppField);
					//bScholItem.value = bScholItem.options[bScholItem.selectedIndex].value;
				}
				document.form.action = "<c:url value='/bene/mng/updateBeneCk.do'/>";
	  			document.form.submit();
			}
  	
			function fn_egov_scholCk_no(benCk, benAppSeq) {
				document.form.action = "<c:url value='/bene/mng/updateBeneCk.do'/>";
	 			document.form.submit();
			}

			</script>
		</head>

		<body onload="fn_init();">
			<!-- javascript warning tag  -->
			<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

			<!-- 전체 레이어 시작 -->
			<div id="wrap">
 				<!-- header 시작 -->
    			<div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    			<div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    			<!-- //header 끝 --> 
    			<!-- container 시작 -->
    			<div id="container">
        			<!-- 좌측메뉴 시작 -->
        			<div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        			<!-- //좌측메뉴 끝 -->
            		<!-- 현재위치 네비게이션 시작 -->
            		<div id="content">
                		<div id="cur_loc">
                    		<div id="cur_loc_align">
                        		<ul>
                            		<li>수혜자신청관리</li>
                            		<li>&gt;</li>
                            		<li><strong>수혜자신청 상세</strong></li>
                        		</ul>
                    		</div>
                		</div>
						<!-- 타이틀 -->
	 					<div id="search_field">
							<div id="search_field_loc"><h2><strong><spring:message code="beneficiary.apply.listDetail" /></strong></h2></div>
   						</div>
						<!-- 상세조회 -->
						<form name="form" method="post" >
							<input type="hidden" name="benAppSeq" value="${result.benAppSeq}">
							<input type="hidden" name="benCk" value="${result.benCk}"> 
							<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
							<caption>${pageTitle} <spring:message code="title.detail" /></caption>
							<tr>
								<th width="15%"><spring:message code="beneficiary.apply.name" /></th><!-- 신청자명 -->
								<td class="left" width="35%" nowrap="nowrap"><c:out value="${result.benName}"/></td>	
								<th width="15%"><spring:message code="beneficiary.dateOfBirth" /></th><!-- 생년월일 -->
								<td class="left" width="35%" nowrap="nowrap"><c:out value="${result.benBirth}"/></td>
							</tr>
							<tr>
								<th><spring:message code="beneficiary.belong" /></th><!-- 소속-->
								<td class="left" ><c:out value="${result.benBelong}" /></td>
								<th width="15%"><spring:message code="beneficiary.field" /></th><!-- 신청분야 -->
								<td class="left"><c:out value="${result.benAppFieldNm}" /></td>
							</tr>
							<!-- 첨부파일 다운로드 -->	
							<tr>
								<th><spring:message code="sym.log.atchFile" /></th>
								<td colspan="4" class="left">
								<c:forEach var="row" items="${list}">
									<input type="hidden" id="fileNo" value="${row.fileNo}">
									<a href="fn_downloadFile();" name="file">${row.ofileName }</a> 
										(${row.fileSize}kb)
								</c:forEach>
								</td>
							</tr>
							<!-- 적용장학금 -->
							<tr>			
								<th><spring:message code="beneficiary.scholarship.application" text="적용장학금"/></th>
								<td colspan="4" class="left">
								<c:if test="${result.benCk=='1'}"><c:out value="${result.scholGubunNm}" />&#160<i class="fas fa-caret-right"></i>&#160<c:out value="${result.benAppFieldNm}"/>&#160<i class="fas fa-caret-right"></i>&#160<c:out value="${result.scholItem}"/></c:if>
								<c:if test="${result.benCk=='0'}"><spring:message code="beneficiary.scholarship.scholItem" /></c:if>
								</td>
							</tr>
						</table>
						
 						<!-- 하단 버튼 -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<li><a href="#LINK" class="s_submit" onClick="fn_updateForm('<c:out value="${result.benAppSeq}"/>'); return false;"  ><spring:message code="button.update" /></a></li>
								<li><a href="#LINK" class="s_submit" onClick="fn_delete('<c:out value="${result.benAppSeq}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
								<li><a href="<c:url value='/bene/mng/selectBeneMngList.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
								<li><div id="btn_ok" style="display: none;"><a href="#LINK" class="s_submit" id="ok" onclick="fn_egov_scholCk_ok('<c:out value="${result.benAppSeq},${result.benCk}"/>'); return false;"><spring:message code="button.scholCk.confirm"/></a></div></li>
								<li><div id="btn_no" style="display: none;"><a href="#LINK" class="s_submit" id="no" onclick="fn_egov_scholCk_no('<c:out value="${result.benAppSeq},${result.benCk}"/>'); return false;"><spring:message code="button.scholCk.confirm.cancel"/></a></div></li>															
							</ul>								
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
