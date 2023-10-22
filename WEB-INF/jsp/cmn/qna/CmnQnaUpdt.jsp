<%
 /**
  * @Class Name : EgovQnaUpdt.jsp
  * @Description : EgovQnaUpdt 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.02   KHN              최초 생성
  
  */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${pageTitle } <spring:message code="title.update" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qnaVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){
	// 첫 입력란에 포커스..
	document.getElementById("qnaVO").qnaTitle.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_qna(){
	if (!validateQnaVO(qnaVO)) {		 			
		return false;		
	} else {
		
		if(confirm("<spring:message code="common.update.msg" />")){
			qnaVO.action = "<c:url value='/cmn/qna/updateQna.do'/>";
			qnaVO.submit();	
		}					
	}	
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_list() {
	qnaVO.action = "<c:url value='/cmn/qna/selectQnaList.do'/>";
	qnaVO.submit();	
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

<!-- 상단타이틀 -->
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
                           	<li>켜뮤니티관리</li>
                           	<li>&gt;</li>
                           	<li><strong>QnA</strong></li>
						</ul>
                   	</div>
               	</div>
         <!-- 검색 필드 박스 시작 -->
	  	<div id="search_field">
			<div id="search_field_loc"><h2>${pageTitle} <spring:message code="title.update" /></h2></div>
		</div>
		<form:form commandName="qnaVO" name="qnaVO" action="${pageContext.request.contextPath}/cmn/qna/updateQna.do" method="post" onSubmit="fn_egov_updt_qna(document.forms[0]); return false;">  
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input name="qnaSeq" type="hidden" value="${qnaVO.qnaSeq}">
	<!-- 수정폼 -->
	<div>
		<table class="wTable" >
		<!-- 입력 -->		
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>		
		<!-- 질문제목 -->
		<tr>
			<th width="15%" height="23" nowrap="nowrap">
				<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.qnaTitle"/> </c:set>
				<label for="qnaTitle">${title}<span class="pilsu">*</span></label>
			</th>
			<td width="85%" nowrap="nowrap">
   				<form:input path="qnaTitle" title="${title} ${inputTxt}" size="70" maxlength="70" />
				<form:errors path="qnaTitle" cssClass="error" />
			</td>
		</tr>		
		<!-- 질문내용 -->
		<tr>
		<th height="23" ><c:set var="title"><spring:message code="comUssOlhQna.qnaVO.qnaContent"/> </c:set>
			<label for="qnaContent">${title } <span class="pilsu">*</span></label></th>
			<td colspan="3">
				<form:textarea path="qnaContent" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<div><form:errors path="qnaContent" cssClass="error" /></div>  
			</td>
		</tr>
		<!-- 답변상태코드 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode"/> </c:set>
		<tr>
			<th><label for="qnaCk">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
				<form:select path="qnaCk" name="searchCnd" title="${title} ${inputTxt}" cssClass="txt" >
					<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comUssOlhQna.qnaVO.qnaCk" /></option><!-- 답변중 -->
					<option value="1"  <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> ><spring:message code="comUssOlhQna.qnaVO.qnaConfirm" /></option><!-- 답변완료 -->
				</form:select>
				<div><form:errors path="qnaCk" cssClass="error" /></div>       
			</td>
		</tr>
		
		<!-- 답변내용 -->
		<c:set var="title"><spring:message code="comUssOlhQna.qnaVO.answerCn"/> </c:set>
		<tr>
			<th><label for="answerCn">${title} <span class="pilsu">*</span></label></th>
			<td class="nopd" colspan="3">
				<form:textarea path="answerCn" title="${title} ${inputTxt}" cssClass="txt" cols="300" rows="20"/>   
				<div><form:errors path="answerCn" cssClass="error" /></div>  
			</td>
		</tr>
	</table>
</div>


	<!-- 하단 버튼 -->
	<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
		<ul>
			<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_updt_qna(); return false;"><spring:message code="button.update" /></a></li>
			<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_inqire_list();   return false;"><spring:message code="button.list" /></a></li>
		</ul>
	</div>
	<%-- <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
	<!-- 목록/저장버튼  -->
	<table border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
		<td><input type="submit" class="s_submit" value="<spring:message code="button.save" />" title="<spring:message code="button.update" /> <spring:message code="button.save" />" /></td>
		<td><span class="btn_s"><a href="<c:url value='/cmn/qna/selectQnaList.do' />"  title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a></span></td>
		<td><input name="answerCn" type="hidden" value="<c:out value='${qnaVO.answerCn}'/>"></td>
		<td><input name="qnaSeq" type="hidden" value="<c:out value='${qnaVO.qnaSeq}'/>"></td>
	</tr>
	</table> --%>
	</div>
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
