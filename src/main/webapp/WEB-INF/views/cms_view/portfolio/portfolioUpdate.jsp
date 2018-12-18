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
	
			// 구분 유효성 검사
			if($("#pf_division").val() == '' || $("#pf_division").val() == null || $("#pf_division").val().indexOf(" ") >= 0){
				alert("구분을 입력해주세요.");
				return false;
			}
			if($("#pf_division").val().length > 10){
				alert("구분은 10자이상 입력할 수 없습니다.");
				return false;
			}
			// 사업기간 유효성 검사
			if($("#business_period").val() == '' || $("#business_period").val() == null || $("#business_period").val().indexOf(" ") >= 0){
				alert("사업기간을 입력해주세요.");
				return false;
			}
			// 발주처 유효성 검사
			if($("#buyer").val() == '' || $("#buyer").val() == null || $("#buyer").val().indexOf(" ") >= 0){
				alert("발주처를 입력해주세요.");
				return false;
			}
			// 발주처 유효성 검사
			if($("#link").val() == '' || $("#link").val() == null || $("#link").val().indexOf(" ") >= 0){
				alert("연결주소를 입력해주세요.");
				return false;
			}
		
			// 파일 유효성 검사
			if($("input[type=file]").val() == '' || $("input[type=file]").val() == null){
				alert("포트폴리오 사진을 선택해주세요.");
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
		<a>PORTFOLIO</a>
	</div>
	
	<div class="portTitleView">
		<a>수정</a>
	</div>
	<form id="board_form" name="board_form" method="post" action="boardUpdateAction" enctype="multipart/form-data">
	<input type="hidden" id="board_division" name="board_division" value="${board_update.board_division }">
	<input type="hidden" id="board_seq" name="board_seq" value="${board_update.board_seq}">
	<div class="portBox">
		<table>
			<colgroup>
				<col style="width: 15%" />
				<col style="width: 35%" />
				<col style="width: 15%" />
				<col style="width: 35%" />
			</colgroup>
			<tr>
				<td><select name="pf_division" id="pf_division">
				  <option value="">구분</option>
				  <option value="홈페이지" ${board_update.pf_division eq "홈페이지" ? "selected" :""}>홈페이지</option>
				  <option value="유지보수" ${board_update.pf_division eq "유지보수" ? "selected" :""}>유지보수</option>
				</select></td>
				<td colspan="3"><input class="titleText" type="text" placeholder="제목을 입력하세요." id="board_title" name="board_title"   
					 	value="${board_update.board_title}" /></td>
			</tr>
			<tr>
				<td colspan="2"><label>사업기간</label><input type="text" name="business_period" id="business_period" value="${board_update.business_period}" /></td>
				<td rowspan="3" colspan="2" class="imgTd">
					<c:forEach var="file_list" items="${file_list}"  varStatus="status">
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
						 	<img alt="${file_list.file_ori_name}" src="resources/portfolio/${fn:substringBefore(TextValue,'*') }">
							</div>
						</c:if>
					<div id="addfile_${status.count}"  style="display: none;">
					<a>첨부이미지</a>
					<input type="text" class="upload_text" readonly="readonly">
					<div class="upload-btn_wrap">
					  <button type="button" id="newFile" class="upload-btn_wrap">
					   <span>선택</span>  
					  </button>
					  <input type="file" name="uploadfile" class="multi with-preview" id="input_file" maxlength="1" title="파일찾기" style="display: none;"/>
					</div>
					</div>
					</c:forEach>
					
				</td>
			</tr>
			<tr>
				<td colspan="2"><label>발주처</label><input type="text" name="buyer" id="buyer" value="${board_update.buyer}" /></td>
			</tr>
			<tr>
				<td colspan="2"><label>연결주소</label><input type="text" name="link" id="link" value="${board_update.link}" /></td>
			</tr>
			<tr>
				<td colspan="4" class="textarea"><textarea name="board_content" id="board_content" rows="5" cols="5" style="height: 250px;" >${board_update.board_content}</textarea></td>
			</tr>
		</table>
	</div>
	</form>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1" id="save">SAVE</a>
		</div>
		<div class="btnDiv3">
			<a class="btn1" id="delete">DELETE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" style="padding: 30 29;" href="/portfolioList?board_division=portfolio">LIST</a>
		</div>
	</div>
</div>
</body>
</html>