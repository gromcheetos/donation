<%
 /**

  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.12.04   KHN              최초 생성
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.create" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/com.css' />">
 --%><link type="text/css" rel="stylesheet" href="<c:url value='/css/jqueryui.css' />">
<script type="text/javascript" src="<c:url value='/js/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script src="<c:url value='/js/jquery.js' />"></script>
<script src="<c:url value='/js/jqueryui.js' />"></script>
<validator:javascript formName="schol" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	
	// 첫 입력란에 포커스
	document.getElementById("schol").scholItem.focus();

}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_article(){

	if (!validateSchol(schol)) {	
		return false;
	} else {		
		if(confirm("<spring:message code="common.regist.msg" />")){	
			schol.action = "<c:url value='/schol/special/insertArticle.do'/>";
			schol.submit();	
		}
	} 
}
</script>
<style type="text/css">
body{margin:0; padding:0;}
	.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
	.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
	.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
	h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
</head>
<body onLoad="fn_egov_init();">

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
                            <li><strong>특별장학금</strong></li>
                        </ul>
                    </div>
                </div>
	<!-- 타이틀 -->
	<div id="search_field">
	<div id="search_field_loc"><h2><spring:message code="scholspecial.list.specialResist" /></h2></div>
	</div>
	<form:form commandName="schol" name="schol" action="${pageContext.request.contextPath}/schol/special/insertArticle.do" method="post" onSubmit="fn_egov_regist_article(document.forms[0]); return false;"> 

	<!-- 등록폼 -->
	<div id="border">
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 20%;">
		<col style="width: 50%;">
		<col style="width: ;">
		<col style="width: ;">
	</colgroup>

		<!-- 입력 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		
		<!-- 장학금명 -->
		<c:set var="title"><spring:message code="comCopBbs.articleVO.list.scholItem"/> </c:set>
		<tr>
			<th><label for="scholItem">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
			    <form:input path="scholItem" title="${title} ${inputTxt}" size="99" maxlength="70" />
   				<div><form:errors path="scholItem" cssClass="error" /></div>     
			</td>
		</tr>
				
		<!--목표금액  -->
		<c:set var="title"><spring:message code="scholspecial.list.targetAmount"/> </c:set>
		<tr>
			<th><label for="scholGoalAmount">${title} <span class="pilsu">*</span></label></th>
			<td class="left" colspan="3">
			    <form:input path="scholGoalAmount" title="${title} ${inputTxt}" size="99" maxlength="70" />
   				<div><form:errors path="scholGoalAmount" cssClass="error" /></div>     
			</td>
		</tr>
		<!--현재금액  -->
		<c:set var="title"><spring:message code="scholspecial.list.currentAmount"/> </c:set>
		<tr>
			<th><label for="scholCurAmount">${title}</label></th>
			<td class="left" colspan="3">
			    <form:input path="scholCurAmount" title="${title} ${inputTxt}" size="99" maxlength="70" readonly="readonly"/>
	  				<div><form:errors path="scholCurAmount" cssClass="error" /></div>     
			</td>
		</tr>		
		<!-- 상세사항  -->
		<c:set var="title"><spring:message code="scholspecial.list.detail"/> </c:set>
		<tr>
			<th><label for="scholNote">${title } <span class="pilsu">*</span></label></th>
			<td class="" colspan="3">
				<form:textarea path="scholNote" title="${title} ${inputTxt}" cols="300" rows="50" style="margin: 0px; height: 240px; width: 1300px;"/>   
				<div><form:errors path="scholNote" cssClass="error" /></div>  
			</td>
		</tr>
	</table>
	</div>

	<!-- 하단 버튼 -->
	<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
		<ul>
			<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_regist_article(); return false;"><spring:message code="button.create" /></a></li>
			<li><a class="s_submit" href="<c:url value='/schol/special/selectScholSpecialList.do' />" ><spring:message code="button.list" /></a></li>
		</ul>
		<%-- input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/schol/special/selectScholSpecialList.do' />?scholSeq=${ScholVO.scholSeq}"  title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span> --%>
	</div>
<!-- 버튼 끝 -->

</form:form>
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
