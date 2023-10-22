<%
 /**
  * @Class Name : UserMngPwUpdt.jsp
  * @Description : 회원암호수정 JSP
  * @Modification Information
  * @
  * @  수정일       수정자                수정내용
  * @ ----------    --------    ---------------------------
  * @ 2020.02.13    SSY          최초 생성
  *
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="user.managePwUpdt.title" text="비밀번호변경"/></c:set>
<!DOCTYPE html>
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.create" text="등록"/></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css' />">
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
		<script type="text/javaScript" Language="javascript" defer="defer">
			$(document).ready(function() {
				$("#btn_update").click(function(e){
					fnUpdate();
				});

				$("#btn_list").click(function(e){
					fnListPage();
				});
				
				$("#btn_reset").click(function(e){
					document.passwordChgVO.reset();
				});
			});
			<%--
			<li><a class="s_submit" id="btn_update"><spring:message code="button.update" /></a></li>
			<li><a class="s_submit" id="btn_list"><spring:message code="button.list" /></a></li>
			<li><a class="s_submit" id="btn_reset"><spring:message code="button.reset" /></a></li>
			<div class="btn">
			<input type="submit" class="s_submit" value="<spring:message code="button.update" />"/>
			<span class="btn_s"><a href="<c:url value='/uss/umt/EgovMberManage.do' />" ><spring:message code="button.list" /></a></span>
			<button class="btn_s2" onClick="document.passwordChgVO.reset();;return false;" ><spring:message code="button.reset" /></button>
			</div><div style="clear:both;"></div>
			--%>
			function fnListPage(){
    			document.passwordChgVO.action = "<c:url value='/user/mng/list.do'/>";
    			document.passwordChgVO.submit();
			}
			
			function fnUpdate(){
				if(validatePasswordChgVO(document.passwordChgVO)){
					if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            			alert("<spring:message code="fail.user.passwordUpdate2" />");
            			return false;
        			}
        			document.passwordChgVO.submit();
        			return  true;
    			}else{
    				return false;
    			}
			}
			
			<c:if test="${!empty resultMsg}">alert('<spring:message code="${resultMsg}" />');</c:if>
		</script>
		<style type="text/css">
			.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  			.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  			.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
		</style>
		<title>공지사항 수정</title>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
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
                    	<div id="search_field_loc"><h2><strong>${pageTitle} <spring:message code="title.create" text="등록"/></strong></h2></div>
                	</div>
					<form name="passwordChgVO" method="post" action="<c:url value="/user/mng/UserPwUpdt.do"/>" onsubmit="fnUpdate(); return false;">
						<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
						<input name="checkedIdForDel" type="hidden" />
						<!-- 검색조건 유지 -->
						<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						<input type="hidden" name="searchMemStatus" value="<c:out value='${userSearchVO.searchMemStatus}'/>"/>
						<%-- <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/> --%>
						<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
			        
						<div class="">
							<!-- 등록폼 -->
							<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
								<caption>${pageTitle} <spring:message code="title.create" /></caption>
								<colgroup>
									<col style="width: 16%;"><col style="width: ;">
								</colgroup>
								<tbody>
									<!-- 입력 -->
									<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
									<!-- 일반회원아이디 -->
									<c:set var="title"><spring:message code="user.userManageRegist.id" text="회원아이디"/></c:set>
									<tr>
										<th>${title}</th>
										<td class="left">
											<input name="mberId" id="mberId" type="text" size="20" value="<c:out value='${userManageVO.emailId}'/>"  maxlength="20" readonly >
			                				<input name="memSeq" id="memSeq" type="hidden" size="20" value="<c:out value='${userManageVO.memSeq}'/>" >
			                				<%-- <input name="userTy" id="userTy" type="hidden" size="20" value="<c:out value='${userManageVO.userTy}'/>" > --%>
										</td>
									</tr>
									<!-- 기존 비밀번호 -->
									<c:set var="title"><spring:message code="user.userManage.oldPass" text="기존비밀번호"/></c:set>
									<tr>
										<th>${title}<span class="pilsu">*</span></th>
										<td class="left">
											<input type="password" name="oldPassword" id="oldPassword"  size="20" value=""  maxlength="100" >
										</td>
									</tr>
									<!-- 비밀번호 -->
									<c:set var="title"><spring:message code="user.userManageRegist.pass" text="비밀번호"/></c:set>
									<tr>
										<th>${title}<span class="pilsu">*</span></th>
										<td class="left">
						    				<input type="password" name="newPassword" id="newPassword"  size="20" value=""  maxlength="100" >
										</td>
									</tr>
									<!-- 비밀번호확인 -->
									<c:set var="title"><spring:message code="user.userManage.passConfirm" text="비밀번호확인"/></c:set>
									<tr>
										<th>${title}<span class="pilsu">*</span></th>
										<td class="left">
						    				<input type="password" name="newPassword2" id="newPassword2"  size="20" value=""  maxlength="100" >
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<li><a class="s_submit" id="btn_update"><spring:message code="button.update" /></a></li>
								<li><a class="s_submit" id="btn_list"><spring:message code="button.list" /></a></li>
								<li><a class="s_submit" id="btn_reset"><spring:message code="button.reset" /></a></li>
							</ul>
						</div>
						<!-- 버튼 끝 -->
						<!-- 하단 버튼 -->
						<%-- <div class="btn">
							<input type="submit" class="s_submit" value="<spring:message code="button.update" />"/>
							<span class="btn_s"><a href="<c:url value='/uss/umt/EgovMberManage.do' />" ><spring:message code="button.list" /></a></span>
							<button class="btn_s2" onClick="document.passwordChgVO.reset();;return false;" ><spring:message code="button.reset" /></button>
							</div><div style="clear:both;"></div>
						</div> --%>
					</form>
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
