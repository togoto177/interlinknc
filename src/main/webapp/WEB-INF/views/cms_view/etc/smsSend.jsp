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
    $('#testClick').click(function() {
    	/* $.ajax({ 
			type: 'get' , 
			url: '/interlinknc/sms_get?startPage=12333더ㅏ' ,
			async : false,
			cache : false,
			dataType : 'text' ,
			success: function(data) { 
				console.log("성공");
			}
    	}); */
    	
    	$.ajax({
		    url: 'http://interlink3.cafe24.com/interlinknc/sms_get', // 요청 할 주소
		    /* url: '/interlinknc/sms_get', */
		    async: false, // false 일 경우 동기 요청으로 변경
		    type: 'GET', // GET, PUT
		    data: {
		    	'Result' : "4",
		    	'SeqNum' : "10",
		    	'UserCode' : "UserCode10",
		    	'DeptCode' : "DeptCode10",
		    	'Phone' : "Phone10",
		    	'RTime' : "RTime10",
		    	'RecvTime' : "RecvTime10",
		    	'ReqPhone' : "ReqPhone10",
		    	/* 'CallCount' : "CallCount10", */
		    	'Error' : "101"
		    }, // 전송할 데이터
		    dataType: 'json', // xml, json, script, html
		    success: function(data) {
		    	console.log("성공!");
		    }, // 요청 완료 시
		    error: function(data) {
		    	console.log("error");
		    }
		}); 
    });
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
		<form method="post" name="send_api" id="send_api" enctype="multipart/form-data">
		<div class="smsText">
			<div>
				<textarea rows="2" cols="3" id="messages1" name="sms_messages"> </textarea>
			</div>
			<div class="textarea_count"><span id="textarea_msg1"></span></div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled" id="searchForm2_0">
				<label for="ex_file_0">업로드</label>
				<input type="file" id="ex_file_0" class="upload-hidden" name="uploadfile">
			</div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled" id="searchForm2_1">
				<label for="ex_file_1">업로드</label>
				<input type="file" id="ex_file_1" class="upload-hidden" name="uploadfile">
			</div>
			<div class="filebox">
				<input class="upload-name" value="파일선택" disabled="disabled" id="searchForm2_2">
				<label for="ex_file_2">업로드</label>
				<input type="file" id="ex_file_2" class="upload-hidden" name="uploadfile">
			</div>
		</div>
		<div class="smsNum">
			<div class="smsNumBox">
				<ol>
					<li>
						<input placeholder="name" class="name" type="text" name="user_name" />
						<input placeholder="숫자만 입력하세요" class="tell" name="tell" type="text" id="numbersOnly" />
						<a class="numDel">삭제</a>
					</li>
				</ol>
			</div>
			<div class="smsBut">
				<a class="result">Result</a><a class="add">Add</a><a class="send">Send</a>
			</div>
		</div>
		<input type="hidden" name="division" id="division" value="S" />
	</form>
	</div>
	
	<a id="testClick">click</a>
</div>
</body>
</html>