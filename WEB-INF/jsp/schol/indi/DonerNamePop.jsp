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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javascript">

function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_userInfo('1');
	}
}

function fn_egov_returnUserInfo(emailId){
	console.log(emailId);
	//document.getElementById("cInput").value=window.opener.setChildValue(emailId);
	window.opener.setChildValue(emailId);
	window.close();
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
<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
</head>
<body>

<form name="articleForm"  method="post" action = "<c:url value='/schol/indi/DonerIdList.do'/>"onSubmit="fn_egov_search_article(); return false;">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
	    <!-- 검색 필드 박스 시작 -->
    <div id="search_field">
        <div id="search_field_loc"><h2><strong>기부자 아이디 검색</strong></h2></div>
            <fieldset><legend>조건정보 영역</legend>    
            <div class="sf_start">
                <ul id="search_first_ul">
                    <li>
                        <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력"> 
                    </li>       
                </ul>
                <ul id="search_second_ul">
                    <li>
                        <div class="buttons" style="position:absolute;left:700px;top:47px;">
                            <a href="<c:url value='/schol/indi/DonerIdList.do'/>" onclick="javascript:fn_egov_search_article(); return false;"><img src="<c:url value='/images/img_search.gif'/>" alt="search" />조회 </a>
                        </div>                              
                    </li>
                </ul>           
            </div>          
            </fieldset>
    </div>
    <!-- //검색 필드 박스 끝 -->
    <div class="modal">
    <div id="body" class="modal-body">
    <div class="modal-content">
    <div class="default_tablestyle">
		<table class="pop_board_list" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
		<caption>${pageTitle} <spring:message code="title.list" /></caption>
		<colgroup>
		<col width="5%" >
        <col width="15%" >  
        <col width="5%" >
		</colgroup>
		<thead>
		<tr>
		<th scope="col" class="f_field" nowrap="nowrap">번호</th>
        <th scope="col" nowrap="nowrap">이메일아이디</th>
        <th scope="col" nowrap="nowrap">선택</th>
        </tr>
		</thead>
		<tbody class="ov">
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
			    <td><c:out value="${result.emailId}"/></td>
			    <td>
			    	<button class="" onClick="javascript:fn_egov_returnUserInfo('<c:out value="${result.emailId}"/>'); return false;" ><spring:message code="button.select" text="선택"/>	</button>
			    
			    </td>	    
			  </tr>
			 </c:forEach>
		 </tbody>
		</table>
		</div>
		
		<div class="xbuttons" align="center">
			<ul>
				<li>
					<br><br><a href="#LINK" class="s_submit"  onClick="window.close()"><spring:message code="button.close" /></a>
				</li>
			</ul>
		</div>
		</div>
		</div>
</div>
</form>
</body>
</html>
