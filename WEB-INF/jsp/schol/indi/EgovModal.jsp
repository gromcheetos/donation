<%
 /**
  * @Class Name : EgovModal.jsp
  * @Description : 모달 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.16   KHN          최초 생성

  */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="admin.schol.indi.web.EgovWebUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%-- <%
	String sScriptYn = request.getParameter("scriptYn") == null ? "" : (String)request.getParameter("scriptYn"); 
	String sModelName = request.getParameter("modalName") == null ? "" : (String)request.getParameter("modalName"); 
%>
<%if(sScriptYn.equals("Y")){ %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/modal.css' />">
<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script src="<c:url value='/js/modal.js' />"></script>
<script type="text/javascript">

function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_userInfo('1');
	}
}

/* 
function fn_egov_returnValue(retVal){
	setReturnValue(retVal);
	
	parent.window.returnValue = retVal;
	parent.window.close();
}  */

/*function fn_egov_returnUserInfo(emailId){

	var retVal = emailId;
	 parent.fn_egov_returnValue(retVal);

} */

function fn_egov_returnUserInfo(emailId){
	console.log(emailId);
	//document.getElementById("cInput").value=window.opener.setChildValue(emailId);
	//window.opener.setChildValue(emailId);
	//window.close();
} 

function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/schol/indi/DonerIdList.do'/>";
   	document.articleForm.submit();
}
function fn_egov_search_article(){
	document.articleForm.pageIndex.value = 1;
	document.articleForm.submit();
}



</script>
<%-- <%} %> --%>
</head>
<body>
<!-- The Modal -->
<form name="articleForm"  method="post" action = "<c:url value='/schol/indi/DonerIdList.do'/>"onSubmit="fn_egov_search_article(); return false;">
<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">

<div class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<div id="title" class="modal-title"><h2>기부자 아이디 검색</h2></div>
		</div>
		<div id="body" class="modal-body">
			<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">	
				<ul>
					<!-- 검색키워드 및 조회버튼 -->
					<li>
						<input class="s_input" name="searchWrd" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>'  maxlength="155" >
						<input type="submit" class="s_btn" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
					</li>
				</ul>
			</div>


<table class="pop_board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
<caption>${pageTitle} <spring:message code="title.list" /></caption>
<tbody class="ov">
	<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr>
		<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	    <td><c:out value="${result.emailId}"/></td>
	    <td><button class="" onClick="javascript:fn_egov_returnUserInfo('<c:out value="${result.emailId}" />'); return false;" /><spring:message code="button.select" /></button>
	    </td>	    
	  </tr>
	 </c:forEach>
 </tbody>
</table>

</div>
<input name="emailId" type="hidden" value="${Member.emailId}">

		<div class="modal-footer">
			
			<div class="btn">
				<button class="btn_style3" onClick="window.close()" title="<spring:message code="button.close" /> <spring:message code="input.button" />"><spring:message code="button.close" /></button>
				<div style="clear:both;"></div>
			</div>
		</div>
			
	</div>
</div>
</form>
</body>
</html>
