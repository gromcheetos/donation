<%
 /**
  * @Class Name : UserMngList.jsp
  * @Description : 회원관리 목록
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.02    SSY          최초 생성
  *   
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" 		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags" %>
<c:set var="pageTitle"><spring:message code="user.userManage.title" text="회원관리"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.list" text="목록"/></title>
		<meta http-equiv="content-language" content="ko">
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

		<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>

		<script type="text/javaScript">

			function press(event) {
	    		if (event.keyCode==13) {
	    			fnLinkPage('1');
	    		}
			}
			
			function fnCheckAll() {
    			var checkField = document.listForm.checkField;
    			if(document.listForm.checkAll.checked) {
        			if(checkField) {
            			if(checkField.length > 1) {
                			for(var i=0; i < checkField.length; i++) {
                    			checkField[i].checked = true;
                			}
            			} else {
                			checkField.checked = true;
            			}
        			}
	    		} else {
	        		if(checkField) {
	            		if(checkField.length > 1) {
	                		for(var j=0; j < checkField.length; j++) {
	                    		checkField[j].checked = false;
	                		}
	            		} else {
	                		checkField.checked = false;
	            		}
	        		}
	    		}
			}

			function fn_deleteUser() {
    			var checkField = document.listForm.checkField;
    			var id = document.listForm.checkId;
    			var checkedIds = "";
    			var checkedCount = 0;
    			if(checkField) {
        			if(checkField.length > 1) {
            			for(var i=0; i < checkField.length; i++) {
                			if(checkField[i].checked) {
                    			checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    			checkedCount++;
                			}
            			}
        			} else {
            			if(checkField.checked) {
                			checkedIds = id.value;
            			}
        			}
    			}
    			if(checkedIds.length > 0) {
    				//alert(checkedIds);
        			if(confirm("<spring:message code='common.delete.msg' text='삭제하시겠읍니까?' />")){
        				document.listForm.checkedIdForDel.value=checkedIds;
            			document.listForm.action = "<c:url value='/user/mng/delete.do'/>";
            			document.listForm.submit();
        			}
    			}
			}

			function fn_updateView(id) {
				document.listForm.selectedId.value = id;
    			document.listForm.action = "<c:url value='/user/mng/updateView.do'/>";
    			document.listForm.submit();
			}

			function fn_addUser() {
    			document.listForm.action = "<c:url value='/user/mng/insertView.do'/>";
    			document.listForm.submit();
			}

			function fnLinkPage(pageNo){
    			document.listForm.pageIndex.value = pageNo;
    			document.listForm.action = "<c:url value='/user/mng/list.do'/>";
    			document.listForm.submit();
			}

			function fn_search(){
				document.listForm.pageIndex.value = 1;
				document.listForm.action = "<c:url value='/user/mng/list.do'/>";
    			document.listForm.submit();
			}
		</script>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>
	<body>
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
                            	<li><spring:message code="user.userManage.title" text="회원관리"/></li>
                            	<li>&gt;</li>
                            	<li><strong><spring:message code="user.userManage.title" text="회원관리"/></strong></li>
                        	</ul>
                    	</div>
                	</div>
                	 <!-- 검색 필드 박스 시작 -->
					<div id="search_field">
                    	<div id="search_field_loc"><h2><strong>${pageTitle}&nbsp;&gt;&nbsp;<spring:message code="title.list" /></strong></h2></div>
						<form id="listForm" name="listForm" action="<c:url value='/user/mng/list.do'/>" method="post">
							<input name="selectedId" 		type="hidden" />
							<input name="checkedIdForDel" 	type="hidden" />
							<input name="pageIndex" 		type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	
							<fieldset><legend>조건정보 영역</legend>
								<div class="sf_start">
									<ul id="search_first_ul">
										<li><!-- 상태-->
				                			<select name="searchMemStatus" id="searchMemStatus" title="<spring:message code="user.search.sttusTitle" text="가입상태조건 선택"/>">
				                    			<option value="0" <c:if test="${empty mberVO.searchMemStatus || mberVO.searchMemStatus == '0'}">selected="selected"</c:if> ><spring:message code="common.select.all" text="전체"/></option>
				                    			<option value="A" <c:if test="${mberVO.searchMemStatus == 'A'}">selected="selected"</c:if> ><spring:message code="user.search.sttusA" text="가입신청"/></option>
				                    			<option value="D" <c:if test="${mberVO.searchMemStatus == 'D'}">selected="selected"</c:if> ><spring:message code="user.search.sttusD" text="삭제"/></option>
				                    			<option value="P" <c:if test="${mberVO.searchMemStatus == 'P'}">selected="selected"</c:if> ><spring:message code="user.search.sttusP" text="승인"/></option>
				                			</select>
										</li>
										<li><!-- 조건 -->
	                						<select name="searchCondition" id="searchCondition" title="<spring:message code="common.search.conditionTitle" text="조회조건 선택"/>">
	                    						<option value="0" <c:if test="${mberVO.searchCondition == '0'}">selected="selected"</c:if> ><spring:message code="common.id" text="아이디"/></option>
	                    						<option value="1" <c:if test="${empty mberVO.searchCondition || mberVO.searchCondition == '1'}">selected="selected"</c:if> ><spring:message code="common.name" text="이름"/></option>
	                						</select>
										</li>
										<!-- 검색키워드 및 조회버튼 -->
										<li>
											<input class="s_input" name="searchKeyword" type="text"  size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${mberVO.searchKeyword}"/>'  maxlength="255" >
											<div class="buttons">
												<a href="#LINK" onclick="javascript:fn_search(); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" /><spring:message code="button.inquire" text="조회"/> </a>
												<a href="#LINK" onClick="javascript:fn_deleteUser(); return false;"><spring:message code="title.delete" text="삭제"/></a>
												<a href="#LINK" onClick="javascript:fn_addUser(); return false;"><spring:message code="button.create" text="등록"/></a>
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
						<table cellpadding="0" cellspacing="0">
							<caption>${pageTitle} <spring:message code="title.list" text="목록"/></caption>
							<colgroup>
								<col style="width: 5%;">
								<col style="width: 5%;">
								<col style="width: 25%;">
								<col style="width: 20%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="<spring:message code="input.selectAll.title" />"></th><!-- 전체선택 -->
									<th><spring:message code="table.num" /></th><!-- 번호 -->
									<th class="board_th_link"><spring:message code="user.id" text="아이디"/></th>
									<th><spring:message code="user.name" text="성명"/></th>
									<th><spring:message code="user.gubun" text="가입구분"/></th>
									<th><spring:message code="user.status" text="상태"/></th>
									<th><spring:message code="table.regdate" text="등록일"/></th>
								</tr>
							</thead>
							<tbody>
<c:forEach var="result" items="${resultList}" varStatus="status">
								<!-- loop 시작 -->
								<tr>
									<td>
										<input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
										<input name="checkId" type="hidden" value="<c:out value='${result.uniqId}'/>"/>
									</td>
									<td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
									<td><a href="#LINK" onclick="javascript:fn_updateView('<c:out value="${result.memSeq}"/>'); return false;"><c:out value="${result.emailId}"/></a></td>
									<td><c:out value="${result.memName}"/></td>
									<td><c:out value="${result.memGubunNm}"/></td>
									<td><c:out value="${result.memStatusNm}"/></td>
									<td><c:out value="${fn:substring(result.regDate,0,10)}"/></td>
								</tr>
</c:forEach>
<c:if test="${fn:length(resultList) == 0}">
								<tr>
									<td colspan="8"><spring:message code="common.nodata.msg" /></td>
								</tr>
</c:if>
							</tbody>
						</table>
					</div>
					<!-- 페이지 네비게이션 시작 -->
					<div id="paging_div">
                   		<ul class="paging_align">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnLinkPage"/>
						</ul>
					</div>
					<!-- //페이지 네비게이션 끝 --> 
				</div>
				<!-- //content 끝 --> 
			</div>
			<!-- //container 끝 -->
        	<!-- footer 시작 -->
        	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        	<!-- //footer 끝 -->
		</div>
		<!-- //전체 레이어 끝 -->
	</body>
</html>