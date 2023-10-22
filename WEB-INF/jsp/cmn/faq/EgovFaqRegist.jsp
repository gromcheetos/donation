<%
 /**
  * @Class Name : EgovFaqRegist.jsp
  * @Description : EgovFaqRegist 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.11.27  KHN              최초 생성
  
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
<c:set var="pageTitle"><spring:message code="comUssOlhFaq.faqVO.title"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.create" /></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta http-equiv="content-language" content="ko">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<%-- <script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script> --%>
		<%-- <script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script> --%>
		<%-- <script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script> --%>
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="faqVO" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javascript">
			/* ********************************************************
			 * 초기화
			 ******************************************************** */
			function fn_egov_init(){
				// 첫 입력란에 포커스
				document.getElementById("faqVO").qestnSj.focus();
			}

			/* ********************************************************
			 * 저장처리화면
			 ******************************************************** */
			function fn_regist(){
				//input item Client-Side validate
				if (!validateFaqVO(document.faqVO)) {	
					return false;
				} else {
					if(confirm("<spring:message code="common.regist.msg" />")){	
						//form.submit();
						document.faqVO.action = "<c:url value='/cmn/faq/insertFaq.do'/>";
	            		document.faqVO.submit();
					}
				} 
			}
		</script>
		<style type="text/css">
			.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  			.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  			.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
		</style>
		<title>FAQ 등록 </title>

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
                            	<li>HOME</li>
                            	<li>&gt;</li>
                            	<li><strong>FAQ</strong></li>
                        	</ul>
                    	</div>
                	</div>
					<!-- 검색 필드 박스 시작 -->
           			<div id="search_field">
               			<div id="search_field_loc"><h2>${pageTitle} <spring:message code="title.create" /></h2></div>
           			</div>
    				<form:form commandName="faqVO" name="faqVO" action="${pageContext.request.contextPath}/cmn/faq/insertFaq.do" method="post" onSubmit="fn_egov_regist_faq(document.forms[0]); return false;"> 
						<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="cmd"  value="<c:out value='save'/>">
						<!-- 등록폼 -->
						<div id="border" class="" >
							<table class="wTable">	
								<!-- 입력 -->
								<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
								<!-- 질문 제목   -->
								<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnSj"/> </c:set>
								<tr>
									<th width="15%"><label for="qestnSj">${title}<span class="pilsu">*</span></label></th>
									<td width="85%">
			    						<form:input path="qestnSj" title="${title} ${inputTxt}" size="70" maxlength="70" />
   										<div><form:errors path="qestnSj" cssClass="error" /></div>     
									</td>
								</tr>
								<!-- 질문 내용  -->
								<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnCn"/> </c:set>
								<tr>
									<th width="15%"><label for="qestnCn">${title } <span class="pilsu">*</span></label></th>
									<td width="85%">
										<form:textarea path="qestnCn" title="${title} ${inputTxt}" class="textarea" cols="300" rows="20" />   
										<div><form:errors path="qestnCn" cssClass="error" /></div>  
									</td>
								</tr>

								<!-- 답변 내용  -->
								<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.answerCn"/> </c:set>
								<tr>
									<th width="15%"><label for="answerCn">${title } <span class="pilsu">*</span></label></th>
									<td width="85%">
										<form:textarea path="answerCn" title="${title} ${inputTxt}" class="textarea" cols="300" rows="20" />   
										<div><form:errors path="answerCn" cssClass="error" /></div>  
									</td>
								</tr>
							</table>
						</div>

						<!-- 하단 버튼 -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_regist(); return false;"><spring:message code="button.create" /></a></li>
								<%-- <input type="submit" class="s_submit" value="<spring:message code="button.create" />" /> --%>
								<li><a class="s_submit" href="<c:url value='/cmn/faq/selectFaqList.do' />" ><spring:message code="button.list" /></a></li>
							</ul>
							<%-- <table>
								<tr>
									<td><input type="submit" class="s_submit" value="<spring:message code="button.create" />" /></td>
									<td><a class="s_submit" href="<c:url value='/cmn/faq/selectFaqList.do' />" ><spring:message code="button.list" /></a></td>
								</tr>
							</table> --%>
						</div>
						<!-- 버튼 끝 -->  
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
