<%
 /**
  * @Class Name : EgovQnaDetail.jsp
  * @Description : EgovQnaDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.02   KHN              최초 생성
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
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>		
<script type="text/javascript">
/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_qna(qnaForm){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		form.submit();	
	}	
}
 function fn_updateForm() {
		document.qnaForm.action = "<c:url value='/cmn/qna/updateQnaView.do'/>";
		document.qnaForm.submit();          
	}
	
</script>
		<title>Qna 상세</title>

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
                    <li>QnA</li>
                </ul>
           	</div>
       	</div>

	<!-- 타이틀 -->
	<div id="search_field">
		<div id="search_field_loc"><h2>${pageTitle} <spring:message code="title.detail" /></h2></div>
	</div>
	<form name="qnaForm" action="<c:url value='/cmn/qna/selectQnaDetail.do'/>" method="post">
		<input name="qnaSeq" type="hidden" value="<c:out value="${result.qnaSeq}" />">
		<input name="cmd" type="hidden" value="">
	<div>
	<table class="wTable">		
		<!-- 질문제목 -->
		<tr>
			<th width="15%" nowrap><spring:message code="comUssOlhQna.qnaVO.qestnSj" /></th>
			<td width="85%" colspan="3" nowrap="nowrap"><c:out value="${result.qnaTitle}"/></td>
		</tr>
		<!-- 진행상태,등록일 -->
		<tr>
			<th width="15%" nowrap><spring:message code="scholarship.status"/></th>
		<c:choose>
		<c:when test="${result.qnaCk ==  '1'}">
			<td width="35%" nowrap="nowrap"><spring:message code="danation.qna.replied" /></td>
		</c:when>
		<c:otherwise>
			<td width="35%" nowrap="nowrap"><spring:message code="danation.qna.reply.status" /></td>
		</c:otherwise>
		</c:choose>	
			<th width="15%" nowrap ><spring:message code="table.regdate" /></th>
			<td width="35%" nowrap="nowrap"><c:out value="${result.qnaDate}"/></td>
		</tr>				
		<!-- 질문내용 -->
		<tr>
			<th width="15%"><spring:message code="comUssOlhFaq.faqVO.qestnCn" /></th>
			<td width="85%" colspan="3" nowrap="nowrap">						
				<textarea id="nttCn" name="nttCn" style="width:99%" readonly="readonly">
				<c:out value="${fn:replace(result.qnaContent , crlf , '<br/>')}" escapeXml="false" /></textarea>
			</td>
		</tr>
		<!-- 답변 내용 -->
		<tr>
			<th width="15%"><spring:message code="comUssOlhFaq.faqVO.answerCn" /></th>
			<td colspan="3">
				<%-- <c:out value="${fn:replace(result.answerCn , crlf , '<br/>')}" escapeXml="false" /> --%>
				<textarea name="answerCn" style="width:99%" readonly="readonly"><c:out value="${result.answerCn}" escapeXml="true" /></textarea>
			</td>
		</tr>		
	</table>
</div>

	<!-- 하단 버튼 -->
	<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
	<ul>
		<%-- <li><input type="submit" class="s_submit" value="<spring:message code="button.update" />" /></li> --%>
		<li><a href="#LINK" class="s_submit" onclick="javascript:fn_updateForm(); return false;"><spring:message code="title.update" text="수정"/></a> </li>
		<li><a href="#LINK" class="s_submit" onClick="fn_egov_delete_qna('<c:out value="${result.qnaSeq}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
		<li><a href="<c:url value='/cmn/qna/selectQnaList.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
	</ul>
	<%-- <form name="qnaForm" action="<c:url value='/cmn/qna/updateQnaView.do'/>" method="post" style="float:left;">
			<input type="submit" class="s_submit" value="<spring:message code="title.reply" />" title="<spring:message code="title.reply" /> <spring:message code="title.reply" />" />
			<input name="qnaSeq" type="hidden" value="${result.qnaSeq}">
		</form>
		<form name="formDelete" action="<c:url value='/cmn/qna/deleteQna.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="submit" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_qna(this.form); return false;">
			<input name="qnaSeq" type="hidden" value="${result.qnaSeq}">
		</form>
		<form name="formList" action="<c:url value='/cmn/qna/selectQnaList.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="submit" class="s_submit" value="<spring:message code="button.list" />">
		</form> 
	<input name="cmd" type="hidden" value="">--%>
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
 <!-- //전체 레이어 끝 -->
</body>
</html>
