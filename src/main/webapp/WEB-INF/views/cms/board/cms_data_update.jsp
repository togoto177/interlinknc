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
		
		 $("input[type=file]").change(function () {
             
	            var fileInput = document.getElementById("file_up");
	              
	            var files = fileInput.files;
	            var file;
	              
	            for (var i = 0; i < files.length; i++) {
	                  
	                file = files[i];
	  
	                alert(file.name);
	            }
	              
	        });
		 
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

	/* 파일추가버튼 */
	function addbt() {
		var fileIndex = $(".addtable").children().length+1-1;
		$("#addtd").append(
				'<tr id="file_up' + fileIndex + '"><td>' + 
				'<input style="width: 100%;" type="file" name="uploadfile[' + fileIndex + ']" id="file_up' + fileIndex + '"  />' +
				'</td>' +'<td align="right"><a href="#" class="btn btn-primary"  name="file_up' + fileIndex + '" style="margin-left: 0%;" type="button" onclick="delbt(this.name)">ㅡ</a>' +
				'</td></tr>');
	}
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
	/* 기존 파일 제거버튼 */
	function delbt_ori(thisname) {
		
		var file_del = thisname;
		
	 	if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
			// ie 일때 input[type=file] init.
			$("input[id=" + file_del + "]").replaceWith( $("input[id=" + file_del + "]").clone(true) );
			$("input[id=" + file_del + "]").remove();
			$("td[id=" + file_del + "]").append(
					'<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" />');
		} else {
			 // other browser 일때 input[type=file] init.
			$("input[id=" + file_del + "]").val(""); 
		    $("input[id=" + file_del + "]").remove();
		    $("td[id=" + file_del + "]").append(
			'<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" />');
		}
		
	}
	
	function delFile(idx){
		var obj = $('#flist_' + idx);
		
		//alert($(obj).find('#flag').val());
		$(obj).find('#flag').val("D");
		$(obj).hide();
	}
	</script>
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div class="contens">
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>downloads</h1>	
		<form id="data_form" name="data_form" method="post" action="cms_data_update_action" enctype="multipart/form-data">
		<input type="hidden" id="board_division" name="board_division" value="${board_update.board_division }">
		<input type="hidden" id="board_seq" name="board_seq" value="${board_update.board_seq}">
				<table class="table table-hover" style="margin-bottom: 0;" border="1">

					<tr>
						<td class="table-info">ID</td>
						<td> 
						 	<input type="text" style="width: 100%; border: none; "
							id="board_writer" name="board_writer"  readonly="readonly" 
						 	value="${board_update.board_writer}" />
						</td>
					</tr>
					<tr>
						<td class="table-info">제목</td> 
						<td>
						<input type="text" style="width: 100%; border: none; "
						id="board_title" name="board_title"   
					 	value="${board_update.board_title}" />
						</td>
					</tr>
				</table>
				<table class="table table-hover" style="margin-bottom: 0;" border="1" >
					<tr>
						<td><textarea name="board_content" id="board_content" rows="10" cols="30" >${board_update.board_content}</textarea></td>
					</tr>
				</table>	
				<table class="table table-hover">
					<tr>
					<td class="table-info" width="235px">첨부파일</td>
					</tr>
					</table>
					<div align="center" style=" padding-left: 200px; width: auto;">
				<table class="table table-hover">
<!-- 						<tr style="margin: 0;">
					<td colspan="2" style="width: 900px">
					</td>
								</tr> -->
					<c:choose>
						<c:when test="${fn:length(file_list) == 0}">												

							<tr>
<!-- 							<td class="table-info" width="235px">첨부파일</td> -->
							<td width="100%" align="left">첨부된 파일이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<c:forEach var="file_list" items="${file_list}"  varStatus="status">
							<tr id="flist_${status.count}">
								<c:if test="${file_list.file_use_yn eq 'Y'}">
								 <td>
									<input style="border: 0; width: 500px;" type="text" id="fName" name="fName" value="${file_list.file_ori_name}">
									<button class="btn btn-primary" id="downBtn" onclick="delFile('${status.count}');">삭제</button>
									<input type="hidden" name="file_key" id="file_key" value="${file_list.file_seq}" />
									<input type="hidden" id="update_id" name="update_id" value="${sessionScope.admin_id}" />
									<input type="hidden"  name="flag" id="flag" value="C" />
								</td>
								</c:if>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</table>
			</div>
					<table class="table table-hover" >
					<tbody class="addtable" id="addtd" >
					<tr id="file_up0">
					<td id="file_up0">
						<input type="file"  name="uploadfile[0]"  required="required" id="file_up0" multiple />
					</td>
					<td align="right">
						<!-- <input class="btn btn-primary"  name="file_up0" style="margin-left: 0%;" type="button" value="파일 제거" onclick="delbt_ori(this.name)" /> -->
						<a href="#" class="btn btn-primary"  name="file_up0" style="margin-left: 0%;" type="button" onclick="delbt_ori(this.name)">ㅡ</a>
					</td>
					<td align="right">
						<!-- <input class="btn btn-primary" name="test0" style="margin-left: 0%;" type="button" value="파일 추가" onclick="addbt()" /> -->
						&emsp;<a href="#" class="btn btn-primary" name="test0" style="margin-left: 0%;" type="button"  onclick="addbt()">+</a>
					</td>
					</tr>
					</tbody>
				    </table>
				    
			</form>
			<br>

			<table class="table table-hover">
				<tr>
					<td align="left">
						<button class="btn btn-primary" id="list" name="list">목록</button>

					</td>
					<td align="right">
						<button type="button" class="btn btn-primary" id="save" name="save">저장</button>
					</td>
				</tr>
			</table>
			</div>
	</div>

		
</div>
</body>
</html>