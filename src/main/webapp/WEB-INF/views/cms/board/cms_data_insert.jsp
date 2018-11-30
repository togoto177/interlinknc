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
		
		$("#list").click(function() {
			location.href = "cms_data?board_division=" + $("#board_division").val();
		});
		
		 $("input[type=file]").change(function () {
             
	            var fileInput = document.getElementById("file_up");
	              
	            var files = fileInput.files;
	            var file;
	              
	            for (var i = 0; i < files.length; i++) {
	                  
	                file = files[i];
	  
	                alert(file.name);
	            }
	              
	        });
		
	});
	
	function save() {
		var form = document.data_form;
		form.submit();
		
	}
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
	</script>
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div class="contens">
	<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		<h1>downloads</h1>	
		<form name="data_form" method="post" action="cms_data_insert_action" enctype="multipart/form-data">
				<table class="table table-hover" style="margin-bottom: 0;">

					<tr>
						<td class="table-info">ID</td>
						<td> 
						<input type="hidden" id="board_division" name="board_division" value="${board_division}" />
						
						</td>
					</tr>
					<tr>
						<td class="table-info">제목</td> 
						<td><input type="text" style="width: 100%;" name="board_title" id="board_title"/>
						</td>
					</tr>
				</table>
				<table class="table table-hover" >
					<tr>
						<td><textarea name="board_content" id="board_content" rows="10" cols="50"></textarea></td>
					</tr>
				</table>	
				<table class="table table-hover">
					<tr>
					<td class="table-info" width="235px">첨부파일</td>
					</tr>
					</table>
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
						<button class="btn btn-primary" onclick="save()">저장</button>
					</td>
				</tr>
			</table>
			</div>
	</div>

		
</div>
</body>
</html>