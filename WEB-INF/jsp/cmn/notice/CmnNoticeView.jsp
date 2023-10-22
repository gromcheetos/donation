<%--
  Class Name : CmnNoticeView.jsp
  Description : 공지사항 상세
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2019.11.26   SSY          최초 생성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Language" content="ko" >
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
		<script type="text/javascript">
    		function onloading() {
        		if ("<c:out value='${msg}'/>" != "") {
            		alert("<c:out value='${msg}'/>");
        		}
    		}
    
    		function fn_egov_select_noticeList(pageNo) {
        		document.frm.pageIndex.value = pageNo; 
        		document.frm.action = "<c:url value='/cmn/notice/list.do'/>";
        		document.frm.submit();  
    		}
    
    		function fn_egov_delete_notice() {
				if (confirm('<spring:message code="common.delete.msg" />')) {
            		document.frm.action = "<c:url value='/cmn/notice/delete.do'/>";
            		document.frm.submit();
        		}
    		}
    
    		function fn_egov_moveUpdt_notice() {
				document.frm.action = "<c:url value='/cmn/notice/updateView.do'/>";
        		document.frm.submit();          
    		}
    
		</script>

		<title>공지사항 상세</title>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>

	</head>
	
	<body onload="onloading();">
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
	                            <li>커뮤니티관리</li>
	                            <li>&gt;</li>
	                            <li><strong>공지사항</strong></li>
	                        </ul>
                    	</div>
                	</div>
                	<!-- 검색 필드 박스 시작 -->
                	<div id="search_field">
						<div id="search_field_loc"><h2><strong>공지사항 상세</strong></h2></div>
                	</div>
					<form name="frm" method="post" action="<c:url value='/cop/bbs/selectBoardList.do'/>">
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
						<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
						<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
						<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" >
						<input type="submit" id="invisible" class="invisible"/>

						<div>
                        	<table class="wTable">
                          		<tr> 
					        		<th width="15%" nowrap >제목</th>
					        		<td width="85%" colspan="5" nowrap="nowrap"><c:out value="${result.nttSj}" /></td>
					      		</tr>
					      		<tr> 
					        		<th width="15%" nowrap >작성자</th>
					        		<td width="15%" nowrap="nowrap">
					            		<c:out value="${result.frstRegisterNm}" />
					        		</td>
					        		<th width="15%" nowrap >작성시간</th>
					        		<td width="15" nowrap="nowrap"><c:out value="${result.frstRegisterPnttm}" /></td>
					        		<th width="15%" nowrap >조회수</th>
					        		<td width="15%" nowrap="nowrap"><c:out value="${result.inqireCo}" /></td>
					      		</tr>
					      		<tr> 
					        		<th>글내용</th>
				        			<td colspan="5">
				         				<div id="bbs_cn">
				           					<textarea id="nttCn" name="nttCn" style="width:99%" readonly="readonly"><c:out value="${result.nttCn}" escapeXml="true" /></textarea>
				         				</div>
				        			</td>
								</tr>
                        	</table>
                    	</div>
                    	<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<!-- 목록/저장버튼  -->
							<ul>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_moveUpdt_notice(); return false;"><spring:message code="title.update" text="수정"/></a> </li>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_delete_notice(); return false;"><spring:message code="title.delete" text="삭제"/></a>  </li>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_egov_select_noticeList('1'); return false;"><spring:message code="title.list" text="목록"/></a> </li>
							</ul>
	                    </div>
                    	<!-- 버튼 끝 -->                           
					</form>
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

