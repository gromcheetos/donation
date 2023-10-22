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
		<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/com.css' />"> --%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="<c:url value='/js/jquery.js' />"></script>
		<script src="<c:url value='/js/jqueryui.js' />"></script>
		
		<script type="text/javascript">
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
				document.articleForm.action = "<c:url value='/schol/sub/selectScholSubList.do'/>";
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
			function fn_egov_inquire_articledetail(scholSeq,scholItem) {
				
				document.articleForm.scholItem.value = scholItem;
				document.articleForm.scholSeq.value = scholSeq;
				//document.articleForm.emailId.value = emailId;
			  	document.articleForm.action = "<c:url value='/schol/sub/selectScholSubDetail.do'/>";
			  	document.articleForm.submit();
			}

			function benList(value){
				var values = [];
				$.post(
					"/schol/sub/beneficiaryAjax.do",
					{scholSeq : value},
					function(retVal){
						var str  ='';
						str +='		<colgroup>';
						str +='			<col width="25%">';
						str +='			<col width="25%">';
						str +='		</colgroup>';
						str +='		<thead>';
						str +='			<tr>';
						str +='				<th><spring:message code="scholarship.beneficiary.name" /></th>';
						str +='				<th><spring:message code="scholarship.benefit.applydate" /></th>';		
						str +='			</tr>';
						str +='		</thead>';
						str +='		<tbody>';
						if(retVal.count > 0){
						values = retVal.beneficialy;
						$.each(values, function( index, value ){
						str +='			<tr>';
						str +='				<td>'+value.benName+'</td>';
						str +='				<td>'+value.benApplyDate+'</td>';
						str +='			</tr>';
						});
						str +='		</tbody>';
						} else {
						str +='<tr>';
						str +='<td colspan="2"><spring:message code="common.nobeneficiary.msg"/></td>';
						str +='</tr>';
						}
						$("#beneficialy").html(str);
					},"json"
				);	
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
                            	<li>장학사업관리</li>
                            	<li>&gt;</li>
                            	<li><strong>모금장학금</strong></li>
                        	</ul>
                    	</div>
                	</div>
					<!-- 검색 필드 박스 시작 -->
					<div id="search_field">
	                    <div id="search_field_loc"><h2><strong><spring:message code="scholspecial.list.subscriptionList" /></strong></h2></div>
						<form name="articleForm" action="<c:url value='/schol/sub/selectScholSubList.do'/>" method="post" onSubmit="fn_list(); return false;">
							<input name="scholItem" type="hidden" value="${resultInfo.scholItem}">
							<input name="emailId" type="hidden" value="${resultInfo.emailId}">
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
							<fieldset>
	                        	<legend>조건정보 영역</legend>
		                        <div class="sf_start">
		                            <ul id="search_first_ul">
										<li>
											<select name="searchCnd" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
												<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.list.scholItem" /></option><!-- 장학금명  -->
												<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comCopBbs.articleVO.regist.doner" /></option><!-- 기부자아이디 -->
											</select>
										</li>
										<li>
											<input class="s_input" name="searchWrd" type="text"  size="35" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
										</li>
										<!-- 검색키워드 및 조회버튼 -->
										<li>
											<div class="buttons" >
												<a href="#LINK" onclick="javascript:fn_list(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" /><spring:message code="title.inquire" /></a>
												<%-- <input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" /> --%>
												<a href="<c:url value='/schol/sub/insertScholSubView.do?scholSeq=${serchVO.scholSeq}' />"  title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a>
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
						<table class="board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />" cellpadding="0" cellspacing="0">
						<caption>${pageTitle} <spring:message code="title.list" /></caption>
						<colgroup>
							<col style="width: 9%;">
							<col style="width: 30%;">
							<col style="width: 13%;">
							<col style="width: 13%;">
							<col style="width: 13%;">
							<col style="width: 13%;">
							<col style="width: 13%;">
						</colgroup>
						<thead>
							<tr>
								<th><spring:message code="table.num" /></th><!-- 번호 -->
								<th class="board_th_link"><spring:message code="scholspecial.list.specialItem" /></th><!--장학금명  -->
								<th><spring:message code="scholspecial.list.targetAmount" /></th><!-- 목표금액 -->
								<th><spring:message code="scholspecial.list.currentAmount" /></th><!-- 현재금액 -->
								<th><spring:message code="table.regdate" /></th><!-- 등록일 -->
								<th><spring:message code="comCopBbs.articleVO.list.scholConfirm" /></th><!-- 확정일  -->
								<th><spring:message code="scholarship.list.beneficiary" /></th><!-- 수혜자 목록  -->
							</tr>
						</thead>
						<tbody>
						<!-- 게시글 본문 -->
<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
							<tr>
								<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
								<td align="left">
    								<form name="subForm" method="post" action="<c:url value='/schol/sub/selectScholSubDetail.do'/>">
			    						<input name="scholSeq" type="hidden" value="<c:out value="${resultInfo.scholSeq}"/>">
			    						<input name="scholItem" type="hidden" value="<c:out value="${resultInfo.scholItem}"/>">
			    						<input name="scholItem" type="hidden" value="<c:out value="${resultInfo.scholCk}"/>">
			    						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			    						<input name="emailId" type="hidden" value="${resultInfo.emailId}">
			    						<span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${resultInfo.scholItem}"/>" ></span>
									</form>
								</td>
								<td><c:out value='${resultInfo.scholGoalAmount}'/></td>
								<td><c:out value='${resultInfo.scholCurAmount}'/></td>
								<td><c:out value='${resultInfo.scholDate}'/></td>
	<c:choose>
		<c:when test="${resultInfo.scholCk == 0}">		
								<td>&nbsp;</td>
		</c:when>
		<c:otherwise>
								<td><c:out value='${resultInfo.scholConfirm}'/></td>
		</c:otherwise>
	</c:choose>
								<td>
									<ul>
										<li><a href="#LINK" class="s_submit" onclick="javascript:benList('<c:out value="${resultInfo.scholSeq}"/>'); return false;"><spring:message code="scholarship.list.beneficiaryList" /></a> </li>
									</ul>
								</td>
							</tr>
</c:forEach>

<c:if test="${fn:length(resultList) == 0}">
							<!-- 글이 없는 경우 -->
							<tr>
								<td colspan="5"><spring:message code="common.nodata.msg" /></td>
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
				<br>
				<div class="default_tablestyle">
					<table class="board_list" id="beneficialy" summary="<spring:message code="scholarship.list.beneficiary" arguments="${pageTitle}" />">
						<caption>${pageTitle} <spring:message code="scholarship.list.beneficiary" /></caption>
						<tbody> 
							<!-- 본문 -->
						</tbody>
					</table>
					<input name="scholSeq" type="hidden" value="0">
					<input name="scholItem" type="hidden" value="${resultInfo.scholItem}">
					<input name="emailId" type="hidden" value="${ScholVO.emailId}">
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
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