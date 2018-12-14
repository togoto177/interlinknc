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
$(function(){
	$('.upload_text').val('미리보여줄 텍스트.');
	$('.input_file').change(function(){
		var i = $(this).val();
		$('.upload_text').val(i);
	});
});
</script>
</head>
<body>
<div class="cmsTop">
	<div class="cmsTopLogo">
		<img alt="인터링크앤씨 로고" src="resources/cms/logo_darkgray.png">
	</div>
	<div class="cmsTopText">
		<a class="cmsTopText1">ㅇㅇㅇ</a><a class="cmsTopText2">님 환영합니다.</a>
		<a class="cmsTopText3" href="/password">비밀번호변경</a><a class="cmsTopText4">|</a><a class="cmsTopText3">로그아웃</a>
	</div>
</div>
<div class="cmsLeft">
	<ul>
		<li class="title">게시판관리</li>
		<li><a class="right">&rtrif;</a><a href="/portfolioList"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList">  DOWNLOADS</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/contactList"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

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
				<td colspan="2" class="oneTitle"><a>홈페이지 가격 문의</a></td>
			</tr>
			<tr>
				<td>
					<label>작성자</label>
					<a>김영정</a>
				</td>
				<td>
					<label>일자</label>
					<a>2018-12-12</a>
				</td>
			</tr>
			<tr>
				<td>
					<label>이메일</label>
					<a class="Email">question@gmail.com</a><img alt="복사" src="resources/cms/notepad.png">
				</td>
				<td>
					<label>연락처</label>
					<a>010-1234-1234</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tdText"><a>홈페이지 가격 문의합니다.</a></td>
			</tr>
			<tr class="noBorder">
				<td colspan="2">
					<div class="btnDiv1">
						<a class="btn1">상태수정</a>
					</div>
					<select>
						<option>상태</option>
						<option>미확인</option>
						<option>확인</option>
						<option>답변완료</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
	<div class="btnbox">
		<div class="btnDiv2" style="margin-right: 0;">
			<a class="btn1" style="padding: 30;" href="/contactList">LIST</a>
		</div>
	</div>
</div>
</body>
</html>