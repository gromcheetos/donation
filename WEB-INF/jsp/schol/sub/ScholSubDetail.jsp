<%
 /**
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.26   KHN              최초 생성
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
<script src="<c:url value='/js/jquery.js' />"></script>
<script src="<c:url value='/js/jqueryui.js' />"></script>
<script src="<c:url value='/js/common.js'/>"></script>
<style>
	#doner {display:none;}
</style>
<script type="text/javascript">

	function fn_init(){
			
		var scholCk = ${result.scholCk}; //schol_ck

		if(scholCk == 1){
			$("#btn_no").css("display", "inline")
		}else if(scholCk == 0){
			$("#btn_ok").css("display", "inline")
		}				
}
	

/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_article(scholSeq){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		document.form.scholSeq.value = scholSeq;
		document.form.action = "<c:url value='/schol/sub/deleteArticle.do'/>";
		document.form.submit();
	}	
}	

function fn_egov_scholCk_ok() {
			document.form.action = "<c:url value='/schol/sub/updateScholCk.do'/>";
		  	document.form.submit();		
	}
	  	
function fn_egov_scholCk_no() {

			document.form.action = "<c:url value='/schol/sub/updateScholCk.do'/>";
		 	document.form.submit();
	
}
function fn_egov_scholCk_closed() {
	
	document.form.action = "<c:url value='/schol/sub/closeScholCk.do'/>";
 	document.form.submit();
}
function fn_updateForm() {	
	document.form.action = "<c:url value='/schol/sub/updateScholSubView.do'/>";
	document.form.submit();          
}
</script>

</head>
<body onload="fn_init();">
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
	<!-- 타이틀 -->
	<div id="search_field">
		<div id="search_field_loc"><h2><strong><spring:message code="scholspecial.list.subscriptionDetail" /></strong></h2></div>
   	</div>
	<form name="form" method="post" action="<c:url value=''/>">
   		<input name="scholSeq" type="hidden" value="<c:out value="${result.scholSeq}" />">                	
   		<input name="scholCk" type="hidden" value="<c:out value="${result.scholCk}" />"> 
	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
		<!-- 장학금명 -->
		<tr>	
			<th width="15%"><spring:message code="comCopBbs.articleVO.list.scholItem" /></th>
			<td class="left" width="85%" colspan="3" nowrap="nowrap"><c:out value="${result.scholItem}"/></td>
		</tr>				
		<!-- 목표금액 -->
		<tr>			
			<th><spring:message code="scholspecial.list.targetAmount" /></th>
			<td class="left"><c:out value="${result.scholGoalAmount}"/></td>
		</tr>
		<!-- 현재모금금액-->
		<tr>	
			<th><spring:message code="scholspecial.list.currentAmount" /></th>
			<td class="left"><c:out value="${result.scholCurAmount}" /></td>
		</tr>
		<!-- 확정여부 -->
		<tr>	
			<th><spring:message code="scholarship.status" /></th>
		<c:choose>
			<c:when test="${result.scholCk == 0}">
			<td class="left" ><spring:message code="scholindi.list.scholCk.wait" /></td>
			</c:when>
			<c:when test="${result.scholCk == 1}">
			<td class="left"><spring:message code="scholindi.list.scholCk.confirm" /></td>
			</c:when>
			<c:otherwise>
			<td class="left" ><spring:message code="scholarship.closed" /></td>
			</c:otherwise>
		</c:choose>
		</tr>
		<!-- 상세내용 -->
		<tr>
			<th class="vtop"><spring:message code="scholspecial.list.detail" /></th>
			<td colspan="5" class="cnt">
				<c:out value="${fn:replace(result.scholNote , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>

	</table>
	<!-- 하단 버튼 -->
	<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
		<ul>
			<li><a href="#LINK" class="s_submit" onclick="javascript:fn_updateForm('<c:out value="${result.scholSeq}"/>'); return false;"><spring:message code="title.update" /></a> </li>
			<li><a href="#LINK" class="s_submit" onClick="fn_egov_delete_article('<c:out value="${result.scholSeq}"/>'); return false;"  ><spring:message code="button.delete" /></a></li>
			<li><a href="<c:url value='/schol/sub/selectScholSubList.do' />" class="s_submit"><spring:message code="button.list" /></a></li>
			<li><div id="btn_ok" style="display: none;"><a href="#LINK" class="s_submit" id="ok" onclick="fn_egov_scholCk_ok('<c:out value="${result.scholSeq},${result.scholCk}"/>'); return false;"><spring:message code="button.scholCk.confirm"/></a></div></li>
			<li><div id="btn_no" style="display: none;"><a href="#LINK" class="s_submit" id="no" onclick="fn_egov_scholCk_no('<c:out value="${result.scholSeq},${result.scholCk}"/>'); return false;"><spring:message code="button.scholCk.confirm.cancel"/></a></div></li>															
			<li><a href="#LINK" class="s_submit" onclick="fn_egov_scholCk_closed('<c:out value="${result.scholSeq},${result.scholCk}"/>'); return false;"><spring:message code="scholarship.closed"/></a> </li>															
		</ul>	
		
	</div>
	<br><br>

	</form>
<!--기부자 리스트 시작-->
		<div>
			<table class="wTable" summary="<spring:message code="scholarship.donerList" arguments="${pageTitle}" />">
			<caption>${pageTitle} <spring:message code="title.list" /></caption>
			<colgroup>
				<col style="width: 9%;">
				<col style="width: 40%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
			</colgroup>
			<thead>
			<tr>
				<th><spring:message code="table.num" /></th><!-- 번호 -->
				<th class=""><spring:message code="comCopBbs.articleVO.regist.doner" /></th><!--기부자ID  -->
				<th><spring:message code="scholindi.list.detail.donername" /></th><!-- 기부자이름 -->
				<th><spring:message code="scholindi.list.detail.scholAmount" /></th><!-- 기부금액 -->
				<th><spring:message code="scholarship.donation.apply" /></th><!-- 기부일자 -->
				<th><spring:message code="scholarship.donation.period" /></th><!-- 기부기간  -->
			</tr>
			</thead>
			<tbody class=""> 
				<!-- 본문 -->
				<c:forEach items="${resultList}" var="resultList" varStatus="status">				
				<tr>			
						<td><c:out value='${resultList.doAppSeq}'/></td>			
						<td><c:out value='${resultList.donerEmailId}'/></td>
						<td><c:out value='${resultList.donerName}'/></td>
						<td><c:out value='${resultList.doAmount}'/></td>
						<td><c:out value='${resultList.doAppDate}'/></td>
						<td><c:out value='${resultList.doPeriod}'/></td>	
				</tr>
				</c:forEach>			
				 <c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td colspan="6"><spring:message code="common.nodoner.msg" /></td>
				</tr>
				</c:if>
				</tbody>
			</table>
		</div>	
</div>
</div>
</div>
</body>
</html>
