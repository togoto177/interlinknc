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
		
		/* $("#save").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;


				// 폼에 입력한 데이터를 서버로 전송
				document.data_form.submit();
		}); */
	});
	
	function save() {
		var form = document.data_form;
		form.submit();
		
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
					<tr>
					<td width="100%">
						<input type="file"  name="uploadfile[0]" style="width: 100%; " required="required" id="file_up[0]" />
					</td>
					<td align="right">
						<input class="btn btn-primary" style="margin-left: 0%;" type="button" value="파일 추가" onclick="addbt()" />
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