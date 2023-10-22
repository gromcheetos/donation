<%--
  Class Name : EgovNoticeRegist.jsp
  Description : 게시물  생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2019.11.26   SSY          최초 생성
 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
		<meta http-equiv="content-language" content="ko">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

		<script type="text/javascript">
			function fn_egov_validateForm(obj) {
        		return true;
    		}
    
			function fn_egov_regist_notice() {
        		//document.board.onsubmit();
        
        		if (!validateBoard(document.board)){
            		return;
        		}
        
        		if (confirm('<spring:message code="common.regist.msg" />')) {
            		document.board.action = "<c:url value='/cmn/notice/insert.do'/>";
            		document.board.submit();
        		}
    		}
    
    		function fn_egov_select_noticeList() {
        		document.board.action = "<c:url value='/cmn/notice/list.do' />";
        		document.board.submit();
    		}   
		</script>
		<style type="text/css">
			.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  			.noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  			.noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
		</style>
		<title>공지사항 등록 </title>

		<style type="text/css">
    		h1 {font-size:12px;}
    		caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
		</style>
	</head>

	<!-- body onload="javascript:editor_generate('nttCn');"-->
	<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus();"> -->
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
                            	<li>HOME</li>
                            	<li>&gt;</li>
                            	<li><strong>공지사항</strong></li>
                        	</ul>
                    	</div>
                	</div>
                	<!-- 검색 필드 박스 시작 -->
                	<div id="search_field">
                    	<div id="search_field_loc"><h2><strong>공지사항 등록</strong></h2></div>
                	</div>

					<form:form commandName="board" name="board" method="post" >
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
						<div id="border" class="" >
                        	<table class="wTable">
                            	<tr>
						        	<th width="15%" nowrap="nowrap"><label for="nttSj"><spring:message code="cop.nttSj" /></label>
						        		<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
						        	</th>
						        	<td width="85%" nowrap colspan="3">
						          		<input id="nttSj" name="nttSj" type="text" size="60" value=""  maxlength="60" >
						          		<form:errors path="nttSj" />
						        	</td>
						    	</tr>
							    <tr> 
							        <th width="15%"><label for="nttCn"><spring:message code="cop.nttCn" /></label>
	                                	<img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
	                                </th>
									<td colspan="3">
										<textarea id="nttCn" name="nttCn" class="textarea" ></textarea> 
										<form:errors path="nttCn" />
							        </td>
							    </tr>
							</table>
						</div>

						<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<!-- 목록/저장버튼  -->
							<ul>
								<li>
	   								<a href="#LINK" class="s_submit" onclick="javascript:fn_egov_regist_notice(); return false;"><spring:message code="button.save" /></a>
	   							</li> 
								<li>
									<a href="#LINK" class="s_submit" onclick="javascript:fn_egov_select_noticeList(); return fasle;"><spring:message code="button.list" /></a> 
								</li>
							</ul>
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

