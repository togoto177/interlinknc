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
		    function clipBoard(clip) {
		        /* var urlbox = document.getElementById(clipBoard); */
		        $('#clipBoard').val(clip);
		        $('#clipBoard').select();
		        try { 
		            var successful = document.execCommand('copy');  
		            alert(successful);
		            alert('클립보드에 주소가 복사되었습니다. Ctrl + V 로 붙여넣기 하세요.'); 
		        } catch (err) { 
		            alert('이 브라우저는 지원하지 않습니다.'); 
		        }
		    }

</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>CONTACT</a>
	</div>
	
	<div class="portTitleView">
		<a>문의글 확인</a>
	</div>
	<div class="portBox">
		<table class="contactTable">
			<colgroup>
				<col style="width: 50%" />
				<col style="width: 50%" />
			</colgroup>
			<tr>
				<td colspan="2" class="oneTitle"><a>${board_body.board_title}</a></td>
			</tr>
			<tr>
				<td>
					<label>작성자</label>
					<a>${board_body.user_id}</a>
				</td>
				<td>
					<label>일자</label>
					<a>${board_body.board_registerdate}</a>
				</td>
			</tr>
			<tr>
				<td>
					<label>이메일</label>
					<a class="Email" id="Email">${board_body.user_email}</a>
					<input type="hidden" id="clipBoard" name="clipBoard" value="">
					<img alt="복사" id="copy-url" style="cursor:pointer;" src="resources/cms/notepad.png" onclick="clipBoard('${board_body.user_email}')">
					<!-- <img alt="복사" id="copy-url" src="resources/cms/notepad.png" > 2018-12-19 일단보류 -->
					
				</td>
				<td>
					<label>연락처</label>
					<a>${board_body.user_contact}</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tdText"><a>${board_body.board_content}</a></td>
			</tr>
			<tr class="noBorder">
				<td colspan="2">
					<div class="btnDiv1">
						<a class="btn1">상태수정</a>
					</div>
					<form id="board_form" name="board_form" method="post" action="boardUpdateAction" enctype="multipart/form-data">
					<input type="hidden" id="board_division" name="board_division" value="${board_division}">
					<input type="hidden" id="board_seq" name="board_seq" value="${board_body.board_seq}">
					<select name="status" id="status">
						<option value="0" ${board_body.status eq "0" ? "selected" :""}>미확인</option>
						<option value="1" ${board_body.status eq "1" ? "selected" :""}>확인</option>
					</select>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div class="btnbox">
		<div class="btnDiv2" style="margin-right: 0;">
			<a class="btn1" style="padding: 30;" href="/interlinknc/contactList?board_division=contact">LIST</a>
		</div>
	</div>
</div>
</body>
</html>