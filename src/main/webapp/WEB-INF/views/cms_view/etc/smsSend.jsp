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
<script type="text/javascript">
$(document).ready(function(){
    $('#textarea_msg1').keyup();
}); 

</script>
<title>interLink&amp;C</title>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>문자 보내기</a>
	</div>
	
	<div class="smsCon">
		<form action="send_api.do" method="post" name="send_api" enctype="multipart/form-data">
		<div class="smsText">
			<div>
				<textarea rows="2" cols="3" id="messages1"> </textarea>
			</div>
			<div class="textarea_count"><span id="textarea_msg1"></span></div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="ex_file_0">업로드</label>
				<input type="file" id="ex_file_0" class="upload-hidden">
			</div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="ex_file_1">업로드</label>
				<input type="file" id="ex_file_1" class="upload-hidden">
			</div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled">
				<label for="ex_file_2">업로드</label>
				<input type="file" id="ex_file_2" class="upload-hidden">
			</div>
		</div>
		<div class="smsNum">
			<div class="smsNumBox">
				<ol>
					<li><input type="text" /><a class="numDel">삭제</a></li>
				</ol>
			</div>
			<div class="smsBut">
				<a class="add">Add</a><a class="send">Send</a>
			</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>