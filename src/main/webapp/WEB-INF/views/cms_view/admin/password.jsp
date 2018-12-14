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
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>비밀번호변경</a>
	</div>
	
	<div class="infoCon" style="top: 180;">
		<div class="infoCon1">
			<div class="label">
			<a>기존비밀번호</a>
			</div>
			<div class="input">
			<input type="password" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>신규비밀번호</a>
			</div>
			<div class="input">
			<input type="password" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>비밀번호확인</a>
			</div>
			<div class="input">
			<input type="password" />
			</div>
		</div>
	</div>
	<div class="pubText" style="top:180;">
		<a>비밀번호가 성공적으로 변경되었습니다!</a>
	</div>
	<div class="butEdit" style="top:225">
		<a style="padding: 9 145;">CONFIRM</a>
	</div>
</div>
</body>
</html>