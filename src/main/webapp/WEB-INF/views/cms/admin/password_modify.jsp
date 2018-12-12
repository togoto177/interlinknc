<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../cms_include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function password() {
	
	alert("ddddddddddddd");
	$("#password_modify").submit(); 
}
</script>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
	<div>
		<%@ include file="../cms_left_bar.jsp"%>
		<div class="contens">
			비밀번호 변경
			<form id="password_modify" name="password_modify" method="post" action="password_modify_action">
			<table border=1 style="align-content: center;">
				<tr>
					<td>기존비밀번호</td>
					<td><input type="text" id="ad_ori_password" name="ad_ori_password">
						<input type="hidden" id="ad_seq" name="ad_seq" value="${ad_seq}" />
					<input type="hidden" id="result" name="result" value="${result}" />
					</td>
				</tr>
				<tr>
					<td>신규비밀번호</td>
					<td><input type="text" id="ad_password" name="ad_password">
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="text" id="ad_passwordChk" name="ad_passwordChk">
					</td>
				</tr>		
				<tr>
					<td colspan="2">
					<input type="button" value="저장" onclick="password()" />
					</td>
				</tr>
					<tr>
					<td colspan="2">
					<c:if test="${result == 'sucsess'}">
					변경이완료되었습니다.
					</c:if>
					<c:if test="${result == 'fail'}">
					기존 패스워드가 틀립니다.
					</c:if>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>