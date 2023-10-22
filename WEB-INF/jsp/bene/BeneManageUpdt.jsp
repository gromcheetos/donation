
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
<%-- <script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/utl/EgovCmmUtl.js'/>" ></script> --%>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="beneMngVO" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init() {
	
	// 첫 입력란에 포커스..
	document.getElementById("beneMngVO").benName.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_updt_bene() {
	
	if (!validateBeneMngVO(beneMngVO)) {
		return false;
	} else {
		//var validateForm = document.getElementById("beneMng");
		if (confirm("<spring:message code="common.update.msg" />")) {
			beneMngVO.action = "<c:url value='/bene/mng/updateBeneMng.do'/>";
			beneMngVO.submit();
		}

	}
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_articlelist() {
	beneMngVO.action = "<c:url value='/bene/mng/selectBeneMngList.do'/>";
	beneMngVO.submit();
}
function scholItemList(value){
var values = [];
$.post(
	"/bene/mng/getSub.do",
	{scholGubun : value},
	function(retVal){
		var str  ='';
		str +='			<select>';
		str +='				<option><spring:message code="input.select" /></option>';
		str +='			</select>';
		//str +='		<select>';
		if(retVal.count > 0){
		values = retVal.item;
		$.each(values, function( index, value ){
		str +='				<option>'+value.scholItem+'</option>';
		});
		//str +='		</select>';
		} else {
		str +='<select>';
		str +='<option><spring:message code="beneficiary.scholarship.scholItem"/></option>';
		str +='</select>';
		}
		$("#scholItem").html(str);
	},"json"
);	
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
                            <li>수혜자신청관리</li>
                            <li>&gt;</li>
                            <li><strong>수혜신청관리</strong></li>
                        </ul>
                    </div>
                </div>
	<!-- 상단타이틀 -->
	<div id="search_field">
		<div id="search_field_loc"><h2><spring:message code="beneficiary.apply.update" /></h2></div>
	</div>
	<form:form commandName="beneMngVO" name="beneMngVO" action="${pageContext.request.contextPath}/bene/mng/updateBeneMng.do" method="post" onSubmit="fn_updt_bene(document.forms[0]); return false;">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input name="benAppSeq" type="hidden" value="${beneMngVO.benAppSeq}">
		
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
					
					<!-- 신청자이름 -->
					<c:set var="title"><spring:message code="beneficiary.apply.name" /></c:set>
					<tr>
						<th><label for="benName">${title}<span class="pilsu">*</span></label></th>
						<td>
							<form:input path="benName" title="${title} ${inputTxt }" size="90" maxlength="70" />
							<div><form:errors path="benName" cssClass="error" /></div>
						</td>
					</tr>
					
					<!--생년월일 -->
					<c:set var="title"><spring:message code="beneficiary.dateOfBirth"/> </c:set>
					<tr>
						<th><label for="benBirth">${title} <span class="pilsu">*</span></label></th>
						<td class="left">
						    <form:input path="benBirth" title="${title} ${inputTxt}" size="90" maxlength="30" />							   						    					   						    
			   				<div><form:errors path="benBirth" cssClass="error" /></div>			   				
						</td>    											
					</tr>
					
					<!--소속 -->
					<c:set var="title"><spring:message code="beneficiary.belong"/> </c:set>
					<tr>
						<th><label for="benBelong">${title} <span class="pilsu">*</span></label></th>
						<td class="left" colspan="3">
						    <form:input path="benBelong" title="${title} ${inputTxt}" size="90" maxlength="70" />
			   				<div><form:errors path="benBelong" cssClass="error" /></div>     
						</td>
					</tr>
					
					<!-- 신청분야-->
					<c:set var="title"><spring:message code="beneficiary.field"/> </c:set>
					<tr>
						<th><label for="benAppFieldNm">${title} <span class="pilsu">*</span></label></th>
						<td class="left" colspan="3">
						    <form:input path="benAppFieldNm" title="${title} ${inputTxt}" size="90" maxlength="70" />
			   				<div><form:errors path="benAppFieldNm" cssClass="error" /></div>     
						</td>
					</tr>

					<!-- 적용장학금 -->
					<c:set var="title"><spring:message code="beneficiary.scholarship.application"/> </c:set>
					<tr>
						<th><label for="scholGubun">${title } <span class="pilsu">*</span></label></th>
						<td class="nopd" colspan="3">
							<select name="scholGubun" id="scholGubun" onchange="javascript:scholItemList(value);" >
								<option><spring:message code="input.select" text="선택하세요"/></option>
									<c:forEach var="combo1" items="${combo1}" varStatus="status">								
										<option value="<c:out value="${combo1.code}" />"><c:out value="${combo1.codeNm}" /></option>																	
									</c:forEach>
							</select>
								
							<select name="scholItem" id="scholItem" >
								<option></option>
							</select>  
						</td>
					</tr>
			
				</tbody>
			</table>
		

			<!-- 하단 버튼 -->
			<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
			
				<ul>
					<li><a href="#LINK" class="s_submit" onclick="javascript:fn_updt_bene(); return false;"><spring:message code="button.update" /></a></li>
					<li><a class="s_submit" href="<c:url value='/bene/mng/selectBeneMngList.do' />?benAppSeq=${schol.benAppSeq}" ><spring:message code="button.list" /></a></li>
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
