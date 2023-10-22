<%
 /**
  * @Class Name : UserMngtUpdt.jsp
  * @Description : 회원상세조회, 수정 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2020.02.12    SSY          최초 생성
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" 			uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" 	uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="user.userManage.title" text="회원관리"/></c:set>
<!DOCTYPE html>
<html>
	<head>
		<title>${pageTitle}<spring:message code="title.update" text="수정"/></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

		<script type="text/javaScript" >
			$(document).ready(function() {
				
				//저장
				$("#btn_save").click(function(e){
					fnUpdate();
				});
				//삭제
				$("#btn_delete").click(function(e){
					alert("delete");
				});
				//목록
				$("#btn_list").click(function(e){
					fnListPage();
				});
				//비밀번호 변경
				$("#btn_pwChnage").click(function(e){
					fnPasswordMove();
				});
				//취소
				$("#btn_cancel").click(function(e){
					document.userManageVO.reset();
				});
			
			});

			function fnListPage(){
	    		document.userManageVO.action = "<c:url value='/user/mng/list.do'/>";
	    		document.userManageVO.submit();
			}
			function fnDeleteMber(checkedIds) {
				if(confirm("<spring:message code="common.delete.msg" />")){
		    		document.userManageVO.checkedIdForDel.value=checkedIds;
		    		document.userManageVO.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>";
		    		document.userManageVO.submit();
				}
			}

			function fnPasswordMove(){
	    		document.userManageVO.action = "<c:url value='/user/mng/UserPwUpdtView.do'/>";
	    		document.userManageVO.submit();
			}

			function fnUpdate(){
				//저장하시겠습니까
				if(confirm("<spring:message code="common.save.msg" />")){
					if(validateUserManageVO(document.userManageVO)){
						document.userManageVO.submit();
						return true;
		    		}else{
		    			return false;
		    		}
				}
			}
		</script>
		<style type="text/css">
			.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  			.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  			.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
		</style>
		<title>${pageTitle}<spring:message code="title.update" text="수정"/></title>
	</head>

	<body>
		<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
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
                            	<li>회원관리</li>
                            	<li>&gt;</li>
                            	<li><strong>회원관리</strong></li>
							</ul>
                    	</div>
                	</div>
					<!-- 검색 필드 박스 시작 -->
                	<div id="search_field">
                    	<div id="search_field_loc"><h2><strong>${pageTitle}<spring:message code="title.update" text="수정"/></strong></h2></div>
                	</div>

					<!-- content start -->
					<form:form commandName="userManageVO" action="/user/mng/updateProcess.do" name="userManageVO"  method="post" onSubmit="fnUpdate(); return false;">
					<%-- <form:form commandName="userManageVO" name="userManageVO"  method="post" > --%> 
						<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
						<input name="checkedIdForDel" type="hidden" />
						<!-- 검색조건 유지 -->
						<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						<input type="hidden" name="searchMemStatus" value="<c:out value='${userSearchVO.searchMemStatus}'/>"/>
						<%-- <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/> --%>
						<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						<!-- for validation -->
						<input type="hidden" name="password" id="password" value="Test#$123)"/>
						<input type="hidden" name="selectedId" id="selectedId" value=""/>  
			
						<div>
							<!-- 수정폼 -->
							<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
								<caption>${pageTitle} <spring:message code="title.create" text="등록"/></caption>
								<colgroup>
									<col style="width: 22%;"><col style="width: ;">
								</colgroup>
								<tbody>
									<!-- 입력/선택 -->
									<c:set var="inputTxt"><spring:message code="input.input" text="입력"/></c:set>
									<c:set var="inputSelect"><spring:message code="input.cSelect" text="선택"/></c:set>
									<!-- 회원아이디 -->
									<c:set var="title"><spring:message code="user.userManageRegist.id" text="회원아이디"/></c:set>
									<tr>
										<th><label for="emailId">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:input path="emailId" id="emailId" title="${title} ${inputTxt}" size="20" readonly="true" maxlength="20" />
				                			<form:errors	 path="emailId" cssClass="error" />
				                			<form:hidden path="memSeq" />
										</td>
									</tr>
									<!-- 일반회원이름 -->
									<c:set var="title"><spring:message code="user.userManageRegist.name" text="회원이름"/></c:set>
									<tr>
										<th><label for="memName">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:input path="memName" id="memName" title="${title} ${inputTxt}" size="50" maxlength="60" />
											<div><form:errors path="memName" cssClass="error" /></div> 
										</td>
									</tr>
									<!-- 회원상태코드 -->
									<c:set var="title"><spring:message code="user.userManageRegist.status" text="회원상태코드"/></c:set>
									<tr>
										<th><label for="memStatus">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:select path="memStatus" id="memStatus" title="${title} ${inputSelect}">
												<form:option value="" label="${inputSelect}"/>
												<form:options items="${memSstatusCombo}" itemValue="code" itemLabel="codeNm"/>
											</form:select>
											<div><form:errors path="memStatus" cssClass="error"/></div>
										</td>
									</tr>
									<!-- 회원구분코드 -->
									<c:set var="title"><spring:message code="user.userManageRegist.gubun" text="회원구분코드"/></c:set>
									<tr>
										<th><label for="memGubun">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:select path="memGubun" id="memGubun" title="${title} ${inputSelect}">
												<form:option value="" label="${inputSelect}"/>
												<form:options items="${memGubunCombo}" itemValue="code" itemLabel="codeNm"/>
											</form:select>
											<div><form:errors path="memGubun" cssClass="error"/></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<li><a class="s_submit" id="btn_save"><spring:message code="button.save" /></a></li>
								<li><a class="s_submit" id="btn_delete"><spring:message code="button.delete" /></a></li>
								<li><a class="s_submit" id="btn_list"><spring:message code="button.list" /></a></li>
								<li><a class="s_submit" id="btn_pwChnage"><spring:message code="button.userManage.passwordChange" /></a></li>
								<li><a class="s_submit" id="btn_cancel"><spring:message code="button.reset" /></a></li>
							</ul>
							<%-- <input type="submit" class="s_submit" value="<spring:message code="button.save" />"  />
							<button class="s_submit" onClick="fnDeleteMber('<c:out value='${userManageVO.memSeq}'/>'); return false;" ><spring:message code="button.delete" text="삭제"/></button>
							<span class="s_submit"><a href="<c:url value='/uss/umt/EgovMberManage.do' />" ><spring:message code="button.list" text="목록"/></a></span>
							<button class="s_submit" onClick="fnPasswordMove(); return false;" ><spring:message code="user.userManage.passwordChange" text="비밀번호변경"/></button>
							<button class="s_submit" onClick="fnLockIncorrect(); return false;" ><spring:message code="user.common.lockAtBtn" text="로그인인증제한해제"/></button>
							<button class="s_submit" onClick="document.userManageVO.reset(); return false;" ><spring:message code="button.reset" text="취소"/></button> --%>
						</div>
					</form:form>
				</div>
				<!-- content end -->
			</div>
			<!-- //container 끝 -->
			<!-- footer 시작 -->
			<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    		<!-- //footer 끝 -->
		</div>
	</body>
</html>