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
		<li><a class="right">&rtrif;</a><a href="/contactList"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info"> 내정보수정</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>사원관리</a>
	</div>
	
	<div class="portTitleView">
		<a>사원정보수정</a>
	</div>
	<div class="portBox">
		<table class="adminUpdate">
			<colgroup>
				<col style="width: 50%" />
				<col style="width: 50%" />
			</colgroup>
			<tr>
				<td>
					<div class="td1">아이디</div>
					<div class="td2">dkdlel</div>
				</td>
				<td>
					<div class="td1">전화번호</div>
					<div class="td2"><input type="text" value="010-1234-1234" /></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="td1">이름</div>
					<div class="td2">ㅇㅇㅇ</div>
				</td>
				<td>
					<div class="td1">이메일</div>
					<div class="td2"><input type="text" value="dkdlel@interlinknc.com" /></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="td1" style="position: relative; top: 3;">직급</div>
					<div class="td2">
						<select>
							<option>직급</option>
							<option>사원</option>
							<option>대리</option>
						</select>
					</div>
				</td>
				<td>
					<div class="td1">입사일</div>
					<div class="td2"><input type="text" value="2018-12-12"/></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="td3">비고</div>
					<div class="td4" style="height: 325;"><textarea rows="3" cols="5" placeholder="내용을 입력하세요."></textarea></div>
				</td>
			</tr>
		</table>
	</div>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1">EDIT</a>
		</div>
		<div class="btnDiv3">
			<a class="btn1">DELETE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" href="/adminList" style="padding: 30 29;">LIST</a>
		</div>
	</div>
</div>
</body>
</html>