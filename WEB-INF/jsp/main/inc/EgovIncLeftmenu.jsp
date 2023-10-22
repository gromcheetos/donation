<%--
  Class Name : EgovIncLeftmenu.jsp
  Description :  좌메뉴 화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page import = "java.util.HashMap" %>
<%
	String menuNo = ((String)session.getAttribute("menuNo")!=null)?(String)session.getAttribute("menuNo"):"11";
%>

<div id="nav">	
	<div class="top"></div>             
	<div class="nav_style">
	<ul>
	    <% if (menuNo.indexOf("1")== 0) {%>
 		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('11','user/mng/list.do')"><spring:message code="user.userManage.title" text="회원관리"/></a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('11','user/mng/list.do')"><spring:message code="user.userManage.title" text="회원관리"/></a></li>
			</ul> 
		</li>
		<% } %>
		<% if (menuNo.indexOf("2")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('21','bene/mng/selectBeneMngList.do')">수혜자신청관리</a>
			<ul>	
				<li class="dept02"><a href="javascript:fn_main_headPageAction('21','bene/mng/selectBeneMngList.do')">신청관리</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("3")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('32','cmn/notice/list.do')">커뮤니티관리</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('31','cmn/bene/sharelist.do')">수혜자후기관리</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('32','cmn/notice/list.do')">공지사항</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('33','cmn/faq/selectFaqList.do')">FAQ</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('34','cmn/qna/selectQnaList.do')">Q&A</a></li>
			</ul>
		</li>
		<% } %>
        <% if (menuNo.indexOf("4")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('41','schol/indi/selectScholIndiList.do')">장학사업관리</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('41','schol/indi/selectScholIndiList.do')">개별장학금</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('42','schol/special/selectScholSpecialList.do')">특별장학금</a></li>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('43','schol/sub/selectScholSubList.do')">모금장학금</a></li>
			</ul> 
		</li>
		<% } %>
        <% if (menuNo.indexOf("5")== 0) {%>
		<li class="leftmenu_dept01">
			<a href="javascript:fn_main_headPageAction('51','main/sample_menu/EgovAboutSite')">시스템관리</a>
			<ul>
				<li class="dept02"><a href="javascript:fn_main_headPageAction('51','main/sample_menu/EgovAboutSite')">관리자관리</a></li>
			</ul> 
		</li>
		<% } %>
	</ul>
	</div>
	<div class="bottom"></div>		
</div>
<!-- //메뉴 끝 -->	
