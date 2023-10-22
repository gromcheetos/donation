<%
 /**
  * @Class Name : UserMngRegist.jsp
  * @Description : 회원등록 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2019.12.02    SSY          최초 생성
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>${pageTitle} <spring:message code="title.create" text="등록"/></title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="<c:url value='/js/showModalDialog.js' />" ></script>

		<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

		<script type="text/javaScript" language="javascript" defer="defer">
			/*********************************************************
	 		* 초기화
	 		******************************************************** */
			function fn_egov_init(){
				//모달 셋팅
				fn_modal_setting();
			}
	
			/*********************************************************
	 		* 모달셋팅
	 		******************************************************** */
			function fn_modal_setting(){
				//버튼에 모달 연결
				$("#btnMbrId").egovModal( "egovModal" );
		
				//타이틀 설졍
				$("#egovModal").setEgovModalTitle("<spring:message code="user.userManageRegistModal.title" text="아이디중복확인"/>");
				var content = "";
				content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"<spring:message code="user.userManageRegistModal.userIsId" text="사용할아이디"/> :"+"</div>";
				content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
				content += "<div style='clear:both;'></div>";
				content += "<div id='divModalResult' style='margin:10px 0 0 0'><spring:message code="user.userManageRegistModal.initStatus" /></div>"; //결과 : 중복확인을 실행하십시오.
				//모달 body 설정
				$("#egovModal").setEgovModalBody(content);
				
				var footer = "";
				//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalOk' onclick='fn_id_checkOk()'>확인</button></div>";
				//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalSelect' onclick='fn_id_check()'>조회</button></div>";
				footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>확인</a></span>&nbsp;";
				footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";
				//모달 footer 설정
				$("#egovModal").setEgovModalfooter(footer);
		
				//엔터이벤트처리
				$("input[name=checkIdModal]").keydown(function (key) {
					if(key.keyCode == 13){
						fn_id_check();	
					}
				});
				footer = null;
				content = null;
			}
	
			/*********************************************************
	 		* 아이디 체크 AJAX
	 		******************************************************** */
			function fn_id_check(){	
				$.ajax({
					type:"POST",
					url:"<c:url value='/user/mng/EgovIdDplctCnfirmAjax.do' />",
					data:{
						"checkId": $("#checkIdModal").val()			
					},
					dataType:'json',
					timeout:(1000*30),
					success:function(returnData, status){
						if(status == "success") {
							if(returnData.usedCnt > 0 ){
								//사용할수 없는 아이디입니다.
								$("#divModalResult").html("<font color='red'><spring:message code="user.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="user.userManageRegistModal.useMsg" /></font>");
							}else{
								//사용가능한 아이디입니다.
								$("#divModalResult").html("<font color='blue'><spring:message code="user.userManageRegistModal.result" /> : ["+returnData.checkId+"]<spring:message code="user.userManageRegistModal.notUseMsg" /></font>");
							}
						}else{ alert("ERROR!");return;} 
					}
				});
			}
	
			/*********************************************************
			 * 아이디 체크 확인
			 ******************************************************** */
			function fn_id_checkOk(){
				$.ajax({
					type:"POST",
					url:"<c:url value='/user/mng/EgovIdDplctCnfirmAjax.do' />",
					data:{
						"checkId": $("#checkIdModal").val()			
					},
					dataType:'json',
					timeout:(1000*30),
					success:function(returnData, status){
						if(status == "success") {
							if(returnData.usedCnt > 0 ){
								alert("<spring:message code="user.userManageRegistModal.noIdMsg" />"); //사용이 불가능한 아이디 입니다.
								return;
							}else{
								$("input[name=emailId]").val(returnData.checkId);
								$("#egovModal").setEgovModalClose();
							}
						}else{ alert("ERROR!");return;} 
					}
				});
			}
	
			function fnIdCheck1(){
	    		var retVal;
	    		var url = "<c:url value='/user/mng/EgovIdDplctCnfirmView.do'/>";
	    		var varParam = new Object();
	    		varParam.checkId = document.userManageVO.emailId.value;
	    		var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
	        
	    		//return false;
	    		retVal = window.showModalDialog(url, varParam, openParam);
	    		if(retVal) {
	    			document.userManageVO.emailId.value = retVal;
	    		}
			}
	
			function showModalDialogCallback(retVal) {
				if(retVal) {
		    		document.userManageVO.emailId.value = retVal;
				}
			}
	
			function fn_list(){
	    		document.userManageVO.action = "<c:url value='/user/mng/list.do'/>";
	    		document.userManageVO.submit();
			}
	
			function fn_regist(){
				if(confirm("<spring:message code="common.regist.msg" />")){	
					if(validateUserManageVO(document.userManageVO)){
						if(document.userManageVO.memPw.value != document.userManageVO.memPw2.value){
		            		alert("<spring:message code="fail.user.passwordUpdate2" />");
		            		return false;
		        		}
						document.userManageVO.submit();
						return true;
		    		}
				}
			}
		</script>
		<style>
			.modal-content {width: 400px;}
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
                            	<li>HOME</li>
                            	<li>&gt;</li>
                            	<li><strong><spring:message code="user.userManage.title" text="회원관리" /></strong></li>
                        	</ul>
                    	</div>
                	</div>
					<!-- 검색 필드 박스 시작 -->
                	<div id="search_field">
                    	<div id="search_field_loc"><h2><strong>${pageTitle} <spring:message code="title.create" text="등록"/></strong></h2></div>
                	</div>
					<form:form commandName="userManageVO" name="userManageVO" action="${pageContext.request.contextPath}/user/mng/insertMber.do" method="post" onSubmit="fn_regist(); return false;"> 
						<!-- 검색조건 유지 -->
						<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						<input type="hidden" name="searchKeyword" 	value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						<input type="hidden" name="searchMemStatus" 		value="<c:out value='${userSearchVO.searchMemStatus}'/>"/>
						<input type="hidden" name="pageIndex" 		value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						<input type="hidden" name="checkedIdForDel"  />
						
						<div id="border" class="" >
							<!-- 등록폼 -->
							<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
								<caption>${pageTitle} <spring:message code="title.create" /></caption>
								<colgroup>
									<col style="width: 15%;">
									<col style="width: ;">
								</colgroup>
								<tbody>
									<!-- 입력/선택 -->
									<c:set var="inputTxt"><spring:message code="input.input" text="입력" /></c:set>
									<c:set var="inputSelect"><spring:message code="input.cSelect" text="선택" /></c:set>
									<!-- 회원아이디 -->
									<c:set var="title"><spring:message code="user.userManageRegist.id" text="회원아이디"/></c:set>
									<tr>
										<th><label for="emailId">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:input path="emailId" id="emailId" size="100" readonly="true" maxlength="100" style="width:80%;" />
											<button id="btnMbrId" class="btn_s2" onClick="javascript:fnIdCheck1(); return false;"><spring:message code="user.userManageRegistBtn.idSearch" text="중복아이디검색"/></button>
											<div><form:errors path="emailId" cssClass="error" /></div>
										</td>
									</tr>
									<!-- 회원이름 -->
									<c:set var="title"><spring:message code="user.userManageRegist.name" text="회원이름"/></c:set>
									<tr>
										<th><label for="memName">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:input path="memName" size="50" maxlength="60" />
											<div><form:errors path="memName" cssClass="error" /></div> 
										</td>
									</tr>
									<!-- 비밀번호 -->
									<c:set var="title"><spring:message code="user.userManageRegist.pass"/></c:set>
									<tr>
										<th><label for="memPw">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<form:password path="memPw" size="50" maxlength="20" />
											<div><form:errors path="memPw" cssClass="error" /></div> 
										</td>
									</tr>
									<!-- 비밀번호확인 -->
									<c:set var="title"><spring:message code="user.userManageRegist.passConfirm" text="비밀번호확인"/></c:set>
									<tr>
										<th><label for="memPw2">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
											<input name="memPw2" id="memPw2" type="password" size="50" maxlength="20" />
										</td>
									</tr>
									<!-- 회원상태코드 -->
									<c:set var="title"><spring:message code="user.userManageRegist.status" text="회원상태코드"/></c:set>
									<tr>
										<th><label for="memStatus">${title}</label> <span class="pilsu">*</span></th>
										<td class="left">
                    						<form:select path="memStatus" id="memStatus" title="${title} ${inputSelect}">
                        						<form:option value="" label="${inputSelect}"/>
                        						<form:options items="${mberSttus}" itemValue="code" itemLabel="codeNm"/>
                    						</form:select>
                    						<div><form:errors path="memStatus" cssClass="error"/></div>
										</td>
									</tr>
									<!-- 회원구분코드 -->
									<c:set var="title"><spring:message code="user.userManageRegist.gubun" text="회원구분코드"/></c:set>
									<tr>
										<th><label for="memGubun">${title}</label><span class="pilsu">*</span></th>
										<td class="left">
                    						<form:select path="memGubun" id="memGubun" title="${title} ${inputSelect}">
                        						<form:option value="" label="${inputSelect}"/>
                        						<form:options items="${mberGubun}" itemValue="code" itemLabel="codeNm"/>
                    						</form:select>
                    					<div><form:errors path="memGubun" cssClass="error"/></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="xbuttons" style="padding-top:10px;padding-bottom:10px;">
							<ul>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_regist(); return false;"><spring:message code="button.save" text="저장"/></a></li>
								<li><a href="#LINK" class="s_submit" onclick="javascript:fn_list(); return false;"><spring:message code="button.list" text="목록"/></a></li>
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
		<!-- Egov Modal include  -->
		<%-- <jsp:include page="/EgovModal.do" flush="false">
			<jsp:param name="scriptYn" value="Y" />
			<jsp:param name="modalName" value="egovModal" />
		</jsp:include> --%>
	</body>
</html>
