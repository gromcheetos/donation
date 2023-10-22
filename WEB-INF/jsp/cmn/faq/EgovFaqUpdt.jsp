<%
	/**
	 * @Class Name : EgovFaqUpdt.jsp
	 * @Description : EgovFaqUpdt 화면
	 * @Modification Information
	 * @
	 * @  수정일             수정자                   수정내용
	 * @ -------    --------    ---------------------------
	 * @ 2019.11.27   KHN              최초 생성
	 
	 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" 			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" 			uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" 			uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" 	uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title" /></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle }<spring:message code="title.update" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link type="text/css" href="<c:url value='/'/>css/common.css" rel="stylesheet"  >
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="faqVO" staticJavascript="false"	xhtml="true" cdata="false" />

		<script type="text/javascript">
			function fn_egov_validateForm(obj){
	    		return true;
			}
		
			/* ********************************************************
			 * 초기화
			 ******************************************************** */
			function fn_egov_init() {
				// 첫 입력란에 포커스..
				document.getElementById("faqVO").qestnSj.focus();
			}

			/* ********************************************************
			 * 저장처리화면
			 ******************************************************** */
			function fn_faqUpdate() {
				if (!validateFaqVO(document.faqVO)){
					return;
				}
				if (confirm("<spring:message code="common.update.msg" />")) {
					document.faqVO.action = "<c:url value='/cmn/faq/updateFaq.do'/>";
					document.faqVO.submit();
				}
			}

			/* ********************************************************
			 * 목록 으로 가기
			 ******************************************************** */
			function fn_faqList() {
				faqVO.action = "<c:url value='/cmn/faq/selectFaqList.do'/>";
				faqVO.submit();
			}
		</script>
		<style type="text/css">
			.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
			.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
			.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
		</style>
		<style type="text/css">
			h1 {font-size:12px;}
			caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>
	<body onLoad="fn_egov_init();">

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
                            	<li>HOME</li>
                            	<li>&gt;</li>
                            	<li><strong>FAQ</strong></li>
                        	</ul>
                    	</div>
                	</div>
					<!-- 검색 필드 박스 시작 -->
					<div id="search_field">
						<div id="search_field_loc"><h2>${pageTitle} <spring:message code="title.update" /></h2></div>
					</div>
					<form:form commandName="faqVO" name="faqVO" method="post" >
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
						<input name="faqId" type="hidden" value="${faqVO.faqId}">
						<!-- 수정폼 -->
						<div class="" >
							<table class="wTable" >
								<!-- 입력 -->
								<c:set var="inputTxt"><spring:message code="input.input" text="입력"/></c:set>
								<tr>
									<th width="15%" height="23" nowrap="nowrap">
										<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnSj" text="질문제목"/> </c:set>
										<label for="qestnSj">${title}<span class="pilsu">*</span></label>
									</th>
									<td width="85%" nowrap="nowrap">
					    				<form:input path="qestnSj" title="${title} ${inputTxt}" size="70" maxlength="70" />
		   								<form:errors path="qestnSj" cssClass="error" />
									</td>
								</tr>
								<!-- 질문 내용  -->
								<tr>
									<th height="23">
										<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnCn" text="질문내용" /></c:set>
										<label for="qestnCn">${title } <span class="pilsu">*</span></label>
									</th>
									<td>
										<form:textarea path="qestnCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
										<div><form:errors path="qestnCn" cssClass="error" /></div>
									</td>
								</tr>
								<!-- 답변 내용  -->
								<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.answerCn" text="답변내용" /> </c:set>
								<tr>
									<th><label for="answerCn">${title } <span class="pilsu">*</span></label></th>
									<td>
										<form:textarea path="answerCn" title="${title} ${inputTxt}" cols="300" rows="20" />   
										<div><form:errors path="answerCn" cssClass="error" /></div>
									</td>
								</tr>
							</table>
						</div>
						<!-- 하단 버튼 -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<%-- <li><input type="submit" class="s_submit" value="<spring:message code="button.update" />" /></li> --%>
								<%-- <li><a href="<c:url value='/cmn/faq/selectFaqList.do' />"  class="s_submit" ><spring:message code="button.list" /></a></li> --%>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_faqUpdate(); return false;"><spring:message code="button.update" /></a></li>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_faqList();   return false;"><spring:message code="button.list" /></a></li>
							</ul>
						</div>	
						<%-- <table border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
						<td><input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" /></td>
						<td><span class="btn_s"><a href="<c:url value='/cmn/faq/selectFaqList.do' />"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span></td>
						</tr>
						</table> --%>
					</form:form>
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
