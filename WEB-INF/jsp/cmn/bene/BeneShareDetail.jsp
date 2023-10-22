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
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/com.css' />">
 --%>
<script type="text/javascript" >

/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_article(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		form.action = "<c:url value='/cmn/bene/deleteShare.do'/>";

		form.submit();	
	}	
}	

</script>

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
                            <li><strong>수혜자 후기 관리</strong></li>
                        </ul>
                    </div>
                </div>
	<!-- 타이틀 -->
	<div id="search_field">
		<div id="search_field_loc"><h2><strong><spring:message code="beneficiary.sharemanage.detail"  /></strong></h2></div>
	</div>
	<form name="frm" method="post" action="<c:url value=''/>">
          <input name="scholSeq" type="hidden" value="<c:out value="${result.scholSeq}" />"> 
	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col width="20%">
		<col width="" >
	</colgroup>
	<tbody>
		<!-- 수혜자 아이디 -->
		<tr>
			<th><spring:message code="scholarship.beneficiary.email" /></th>
			<td colspan="5" class="left"><c:out value="${result.beneEmailId}"/></td>
		</tr>
		<!-- 수혜자 이름 -->
		<tr>
			<th><spring:message code="scholarship.beneficiary.name" /></th>
			<td class="left"><c:out value="${result.benShareName}"/></td>
		</tr>
		<!-- 후기 제목 -->
		<tr>	
			<th><spring:message code="cop.nttSj" /></th>
			<td class="left"><c:out value="${result.shareTitle}"/></td>
		</tr>

		<!-- 후기내용 -->
		<tr>
			<th class="vtop"><spring:message code="cop.nttCn" /></th>
			<td colspan="5" class="cnt">
				<c:out value="${fn:replace(result.shareContent , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
		<ul>
			<li><a href="#LINK" class="s_submit" onClick="fn_egov_delete_article('<c:out value="${result.scholSeq}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
			<li><a href="<c:url value='/cmn/bene/sharelist.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
		</ul>		
	</div>

	</form>
</div>	
</div>
</div>

</body>
</html>
