<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="cms_include.jsp"%>
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
</div>

<div class="cmsMainCon">
	<div class="con1">
		<a>INTERLINK&amp;C</a>
	</div>
	<div class="con2">
		<div class="con2Input">
			<div class="con2Input1">
			<label>ID</label><input type="text" />
			</div>
			<div class="con2Input2">
			<label>PASSWORD</label><input type="text" />
			</div>
		</div>
		<div class="con2But">
			<a class="con2But1" href="/portfoiloList">SIGN IN</a>
		</div>
	</div>
	<div class="con3">
		<div class="con3Text">
			<a class="con2But2">REGISTER&#183;</a><a href="#signUp">가입하기</a>
		</div>
	</div>
</div>







<a href="#x" class="overlay" id="signUp"></a>
<div class="popup">
	<div class="popupCon">
		<div class="popupTitle">
			<a class="popupTitle1">회원가입</a><br />
			<a class="popupTitle2">가입 후 관리자가 승인해야 로그인이 가능합니다.</a>
		</div>
		<div class="popupCon2">
			<div class="popupCon2_1">
				<div class="popupCon2_1_id">
					<label class="labelLeft">아이디</label>
					<input type="text" />
				</div>
				<div class="popupCon2_1_bt">
					<a>중복확인</a>
				</div>
			</div>
			
			<div class="popupCon2_2">
				<label class="labelLeft">비밀번호</label>
				<input type="password" />
			</div>
			<div class="popupCon2_2">
				<label class="labelRight">비밀번호확인</label>
				<input type="password" />
			</div>
			
			<div class="popupCon2_2">
				<label class="labelLeft">이름</label>
				<input type="text" />
			</div>
			<div class="popupCon2_2">
				<label class="labelRight">전화번호</label>
				<input type="text" />
			</div>
			
			<div class="popupCon2_1_E">
				<label class="labelLeft">이메일</label>
				<input type="text" />
			</div>
			
			<div class="popupCon2_1_But">
				<a>REGISTER</a>
			</div>
		</div>
	</div>
	
	<a class="close" href="#close"></a>
</div>

</body>
</html>