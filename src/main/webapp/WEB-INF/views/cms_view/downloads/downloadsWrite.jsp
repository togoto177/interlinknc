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
			if($("#board_title").val().length > 41){
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
		<a>등록</a>
	</div>
	<form id="board_form" name="board_form" method="post" action="boardWriteAction" enctype="multipart/form-data">
	<input type="hidden" id="board_division" name="board_division" value="${board_division}"/>
	<div class="portBox">
		<table>
			<tr>
				<td class="oneTitle"><input type="text" placeholder="제목을 입력하세요." name="board_title" id="board_title" /></td>
			</tr>
			<tr>
				<td class="down">
					<div class="downFile">
						<label>첨부파일</label>
							<div class="downFileBox">
								<div class="upload-btn_wrap">
								  <!-- <input type="file" class="input_file" title="파일찾기"> -->
								  <button type="button" id="newFile" class="upload-btn_wrap" title="파일선택하기">
								   <span style="cursor:pointer;">선택</span>
								  </button>
								</div>
								<!-- <input type="text" class="upload_text" readonly="readonly"> -->
						  <div>
						  <input type="file" name="uploadfile" class="multi" id="input_file" title="파일찾기" style="display: none;"/>
						  </div>
							</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="textarea"><textarea rows="5" cols="5" name="board_content" id="board_content" style="height: 250px;"></textarea></td>
			</tr>
		</table>
	</div>
	</form>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1" id="save" style="cursor:pointer;">SAVE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" href="/interlinknc/downloadsList?board_division=download">CANCEL</a>
		</div>
	</div>
</div>
</body>
</html>