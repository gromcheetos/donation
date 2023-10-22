
<%
	/**
	 * @
	 * @  수정일             수정자                   수정내용
	 * @ -------    --------    ---------------------------
	 * @ 2019.12.05   KHN              최초 생성
	 *  
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="pageTitle">
	<spring:message code="comCopBbs.articleVO.title" />
</c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle }<spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />"> --%>
<script type="text/javascript" src="<c:url value='/js/EgovCmmUtl.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script> --%>
<script src="<c:url value='/js/jquery.js' />"></script>
<script src="<c:url value='/js/jqueryui.js' />"></script>

<validator:javascript formName="scholVO" staticJavascript="false"	xhtml="true" cdata="false" />
<script type="text/javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init() {
	
	// 첫 입력란에 포커스..
	document.getElementById("scholVO").scholItem.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_article() {
	
	
	if (!validateScholVO(scholVO)) {
		return false;
	} else {
		
		var validateForm = document.getElementById("scholVO");
		
		if (confirm("<spring:message code="common.update.msg" />")) {
			scholVO.submit();
		}

	}
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_articlelist() {
	scholVO.action = "<c:url value='/schol/indi/selectScholIndiList.do'/>";
	scholVO.submit();
}

//기부자 아이디 검색
function id_popup(){
	//window.name="parent";
	var pop = window.open("<c:url value='/schol/indi/EgovModal.do'/>", "pop", "width=570,height=420,scrollbars=yes, resizable=yes"); 		
    
}

function setChildValue(emailId){
	
	document.getElementById("emailId").value = emailId;
}
//무기명
function doner_secret(){
	
	var checkbox = document.getElementById("checkbox");
	if(checkbox.checked == true){
		document.getElementById("memName").disabled = true;
		document.getElementById("memName").value = '';
	}else{
		document.getElementById("memName").disabled = false;
	}
	
}

</script>
<style type="text/css">
	.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
	.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
	.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
</head>
<body onLoad="fn_egov_init();">

	<!-- javascript warning tag  -->
	<noscript class="noScriptTitle">	<spring:message code="common.noScriptTitle.msg" />	</noscript>
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
	<!-- 상단타이틀 -->
	<div id="search_field">
		<div id="search_field_loc"><h2><spring:message code="scholindi.list.update" /></h2></div>
	</div>
	<form:form commandName="scholVO" name="scholVO" action="${pageContext.request.contextPath}/schol/indi/updateArticle.do" method="post" onSubmit="fn_egov_updt_article(document.forms[0]); return false;">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input name="scholSeq" 	type="hidden" value="${scholVO.scholSeq}">
			<!-- 수정폼 -->
			<div id="border" class="" >
			<table class="wTable" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />">
				<caption>${pageTitle} <spring:message code="title.update" /></caption>
				<colgroup>
					<col width="200px">
					<col width="">
					<col width="100px">
				</colgroup>
				<tbody>
					<!-- 입력 -->
					<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
					
					<!-- 기부자 ID  -->
					<c:set var="title"><spring:message code="comCopBbs.articleVO.regist.doner" /></c:set>
					<tr>
						<th><label for="emailId">${title}<span class="pilsu">*</span></label></th>
						<td>
							<form:input path="emailId" title="${title} ${inputTxt }" size="90" maxlength="70" />
							<div><form:errors path="emailId" cssClass="error" /></div>
						</td>
						<td>
	                    	<a href="<c:url value="${scholVO.emailId}" />" onclick="javascript:id_popup(); return false;">검색 </a>
						</td>
					</tr>
					
					<!--기부자 이름  -->
					<c:set var="title"><spring:message code="scholindi.list.detail.donername"/> </c:set>
					<tr>
						<th><label for="memName">${title} <span class="pilsu">*</span></label></th>
						<td class="left">
						    <form:input path="memName" title="${title} ${inputTxt}" size="90" maxlength="30" />							   						    					   						    
			   				<div><form:errors path="memName" cssClass="error" /></div>			   				
						</td>
						<td style="white-space:nowrap">
							<form name="donerSecret" action="">
							<input style="width:auto" type="checkbox" onclick="javascript:doner_secret();" name="donerSecret" id="checkbox" value=""/><spring:message code="scholindi.list.resist.secret" />
							</form>
						</td>    											
					</tr>
					
					<!--기부금액  -->
					<c:set var="title"><spring:message code="scholindi.list.detail.scholAmount"/> </c:set>
					<tr>
						<th><label for="scholAmount">${title} <span class="pilsu">*</span></label></th>
						<td class="left" colspan="3">
						    <form:input path="scholAmount" title="${title} ${inputTxt}" size="90" maxlength="70" />
			   				<div><form:errors path="scholAmount" cssClass="error" /></div>     
						</td>
					</tr>
					
					<!-- 장학금명 -->
					<c:set var="title"><spring:message code="comCopBbs.articleVO.list.scholItem"/> </c:set>
					<tr>
						<th><label for="scholItem">${title} <span class="pilsu">*</span></label></th>
						<td class="left" colspan="3">
						    <form:input path="scholItem" title="${title} ${inputTxt}" size="90" maxlength="70" />
			   				<div><form:errors path="scholItem" cssClass="error" /></div>     
						</td>
					</tr>

					<!-- 기타사항  -->
					<c:set var="title"><spring:message code="scholindi.list.detail.index"/> </c:set>
					<tr>
						<th><label for="scholNote">${title } <span class="pilsu">*</span></label></th>
						<td class="nopd" colspan="3">
							<form:textarea path="scholNote" title="${title} ${inputTxt}" cols="300" rows="20" />   
							<div><form:errors path="scholNote" cssClass="error" /></div>  
						</td>
					</tr>
			
				</tbody>
			</table>
		

			<!-- 하단 버튼 -->
			<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
			
				<ul>
					<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_updt_article(); return false;"><spring:message code="button.update" /></a></li>
					<li><a class="s_submit" href="<c:url value='/schol/indi/selectScholIndiList.do' />?scholSeq=${schol.scholSeq}" ><spring:message code="button.list" /></a></li>
				</ul>								
			</div>
			<div style="clear: both;"></div>

		</div>

	</form:form>
</div>
</div>
<!-- footer 시작 -->
<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
<!-- //footer 끝 -->
</div>

</body>
</html>
