<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../cms_include.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>interlinknc</title>
	<script type="text/javascript">
	$(document).ready(function() {
		 
				// 네이버 에디터  
				var oEditors = [];
				
				nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "board_content",
				    sSkinURI: "util/naver_edit/SmartEditor2Skin.html",
				    fCreator: "createSEditor2",
				    htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
				    bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				    bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				    bUseModeChanger : true, 
				    }


				});
				
		 $("#save").click(function(){
			 //if(confirm("저장하시겠습니까?")) { // id가 smarteditor인 textarea에 에디터에서 대입 
				 oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []); 
			 // 이부분에 에디터 validation 검증

				 $("#board_form").submit(); 
		 });
				
		
	});

	
	/* 추가된 파일 제거버튼  */
	function delbt(thisname) {
		
		var file_del = thisname;
		
	 	if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
			// ie 일때 input[type=file] init.
			$("input[id=" + file_del + "]").replaceWith( $("input[id=" + file_del + "]").clone(true) );
			$("tr[id=" + file_del + "]").hide();
		} else {
			 // other browser 일때 input[type=file] init.
			$("input[id=" + file_del + "]").val(""); 
		    $("tr[id=" + file_del + "]").hide();	 
		}
		
	}
	

	</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<div>
	<%@ include file="../cms_left_bar.jsp"%>
	<div style="padding-top: 100px;">
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<c:if test="${board_update.board_division == download}">
		<h1>downloads</h1>	
		</c:if>
		<c:if test="${board_update.board_division == portfolio}">
		<h1>portfolio</h1>	
		</c:if>
		<form id="board_form" name="board_form" method="post" action="cms_board_update_action" enctype="multipart/form-data">
		<input type="hidden" id="board_division" name="board_division" value="${board_update.board_division }">
		<input type="hidden" id="board_seq" name="board_seq" value="${board_update.board_seq}">
				<table class="table table-hover" style="width: 700px;" border="1">

					<tr class="display_none">
						<td class="table-info">ID</td>
						<td> 
						 	<input type="text" style="width: 100%; border: none; "
							id="board_writer" name="board_writer"  readonly="readonly" 
						 	value="${board_update.board_writer}" />
						</td>
					</tr>
					<tr>
						<td style="width: 20%;">제목</td> 
						<td style="width: 80%;">
						<input type="text" style="width: 100%;"
						id="board_title" name="board_title"   
					 	value="${board_update.board_title}" />
						</td>
					</tr>
					<c:if test="${board_division == 'portfolio' }">	
					<tr>
						<td style="width: 20%;">구분</td> 
						<td style="width: 80%;"><input type="text" name="pf_division" id="pf_division" style="width: 100%;" value="${board_update.pf_division}"/></td>
					</tr>
					<tr>
						<td style="width: 20%;">사업기간</td> 
						<td style="width: 80%;"><input type="text" name="business_period" id="business_period" style="width: 100%;" value="${board_update.business_period}"/></td>
					</tr>
					<tr>
						<td style="width: 20%;">발주처</td> 
						<td style="width: 80%;"><input type="text" name="buyer" id="buyer" style="width: 100%;" value="${board_update.buyer}"/></td>
					</tr>
					<tr>
						<td style="width: 20%;">연결주소</td> 
						<td style="width: 80%;"><input type="text" name="link" id="link" style="width: 100%;" value="${board_update.link}"/></td>
					</tr>
					</c:if>
					<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
					<tr>
							<td class="table-info"><button type="button" id="newFile" >첨부파일</button></td>
							<td width="100%" align="left" class="length_x" ><input type="file" name="uploadfile" class="multi with-preview" id="orgFile"/></td>
							</tr>
						</c:when>
						<c:otherwise>		
								<tr>	
								<td>
									<c:if test="${board_update.board_division == 'portfolio'}">
									<c:if test="${fn:length(file_list) == 1}">								
									<button type="button" id="newFile" disabled="disabled" >첨부파일</button>
									</c:if>
									</c:if>
									<c:if test="${board_update.board_division == 'download'}">								
									<button type="button" id="newFile" >첨부파일</button>
									</c:if>
								</td>		
								 <td>
							<c:forEach var="file_list" items="${file_list}"  varStatus="status">
								<c:if test="${file_list.file_use_yn eq 'Y'}">
								 	<div id="flist_${status.count}">
									<input style="border: 0; width: 100%;" type="text" id="fName" name="fName" value="${file_list.file_ori_name}">
									<button type="button" class="btn btn-primary" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_seq}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
									<label>${file_list.file_size} KB</label>
									</div>
								</c:if>
							</c:forEach>
									<c:if test="${board_division == 'portfolio'}">
									<input type="file" name="uploadfile" class="multi with-preview" id="orgFile" maxlength="1" />
									</c:if>
									<c:if test="${board_division == 'download'}">
									<input type="file" name="uploadfile" class="multi" id="orgFile" maxlength="2"/>
									</c:if>
								</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<table class="table table-hover" style="width: 700px;" border="1">
					<tr>
						<td><textarea name="board_content" id="board_content" rows="10" cols="30" style="width: 700px; height: 500px;">${board_update.board_content}</textarea></td>
					</tr>
				</table>	
			</form>
			<br>

			<table class="table table-hover" width="700px;">
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>

					</td>
					<td align="right">
						<button type="button" class="btn btn-primary" id="save" name="save">저장</button>
					</td>
				</tr>
			</table>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			</div>
	</div>

		
</div>
</body>
</html>