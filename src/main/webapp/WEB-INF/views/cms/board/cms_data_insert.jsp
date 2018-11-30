<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../cms_include.jsp"%>

<!DOCTYPE html>

<html>
<head>
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

				 $("#data_form").submit(); 
		 });

	});
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>interlinknc</title>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
	<%@ include file="../cms_left_bar.jsp"%>
	<div align="center" style="margin-top: 200px; height: 1500px;">
		<h1>downloads</h1>	
		<form id="data_form" name="data_form" method="post" action="cms_data_insert_action" enctype="multipart/form-data">
				<table style="width: 700px;">
					<tr>
						<td style="width: 20%;">ID</td>
						<td style="width:  80%;"><input type="hidden" id="board_division" name="board_division" value="${board_division}"/></td>
					</tr>
				</table>
				<table style="width: 700px;">	
					<tr>
						<td style="width: 20%;">제목</td> 
						<td style="width: 80%;"><input type="text" name="board_title" id="board_title" style="width: 100%;" /></td>
					</tr>
				</table>
				<table style="width: 700px;">	
					<tr>
						<td colspan="3"><textarea name="board_content" id="board_content" style="width:100%; height:412px;"></textarea></td>
					</tr>
					<tr>
						<td colspan="3">첨부파일</td>
					</tr>
					<tbody class="addtable" id="addtd" >
					<tr id="file_up0">
						<td id="file_up0" align="left" colspan="1">
							<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" style="width: 500px;" />
						</td>
						<td align="right" colspan="1">
							<button name="file_up0" type="button" onclick="delbt_ori(this.name)">-</button>
						</td>
						<td align="right" colspan="1">
							<button name="test0" type="button"  onclick="javascript:addbt()">+</button>
						</td>
					</tr>
					</tbody>
					<tr>
						<td align="left" colspan="1">
						<br><button type="button" class="btn btn-primary" id="list">목록</button>
						</td>
						<td align="right" colspan="2">
						<br><button type="button" class="btn btn-primary" id="save">저장</button>
						</td>
					</tr>
			    </table>
			</form>
		</div>
</body>
</html>