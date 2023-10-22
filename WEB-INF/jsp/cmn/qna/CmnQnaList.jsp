<%
 /**
  * @Class Name : CmnQnaList.jsp
  * @Description : CmnQnaList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.11.27   KHN              최초 생성
 
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.list" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		
		<script type="text/javascript">
			/*********************************************************
			 * 초기화
			 ******************************************************** */
			function fn_egov_init(){
				// 첫 입력란에 포커스..
				document.qnaForm.searchCnd.focus();
			}
	
			/*********************************************************
			 * 페이징 처리 함수
			 ******************************************************** */
			function fn_egov_select_linkPage(pageNo){
				document.qnaForm.pageIndex.value = pageNo;
				document.qnaForm.action = "<c:url value='/cmn/qna/selectQnaList.do'/>";
			   	document.qnaForm.submit();
			}
	
			/*********************************************************
			 * 조회 처리 함수
			 ******************************************************** */
			function fn_search(){
				document.qnaForm.pageIndex.value = 1;
				document.qnaForm.submit();
			}
			/* ********************************************************
			 * 상세회면 처리 함수
			 ******************************************************** */
			function fn_egov_inquire_qnadetail(qnaSeq) {
				// 사이트 키값(siteId) 셋팅.
				document.qnaForm.qnaSeq.value = qnaSeq;
			  	document.qnaForm.action = "<c:url value='/cmn/qna/selectQnaDetail.do'/>";
			  	document.qnaForm.submit();
			}
			
			/* 등록화면 호출 */
    		function fn_addQna() {
        		document.qnaForm.action = "<c:url value='/cmn/qna/insertQnaView.do'/>";
        		document.qnaForm.submit();
    		}
		</script>
		<style type="text/css">
	    	h1 {font-size:12px;}
	    	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
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
				        		<li><strong>QnA</strong></li>
							</ul>
						</div>
					</div>
					<!-- 검색 필드 박스 시작 -->
    				<div id="search_field">
						<div id="search_field_loc"><h1>${pageTitle} <spring:message code="title.list" /></h1></div>
						<form name="qnaForm" action="<c:url value='/cmn/qna/selectQnaList.do'/>" method="post" onSubmit="fn_search(); return false;"> 
							<input name="qnaSeq" type="hidden" value="<c:out value='${searchVO.qnaSeq}'/>">
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		
							<fieldset><legend>조건정보 영역</legend>
								<div class="sf_start">
									<ul id="search_first_ul">
										<li>
											<%-- <div class="search_box" title="<spring:message code="common.searchCondition.msg" />"> --%>			
											<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
												<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="table.reger" /></option><!-- 작성자 -->
												<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comUssOlhQna.qnaVO.qnaTitle" /></option><!-- 질문제목 -->
											</select>
										</li>
										<li>
											<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" ></li>
										<li>
											<div class="buttons">
												<a href="#LINK" onclick="javascript:fn_search(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" /><spring:message code="button.inquire" /></a>
												<a href="#LINK" onclick="javascript:fn_addQna(); return false;"><spring:message code="button.create" /></a>
												
												<%-- <input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
												<span class="btn_b"><a href="<c:url value='/cmn/qna/insertQnaView.do' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span> --%>
											</div>
										</li>
									</ul>
								</div>
							</fieldset>
						</form>
					</div>
					<!-- //검색 필드 박스 끝 -->
					<!-- 목록영역 -->
					<div class="default_tablestyle">
						<table summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />"cellpadding="0" cellspacing="0">
							<caption>${pageTitle}<spring:message code="title.list" /></caption>
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 50%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th><spring:message code="table.num" /></th><!-- 번호 -->
									<th class="board_th_link"><spring:message code="comUssOlhQna.qnaVO.qnaTitle" /></th><!-- 질문제목 -->
									<th><spring:message code="table.reger" /></th><!-- 작성자 -->
									<th><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode" /></th><!-- 진행상태 -->
									<th><spring:message code="table.regdate" /></th><!-- 등록일자 -->
								</tr>
							</thead>
							<tbody>
<c:if test="${fn:length(resultList) == 0}">
								<tr>
									<td colspan="6"><spring:message code="common.nodata.msg" /></td>
								</tr>
</c:if>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<tr>
									<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
									<td align="left">
										<form name="subForm" method="post" action="<c:url value='/cmn/qna/selectQnaDetail.do'/>">
											<input name="qnaSeq" type="hidden" value="<c:out value="${resultInfo.qnaSeq}"/>">
											<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
											<span class="link"><input class="none-border" type="submit" value="<c:out value='${fn:substring(resultInfo.qnaTitle, 0, 40)}'/>"></span>
										</form>
									</td>
									<td><c:out value='${resultInfo.qnaName}'/></td>
	<c:choose>
		<c:when test="${resultInfo.qnaCk == 0}">		
									<td><spring:message code="comUssOlhQna.qnaVO.qnaCk" /></td>
		</c:when>
		<c:otherwise>
									<td><spring:message code="comUssOlhQna.qnaVO.qnaConfirm" /></td>
		</c:otherwise>

	</c:choose>
									<td colspan="5"><c:out value='${resultInfo.qnaDate}'/></td>
								</tr>
</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- paging navigation -->
					<div id="paging_div">
						<ul class="paging_align">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>
						</ul>
					</div>
					<!-- paging navigation end-->	
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