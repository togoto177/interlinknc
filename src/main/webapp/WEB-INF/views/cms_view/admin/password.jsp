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

function password_submit() {
	$("#password_modify").submit(); 
}

</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>비밀번호변경</a>
	</div>
	<form id="password_modify" name="password_modify" method="post" action="password_modify_action">
	<div class="infoCon" style="top: 180;">
		<div class="infoCon1">
			<div class="label">
			<a>기존비밀번호</a>
			</div>
			<div class="input">
			<input type="text" id="ad_ori_password" name="ad_ori_password">
			<input type="hidden" id="ad_seq" name="ad_seq" value="${ad_seq}" />
			<input type="hidden" id="result" name="result" value="${result}" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>신규비밀번호</a>
			</div>
			<div class="input">
			<input type="text" id="ad_password" name="ad_password">
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>비밀번호확인</a>
			</div>
			<div class="input">
			<input type="text" id="ad_passwordChk" name="ad_passwordChk">
			</div>
		</div>
	</div>
	</form>
	<div class="pubText" style="top:180;">
		<c:if test="${result == 'sucsess'}">
		<a>비밀번호가 성공적으로 변경되었습니다!</a>
		</c:if>
		<c:if test="${result == 'fail'}">
		<a>기존 패스워드가 틀립니다.</a>
		</c:if>
		<c:if test="${result == 'fail_id'}">
		<a>변경하실 패스워드를 확인해주세요.</a>
		</c:if>
	</div>
	<div class="butEdit" style="top:225">
		<a style="padding: 9 145;" onclick="password_submit()">CONFIRM</a>
	</div>
</div>
</body>
</html>