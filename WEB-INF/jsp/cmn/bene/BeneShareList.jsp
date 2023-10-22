<%
 /**

  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2020.01.10   KHN              최초 생성
  
  *
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
 --%><script type="text/javascript">
/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.articleForm.searchCnd.focus();
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/cmn/bene/sharelist.do'/>";
   	document.articleForm.submit();
}
/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_list(){
	document.articleForm.pageIndex.value = 1;
	document.articleForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_articledetail(shareSeq,beneEmailId) {
	
	document.articleForm.scholItem.value = beneEmailId;
	document.articleForm.scholSeq.value = shareSeq;
  	document.articleForm.action = "<c:url value='/cmn/bene/BeneShareMngDetail.do'/>";
  	document.articleForm.submit();
}
</script>
</head>
<body onload="fn_egov_init()">
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
                            <li><strong>수혜자 후기관리</strong></li>
                        </ul>
                    </div>
                </div>

	<!-- 검색 필드 박스 시작 -->
    <div id="search_field">
    	<div id="search_field_loc"><h2><strong><spring:message code="beneficiary.sharemanage.list" /></strong></h2></div>
			<form name="articleForm" action="<c:url value='/cmn/bene/sharelist.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;">         
						<input name="scholItem" type="hidden" value="${resultInfo.scholItem}">
						<input name="emailId" 	type="hidden" value="${resultInfo.emailId}">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<fieldset>
							<legend>조건정보 영역</legend>
							<div class="sf_start">
								<ul id="search_first_ul">
									<li>
										<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
											<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="cop.ncrdNm" /></option><!-- 수혜자이름  -->
											<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="common.search.email" /></option><!-- 수혜자아이디 -->
										</select>
									</li>
									<li>
										<input class="s_input" name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
									</li>
									<li>
										<div class="buttons">
											<a href="#LINK" onclick="javascript:fn_list(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" /><spring:message code="title.inquire" /></a>
										</div>
									</li>
								</ul>
							</div>
						</fieldset>
					</form>
	</div>	

	<!-- 목록영역 -->
	<div class="default_tablestyle">
	<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.list" /></caption>
	<colgroup>
		<col style="width: 9%;">
		<col style="width: 40%;">
		<col style="width: 20%;">
		<col style="width: 20%;">
	</colgroup>
	<thead>
	<tr>
		<th><spring:message code="table.num" /></th><!-- 번호 -->
		<th><spring:message code="scholarship.beneficiary.email" /></th><!-- 수혜자 아이디 -->
		<th><spring:message code="scholarship.beneficiary.name" /></th><!-- 수혜자 이름 -->
		<th><spring:message code="table.regdate" /></th><!-- 작성시각 -->
	</tr>
	</thead>
	<tbody class="ov">
	
	<!-- 게시글 본문 -->
	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>

		<td class="left">
    	<form name="subForm" method="post" action="<c:url value='/cmn/bene/BeneShareMngDetail.do'/>">
			    <input name="shareSeq" type="hidden" value="<c:out value="${resultInfo.shareSeq}"/>">
			    <input name="beneEmailId" type="hidden" value="<c:out value="${resultInfo.beneEmailId}"/>">
			    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			    <span class="link"><input type="submit" value= <c:out value='${fn:substring(resultInfo.beneEmailId, 0, 40)}'/> style="border:0px solid #e0e0e0;"></span>
		</form>
		</td>
		<td><c:out value='${resultInfo.benShareName}'/></td>

		<td><c:out value='${resultInfo.shareDate}'/></td>
		
	</tr>
	</c:forEach>

	<c:if test="${fn:length(resultList) == 0}">
	
	<!-- 글이 없는 경우 -->
	<tr>
		<td colspan="4"><spring:message code="common.nodata.msg" /></td>
	</tr>
	</c:if>
	</tbody>
	</table>
</div>
	<!-- paging navigation -->
	<div id="paging_div">
		<ul class="paging_align">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
		</ul>
	</div>
	
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