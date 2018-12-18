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

function admin_modify() {
	$("#admin_form").submit(); 
}
</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>내정보수정</a>
	</div>
	
	<div class="infoCon">
	<form id="admin_form" name="admin_form" method="post" action="admin_modify_action">
		<div class="infoCon1">
			<div class="label">
			<a>아이디</a>
			</div>
			<div class="input">
			<input type="text" id="ad_id" name="ad_id" value="${admin_info.ad_id}" readonly="readonly" />
					<input type="hidden" id="ad_seq" name="ad_seq" value="${ad_seq}" />
					<input type="hidden" id="result" name="result" value="${result}" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>이름</a>
			</div>
			<div class="input">
			<input type="text" id="ad_name" name="ad_name"
						value="${admin_info.ad_name}" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>연락처</a>
			</div>
			<div class="input">
			<input type="text" id="ad_contact" name="ad_contact"
						value="${admin_info.ad_contact}" />
			</div>
		</div>
		<div class="infoCon1">
			<div class="label">
			<a>이메일</a>
			</div>
			<div class="input">
			<input type="text" id="ad_email" name="ad_email"
						value="${admin_info.ad_email}" />
			</div>
		</div>
	</form>
	</div>
	<div class="pubText">
		<c:if test="${result == 'sucess'}">
		<a>내 정보가 성공적으로 변경되었습니다!</a>
		</c:if>
	</div>
	<div class="butEdit">
		<a onclick="admin_modify()">EDIT</a>
	</div>
</div>
</body>
</html>