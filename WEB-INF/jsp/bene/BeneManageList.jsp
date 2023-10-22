<%
 /**

  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.26   KHN              최초 생성
  
  *
  */
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.list" /></title>
		<meta http-equiv="content-language" content="ko">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="<c:url value='/js/jquery.js' />"></script>
		<script src="<c:url value='/js/jqueryui.js' />"></script>
		<script type="text/javascript">
			/*********************************************************
	 		* 초기화
	 		******************************************************** */
			function fn_egov_init(){
				// 첫 입력란에 포커스..
				document.articleForm.searchWrd.focus();
			}

			/*********************************************************
 			* 페이징 처리 함수
 			******************************************************** */
			function fn_egov_select_linkPage(pageNo){
				document.articleForm.pageIndex.value = pageNo;
				document.articleForm.action = "<c:url value='/bene/mng/selectBeneMngList.do'/>";
   				document.articleForm.submit();
			}

			/*********************************************************
 			* 조회 처리 함수
 			******************************************************** */
			function fn_list(benAppField){
				//document.articleForm.pageIndex.value = 1;
				//var b = document.getElementById("benAppField");
				//var benAppField = b.options[b.selectedindex].value;
				var benAppFieldNm = $("#benAppField option:selected").val();
				
				document.articleForm.submit();
			}
			/* ********************************************************
 			* 상세회면 처리 함수
 			******************************************************** */
			function fn_egov_inquire_articledetail(scholSeq,scholItem, benAppSeq) {
				document.articleForm.scholItem.value = scholItem;
				document.articleForm.scholSeq.value = scholSeq;
				document.articleForm.benAppSeq.value = benAppSeq;
  				document.articleForm.action = "<c:url value='/bene/mng/selectBeneMngDetail.do'/>";
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
	                            <li>수혜자신청관리</li>
	                            <li>&gt;</li>
	                            <li><strong>신청관리</strong></li>
	                        </ul>
	                    </div>
	                </div>
	                
					<!-- 검색 필드 박스 시작 -->
	    			<div id="search_field">
	    				<div id="search_field_loc"><h2><strong><spring:message code="beneficiary.apply.list" /></strong></h2></div>
						<form name="articleForm" action="<c:url value='/bene/mng/selectBeneMngList.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;">         
							<input name="scholItem" type="hidden" value="${resultInfo.scholItem}">
							<input name="emailId" 	type="hidden" value="${resultInfo.emailId}">
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
							<fieldset>
								<legend>조건정보 영역</legend>
								<div class="sf_start">
									<ul id="search_first_ul">
										<li>
											<spring:message code="beneficiary.apply.name" />
										<li>
											<input class="s_input" name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
										</li>
										<li>									
											<select name="benAppField" id="benAppField" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
												<option><spring:message code="apply.field" text="신청분야"/></option>
												<c:forEach var="item" items="${item}" varStatus="status">	
												<option value="<c:out value="${item.code}"/>"><c:out value="${item.codeNm}"/></option>
												</c:forEach>
											</select>
										</li>									
										<li>
											<div class="buttons">
												<a href="#LINK" onclick="javascript:fn_list('<c:out value="${resultInfo.benName}"/>'); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" /><spring:message code="title.inquire" /></a>											
											</div>
										</li>
									</ul>
								</div>
							</fieldset>
						</form>
					</div>	           
	                               
					<%-- <br>
					<!-- 하단 버튼 -->
					<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
						<form name="articleForm" action="<c:url value='/bene/mng/selectBeneMngList.do'/>" method="post" onSubmit="fn_egov_search_article(); return false;"> 	
						<ul>
							<!-- 검색키워드 및 조회버튼 -->
							<li>
								<spring:message code="beneficiary.apply.name" />
								<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${ScholVO.benName}"/>'  maxlength="155" >
								<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
									<option><spring:message code="apply.field" /></option>
									<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="beneficiary.apply.field.literature" /></option><!-- 문학  -->
									<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="beneficiary.apply.field.art" /></option><!-- 예술 -->
									<option value="2"  <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> ><spring:message code="beneficiary.apply.field.math" /></option><!-- 수학 -->
								</select>				
								<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
								<input name="benName" type="hidden" value="${resultInfo.benName}">
							</li>
						</ul>
						</form>
					</div>	 --%>
		
					<!-- 목록영역 -->
					<div class="default_tablestyle">
						<table class="" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />" cellpadding="0" cellspacing="0">
							<caption>${pageTitle} <spring:message code="title.list" /></caption>
							<colgroup>
								<col style="width: 9%;">
								<col style="width: 20%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
							</colgroup>
							<thead>
								<tr>
									<th><spring:message code="table.num" text="번호"/></th>
									<th><spring:message code="beneficiary.apply.name" text="신청자명"/></th>
									<th><spring:message code="beneficiary.dateOfBirth" text="생년월일"/></th>
									<th><spring:message code="beneficiary.belong" text="소속"/></th>
									<th><spring:message code="scholarship.benefit.applydate" text="신청일자"/></th>
									<th><spring:message code="beneficiary.screening" text="진행상태"/></th>
									<th><spring:message code="apply.field" text="신청분야"/></th>
								</tr>
							</thead>
							<tbody>
							<!-- 게시글 본문 -->
						<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
								<tr>
									<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
									<td class="left">
		    							<form name="subForm" method="post" action="<c:url value='/bene/mng/selectBeneMngDetail.do'/>">
					    					<input name="benAppSeq" type="hidden" value="<c:out value="${resultInfo.benAppSeq}"/>">
										    <input name="benName" type="hidden" value="<c:out value="${resultInfo.benName}"/>">
										    <input name="benBirth" type="hidden" value="<c:out value="${resultInfo.benBirth}"/>">
										    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
										    <input name="benBelong" type="hidden" value="${resultInfo.benBelong}">
										    <input name="benAppField" type="hidden" value="${resultInfo.benAppFieldNm}">
			    							<span class="link"><input type="submit" style="width:100px;border:solid 0px black;text-align:center;" value="<c:out value="${resultInfo.benName}"/>" ></span>
										</form>
									</td>
									<td><c:out value='${resultInfo.benBirth}'/></td>
									<td><c:out value='${resultInfo.benBelong}'/></td>
									<td><c:out value='${resultInfo.benApplyDate}'/></td>
							<c:choose>
								<c:when test="${resultInfo.benCk == 0}">		
									<td><spring:message code="scholindi.list.scholCk.wait" /></td>
								</c:when>
								<c:otherwise>
									<td><spring:message code="scholarship.benefit.confirm" /></td>
								</c:otherwise>
							</c:choose>
									<td><c:out value='${resultInfo.benAppFieldNm}'/></td>
								</tr>
						</c:forEach>
	
						<c:if test="${fn:length(resultList) == 0}">
								<!-- 글이 없는 경우 -->
								<tr>
									<td colspan="7"><spring:message code="common.nodata.msg" /></td>
								</tr>
						</c:if>
							</tbody>
						</table>
					</div>

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