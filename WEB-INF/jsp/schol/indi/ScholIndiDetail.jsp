<%
 /**
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.04   KHN              최초 생성
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
		<title>${pageTitle} <spring:message code="title.detail" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script src="<c:url value='/js/jquery.js' />"></script>
		<script src="<c:url value='/js/jqueryui.js' />"></script>
		<script src="<c:url value='/js/common.js'/>"></script>
		<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/com.css' />"> --%>

		<script type="text/javascript">
			function fn_init(){
				var scholCk = ${result.scholCk};
		
				if(scholCk == 1){
					$("#btn_no").css("display", "inline")		
				}else if(scholCk == 0){
					$("#btn_ok").css("display", "inline")
				}
			}

			/* ********************************************************
 			 * 삭제처리
 			 ******************************************************** */
 			function fn_egov_delete_article(scholSeq){
				if(confirm("<spring:message code="common.delete.msg" />")){	
					document.frm.scholSeq.value = scholSeq;	
					document.frm.action = "<c:url value='/schol/indi/deleteArticle.do'/>";
					document.frm.submit();	
				}
			}

			function fn_egov_scholCk_ok() {
				document.frm.action = "<c:url value='/schol/indi/updateScholCk.do'/>";
			  	document.frm.submit();		
			}
	  	
			function fn_egov_scholCk_no() {
				document.frm.action = "<c:url value='/schol/indi/updateScholCk.do'/>";
		 		document.frm.submit();
			}
			function fn_updateForm() {
			
				document.frm.action = "<c:url value='/schol/indi/updateScholIndiView.do'/>";
	       		document.frm.submit();          
	   		}
		</script>
		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
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
                            	<li>장학사업관리</li>
                            	<li>&gt;</li>
                            	<li><strong>개별장학금</strong></li>
                        	</ul>
                    	</div>
                	</div>
					<!-- 타이틀 -->
					<div id="search_field">
						<div id="search_field_loc"><h2><strong><spring:message code="scholindi.list.detail" /></strong></h2></div>
                	</div>
                	<form name="frm" method="post" action="<c:url value=''/>">
                		<input name="scholSeq" type="hidden" value="<c:out value="${result.scholSeq}" />">                	
                		<input name="scholCk" type="hidden" value="<c:out value="${result.scholCk}" />">                	
                		<div>
							<!-- 상세조회 -->
							<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
									<!-- 기부자 아이디 -->
									<tr>
										<th width="15%" ><spring:message code="comCopBbs.articleVO.regist.doner" /></th>
										<td class="left" width="85%" colspan="3" nowrap="nowrap"><c:out value="${result.emailId}"/></td>
									</tr>
									<!-- 기부자 이름 -->
									<tr>
										<th><spring:message code="scholindi.list.detail.donername" /></th>
										<td class="left"><c:out value="${result.memName}"/></td>
									</tr>
									<!-- 기부금액 -->
									<tr>			
										<th><spring:message code="scholindi.list.detail.scholAmount" /></th>
										<td class="left"><c:out value="${result.scholAmount}"/></td>
									</tr>
									<!-- 장학금명 -->
									<tr>	
										<th><spring:message code="comCopBbs.articleVO.list.scholItem" /></th>
										<td class="left"><c:out value="${result.scholItem}"/></td>
									</tr>
									<!-- 확정여부 -->
									<tr>	
										<th><spring:message code="comCopBbs.articleVO.list.scholCk" /></th>
									<c:choose>
										<c:when test="${result.scholCk == 0}">
												<td class="left" ><spring:message code="scholindi.list.scholCk.wait" /></td>
										</c:when>
										<c:otherwise>
												<td class="left"><spring:message code="scholindi.list.scholCk.confirm" /></td>
										</c:otherwise>
									</c:choose>
									</tr>
									<!-- 글 내용 -->
									<tr>
										<th class="vtop"><spring:message code="scholindi.list.detail.index" /></th>
										<td colspan="5" class="cnt">
											<c:out value="${fn:replace(result.scholNote , crlf , '<br/>')}" escapeXml="false" />
										</td>
									</tr>
								<!-- </tbody> -->
							</table>
							<!-- 하단 버튼 -->
							<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
								<!-- 버튼 -->
							<ul>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_updateForm('<c:out value="${result.scholSeq}"/>'); return false;"><spring:message code="title.update" /></a> </li>
								<li><a href="#LINK" class="s_submit" onClick="fn_egov_delete_article('<c:out value="${result.scholSeq}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
								<li><a href="<c:url value='/schol/indi/selectScholIndiList.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
								<li><div id="btn_ok" style="display: none;"><a href="#LINK" class="s_submit" id="ok" onclick="fn_egov_scholCk_ok('<c:out value="${result.scholSeq},${result.scholCk}"/>'); return false;"><spring:message code="button.scholCk.confirm"/></a></div></li>
								<li><div id="btn_no" style="display: none;"><a href="#LINK" class="s_submit" id="no" onclick="fn_egov_scholCk_no('<c:out value="${result.scholSeq},${result.scholCk}"/>'); return false;"><spring:message code="button.scholCk.confirm.cancel"/></a></div></li>															
							</ul>
							
							</div>
						</div>
					</form>
				</div>
				<!-- //content 끝 --> 
			</div>
		</div>
		<%-- <!-- //container 끝 -->
   		<!-- footer 시작 -->
		<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
		<!-- //footer 끝 --> --%>
	</body>
</html>