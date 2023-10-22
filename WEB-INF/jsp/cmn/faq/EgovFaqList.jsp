<%
 /**
  * @Class Name : EgovFaqList.jsp
  * @Description : EgovFaqList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.11.27   KHN              최초 생성
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title" text="FAQ 목록"/></c:set>
<!DOCTYPE html>
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.list" text="목록" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		
		<script type="text/javascript">
			/*********************************************************
 			 * 초기화
 			 ******************************************************** */
			function fn_egov_init(){
				// 첫 입력란에 포커스..
				document.faqForm.searchCnd.focus();
			}

			/*********************************************************
 			 * 페이징 처리 함수
 			 ******************************************************** */
			function fn_egov_select_linkPage(pageNo){
				document.faqForm.pageIndex.value = pageNo;
				document.faqForm.action = "<c:url value='/cmn/faq/selectFaqList.do'/>";
   				document.faqForm.submit();
			}
			/*********************************************************
			 * 조회 처리 함수
			 ******************************************************** */
			function fn_egov_search_faq(){
				document.faqForm.pageIndex.value = 1;
				document.faqForm.submit();
			}
			/*********************************************************
 			 * 상세회면 처리 함수
 			 ******************************************************** */
			function fn_egov_inquire_faqdetail(faqId) {
				// 사이트 키값(siteId) 셋팅.
				document.faqForm.faqId.value = faqId;
  				document.faqForm.action = "<c:url value='/cmn/faq/selectFaqDetail.do'/>";
  				document.faqForm.submit();
			}
		</script>
		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>

	<body onload="fn_egov_init()">
		<!-- javascript warning tag  -->
		<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg"/></noscript>
	 
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
						<div id="search_field_loc"><h2><strong>FAQ 목록</strong></h2></div>
						<form name="faqForm" action="<c:url value='/cmn/faq/selectFaqList.do'/>" method="post" onSubmit="fn_egov_search_faq(); return false;">
							<input name="faqId" type="hidden" value="<c:out value='${searchVO.faqId}'/>">
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
					
							<fieldset><legend>조건정보 영역</legend>
								<div class="sf_start">
									<ul id="search_first_ul">
										<li>
											<select name="searchCnd" title="<spring:message code="title.searchCondition"/> <spring:message code="input.cSelect"/>">
												<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></option><!-- 질문제목 -->
											</select>
										</li>
										<!-- 검색키워드 및 조회버튼 -->
										<li>
											<input class="s_input" name="searchWrd" type="text"  size="35"  value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
										</li>
										<li>
											<div class="buttons">
									            <a href="#LINK" onclick="javascript:fn_egov_search_faq(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
												<span class="btn_b"><a href="<c:url value='/cmn/faq/insertFaqView.do' />"><spring:message code="button.create" text="등록"/></a></span>
											</div>
										</li>
									</ul>
								</div>
							</fieldset> 
						</form>
					</div>
					<!-- //검색 필드 박스 끝 -->
	
					<!-- table add start -->
					<div class="default_tablestyle">
						<table summary="<spring:message code="common.summary.list" arguments="${pageTitle}" text="목록"/>" cellpadding="0" cellspacing="0">
							<caption>${pageTitle}<spring:message code="title.list" text="56555"/></caption>
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 70%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
							</colgroup>
							<thead>
								<tr>
									<th><spring:message code="table.num" text="번호"/></th><!-- 번호 -->
									<th><spring:message code="comUssOlhFaq.faqVO.qestnSj" text="제목"/></th><!-- 질문제목 -->
									<th><spring:message code="comUssOlhFaq.faqVO.inqireCo" text="조회수"/></th><!-- 조회수 -->
									<th><spring:message code="table.regdate" text="등록일자" /></th><!-- 등록일자 -->
								</tr>
							</thead>
							<tbody>
<c:if test="${fn:length(resultList) == 0}">
								<tr>
									<td colspan="4"><spring:message code="common.nodata.msg" text="데이터가 없읍니다."/></td>
								</tr>
</c:if>
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<tr>
									<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
									<td align="left">
										<a href="<c:url value='/cmn/faq/selectFaqDetail.do?faqId=${resultInfo.faqId}'/>" onClick="fn_egov_inquire_faqdetail('<c:out value="${resultInfo.faqId}"/>');return false;"><c:out value='${fn:substring(resultInfo.qestnSj, 0, 40)}'/></a></td>
									<td><c:out value='${resultInfo.inqireCo}'/></td>
									<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>
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