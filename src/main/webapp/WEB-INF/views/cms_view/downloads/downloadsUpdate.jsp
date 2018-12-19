<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../cms_include.jsp"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>interLink&amp;C</title>
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
 
$(document).on("click","#save",function(e){

	if (confirm("글을 등록 하시겠습니까?") == true){    //확인
		// 제목 유효성 검사
		if($("#board_title").val() == '' || $("#board_title").val() == null ){
		    alert("제목을 입력해주세요.");
		    return false;
		}
		if($("#board_title").val().length > 21){
		    alert("제목은 20자이상 입력할 수 없습니다.");
		    return false;
		}		
	// id가 smarteditor인 textarea에 에디터에서 대입 
	oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []); 
	// 이부분에 에디터 validation 검증
	$("#board_form").submit(); 
	}else{   
	    return;
	}

  });
});

	$(function(){
		$('.upload_text').val('미리보여줄 텍스트.');
		$('.multi').change(function(){
			var fileValue = $('.multi').val().split("\\");
			var fileName = fileValue[fileValue.length-1];
			$('.upload_text').val(fileName);
		});
		/* $('.MultiFile-remove').click(function(){
			$('.upload_text').val('취소완료');
		}); */

	});


</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	
	<div class="portTitleView">
		<a>수정</a>
	</div>
	<form id="board_form" name="board_form" method="post" action="boardUpdateAction" enctype="multipart/form-data">
	<input type="hidden" id="board_division" name="board_division" value="${board_update.board_division }">
	<input type="hidden" id="board_seq" name="board_seq" value="${board_update.board_seq}">
	<div class="portBox">
		<table>
			<tr>
				<td class="oneTitle"><input type="text" id="board_title" name="board_title" value="${board_update.board_title}" /></td>
			</tr>
			<tr>
				<td class="down">
					<%-- <c:forEach var="file_list" items="${file_list}"  varStatus="status">
						<c:if test="${file_list.file_use_yn eq 'Y'}">
						 	<div id="flist_${status.count}">
						 	<c:set var="TextValue" value="${file_list.file_sub_name}"/>
							<input style="border: 0; width: 200px;" type="text" id="fName" name="fName" value="${file_list.file_ori_name}">
							<input type="hidden" name="file_key" id="file_key" value="${file_list.file_seq}" />
							<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
							<input type="hidden"  name="flag" id="flag" value="C" />
							<label>${file_list.file_size} KB
							<button type="button" class="btn btn-primary" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
							</label>
							</div>
						</c:if>
					<div id="addfile_${status.count}"  style="display: none;">
					<label>첨부파일</label>
					<input type="text" class="upload_text" readonly="readonly">
					<div class="upload-btn_wrap">
					  <button type="button" id="newFile" class="upload-btn_wrap">
					   <span>선택</span>  
					  </button>
					  <input type="file" name="uploadfile" class="multi" id="input_file"  title="파일찾기" style="display: none;"/>
					</div>
					</div>
					</c:forEach> --%>
					<label>첨부파일</label>
					<div class="upload-btn_wrap">
					  <button type="button" id="newFile" class="upload-btn_wrap">
					   <span>선택</span>  
					  </button>
					 </div>
					<div style="overflow-x: hidden; overflow-y: scroll; height: 100px;">
					<c:forEach var="file_list" items="${file_list}"  varStatus="status">
					<c:if test="${file_list.file_use_yn eq 'Y'}">
					<div id="flist_${status.count}">
						 	<c:set var="TextValue" value="${file_list.file_sub_name}"/>
							<input type="hidden" name="file_key" id="file_key" value="${file_list.file_seq}" />
							<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
							<input type="hidden"  name="flag" id="flag" value="C" />
							<button type="button" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
							 파일 이름 : ${file_list.file_ori_name} | 파일 크기 : ${file_list.file_size} KB
							<br/>
					</div>		
					</c:if>
					</c:forEach>
					<input type="file" name="uploadfile" class="multi" id="input_file"  title="파일찾기" style="display: none;"/>
					</div>
					
					<div>
					  </div>
					<!-- <div class="downFile">
						<label>첨부파일</label>
							<div class="downFileBox">
								<div class="upload-btn_wrap">
								  <input type="file" class="input_file" title="파일찾기">
								  <button type="button" title="파일선택하기">
								   <span>선택</span>
								  </button>
								</div>
								<input type="text" class="upload_text" readonly="readonly">
							</div>
					</div> -->
				</td>
			</tr>
			<tr>
				<td colspan="4" class="textarea"><textarea rows="5" cols="5" name="board_content" id="board_content" style="height: 250px;">${board_update.board_content}</textarea></td>
			</tr>
		</table>
	</div>
	</form>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1" id="save">SAVE</a>
		</div>
		<div class="btnDiv3">
			<a class="btn1" id="delete">REMOVE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" style="padding: 30 29;" href="/downloadsList?board_division=download">LIST</a>
		</div>
	</div>
</div>
</body>
</html>