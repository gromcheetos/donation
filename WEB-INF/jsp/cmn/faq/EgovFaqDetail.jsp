<%
 /**
  * @Class Name : EgovFaqDetail.jsp
  * @Description : EgovFaqDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.11.27   KHN              최초 생성
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.detail" /></title>
		<meta http-equiv="Content-Language" content="ko" >
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>

		<script type="text/javascript">
			/* ********************************************************
			 * 삭제처리
			 ******************************************************** */
			 function fn_egov_delete_faq(faqId){
				if(confirm("<spring:message code="common.delete.msg" />")){	
					// Delete하기 위한 키값을 셋팅
					document.faqForm.faqId.value = faqId;	
					document.faqForm.action = "<c:url value='/cmn/faq/deleteFaq.do'/>";
					document.faqForm.submit();	
				}	
			}	
	   		function fn_updateForm() {
				document.faqForm.action = "<c:url value='/cmn/faq/updateFaqView.do'/>";
	       		document.faqForm.submit();          
	   		}
		</script>
		<title>FAQ 상세</title>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>

	<body>
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
                    			<li>커뮤니티관리</li>
                    			<li>&gt;</li>
                    			<li><strong>FAQ</strong></li>
                			</ul>
           				</div>
       				</div>
    				<!-- 검색 필드 박스 시작 -->
					<div id="search_field">
						<div id="search_field_loc"><h2>${pageTitle} <spring:message code="title.detail" /></h2></div>
					</div>
					<form name="faqForm" action="<c:url value='/cmn/faq/updateFaqView.do'/>" method="post">
						<input name="faqId" type="hidden" value="<c:out value="${result.faqId}" />">
						<input name="cmd" type="hidden" value="">		
						<div>
							<table class="wTable">
								<tr>
									<th width="15%" nowrap><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></th>
									<td width="85%" colspan="3" nowrap="nowrap"><c:out value="${result.qestnSj}"/></td>
								</tr>
								<tr>
									<th width="15%" nowrap><spring:message code="comUssOlhFaq.faqVO.inqireCo" text="조회수"/></th>
									<td width="35%" nowrap="nowrap"><c:out value="${result.inqireCo}"/></td>
									<th width="15%" nowrap ><spring:message code="table.regdate" text="등록일"/></th>
									<td width="35%" nowrap="nowrap"><c:out value="${result.frstRegisterPnttm}"/></td>
								</tr>
								<tr>
									<th width="15%"><spring:message code="comUssOlhFaq.faqVO.qestnCn" /></th>
									<td width="85%" colspan="3" nowrap="nowrap">				
										<%-- <textarea id="nttCn" name="nttCn"  cols="75" rows="20"  style="width:99%" readonly="readonly" title="글내용">
										<c:out value="${fn:replace(result.qestnCn , crlf , '<br/>')}" escapeXml="false" /></textarea> --%>				
										<textarea id="nttCn" name="nttCn" style="width:99%" readonly="readonly"><c:out value="${result.qestnCn}" escapeXml="true" /></textarea>
									</td>
								</tr>
								<tr>
									<th width="15%"><spring:message code="comUssOlhFaq.faqVO.answerCn" /></th>
									<td colspan="3">
										<%-- <c:out value="${fn:replace(result.answerCn , crlf , '<br/>')}" escapeXml="false" /> --%>
										<textarea id="answerCn" name="answerCn" style="width:99%" readonly="readonly"><c:out value="${result.answerCn}" escapeXml="true" /></textarea>
									</td>
								</tr>
							</table>
						</div>
						<!-- 버튼 시작 -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<%-- <li><input type="submit" class="s_submit" value="<spring:message code="button.update" />" /></li> --%>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_updateForm(); return false;"><spring:message code="title.update" text="수정"/></a> </li>
								<li><a href="#LINK" class="s_submit" onClick="fn_egov_delete_faq('<c:out value="${result.faqId}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
								<li><a href="<c:url value='/cmn/faq/selectFaqList.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
							</ul>

							<%-- <table border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
									<td>				
										<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
									</td>
									
									<td>
										<span class="btn_s"><a href="<c:url value='/cmn/faq/deleteFaq.do' />" onClick="fn_egov_delete_faq('<c:out value="${result.faqId}"/>'); return false;"  title="<spring:message code="button.delete" /> <spring:message code="input.button" />"><spring:message code="button.delete" /></a></span>
									</td>
										<span class="btn_s"><a href="<c:url value='/cmn/faq/selectFaqList.do' />"  title="<spring:message code="title.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
								</tr>
							</table> --%>
							<!-- </div><div style="clear:both;"></div> -->
						</div>
						<!-- 버튼 끝 -->
					</form>
				</div>
				<!-- //content 끝 -->
			</div>
			<!-- //container 끝 -->
			<!-- footer 시작 -->
    		<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    		<!-- //footer 끝 -->
    	</div>
	</body>
</html>
