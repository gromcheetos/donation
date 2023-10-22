<%--
  Class Name : NoticeList.jsp
  Description : 공지사항 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2019.11.26   SSY          최초 생성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" 		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
		<meta http-equiv="content-language" content="ko">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
		<script type="text/javascript">
    		function press(event) {
        		if (event.keyCode==13) {
            		fn_egov_select_noticeList('1');
        		}
    		}

    		function fn_egov_addNotice() {
        		document.frm.action = "<c:url value='/cmn/notice/insertView.do'/>";
        		document.frm.submit();
    		}
    
    		function fn_egov_select_noticeList(pageNo) {
        		document.frm.pageIndex.value = pageNo;
        		document.frm.action = "<c:url value='/cmn/notice/list.do'/>";
        		document.frm.submit();  
    		}
    
    		function fn_egov_inqire_notice(nttId) {
        		document.subForm.nttId.value = nttId;
        		document.subForm.action = "<c:url value='/cmn/notice/list.do'/>";
        		document.subForm.submit();          
    		}
		</script>
		
		<title><c:out value="${brdMstrVO.bbsNm}"/>목록</title>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>
	<body>
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
	                            <li>커뮤니티관리</li>
	                            <li>&gt;</li>
	                            <li><strong>공지사항</strong></li>
	                        </ul>
	                    </div>
	                </div>
	                <!-- 검색 필드 박스 시작 -->
	                <div id="search_field">
	                    <div id="search_field_loc"><h2><strong>공지사항 목록</strong></h2></div>
						<form name="frm" action ="<c:url value='/cop/bbs/selectBoardList.do'/>" method="post">
							<%-- <input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" /> --%>
							<input type="hidden" name="nttId"  value="0" />
							<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	                        <!-- <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" /> -->
	                        
	                        <fieldset><legend>조건정보 영역</legend>
		                        <div class="sf_start">
		                            <ul id="search_first_ul">
		                                <li>
										    <select name="searchCnd" class="select" title="검색조건 선택">
												<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
												<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>             
		                                    </select>
		                                </li>
		                                <li>
		                                    <input name="searchWrd" type="text" size="35" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="100" onkeypress="press(event);" title="검색어 입력"> 
		                                </li>
		                                <li>
		                                    <div class="buttons">
		                                        <a href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;"><img src="<c:url value='/images/img_search.gif' />" alt="search" />조회 </a>
												<a href="#LINK" onclick="javascript:fn_egov_addNotice(); return false;">등록</a>
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
	                    <table summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다" cellpadding="0" cellspacing="0">
	                    	<caption>공지사항 목록</caption>
	                    	<colgroup>
	                    		<col width="10%">
	                    		<col width="45%">
								<col width="10%">
	                    		<col width="15%">
								<col width="10%">
	                    		<col width="10%">
	                    	</colgroup>
	                    	<thead>
	                    		<tr>
	                        		<th scope="col" class="f_field" nowrap="nowrap">번호</th>
	                        		<th scope="col" nowrap="nowrap">제목</th>
		                        	<th scope="col" nowrap="nowrap">작성자</th>
	                        		<th scope="col" nowrap="nowrap">작성일</th>
	                        		<th scope="col" nowrap="nowrap">사용유무</th>
	                        		<th scope="col" nowrap="nowrap">조회수</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>                 
	<c:forEach var="result" items="${resultList}" varStatus="status">
	                    		<!-- loop 시작 -->                                
	                      		<tr>
					        		<td><b><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></b></td>            
					        		<td align="left">
					            		<form name="subForm" method="post" action="<c:url value='/cmn/notice/view.do'/>">
					                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
					                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				                        	<span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>" ></span>
					            		</form>
					        		</td>
					            	<td ><c:out value="${result.frstRegisterNm}"/></td>
					        		<td ><c:out value="${result.frstRegisterPnttm}"/></td>
					        		<td ><c:out value="${result.useAt}"/></td>
					        		<td ><c:out value="${result.inqireCo}"/></td>
					      		</tr>
	</c:forEach>     
	<c:if test="${fn:length(resultList) == 0}">
					      		<tr>
				                	<td colspan="7" ><spring:message code="common.nodata.msg" /></td>
					          	</tr>
	</c:if>      
	                    	</tbody>
	                    </table>
	                </div>
	                <!-- 페이지 네비게이션 시작 -->
	                <div id="paging_div">
	                    <ul class="paging_align">
	                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />    
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