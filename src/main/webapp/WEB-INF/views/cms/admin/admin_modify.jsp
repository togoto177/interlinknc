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
function admin_modify() {
	alert();
	$("#admin_form").submit(); 
}
</script>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
	<div>
		<%@ include file="../cms_left_bar.jsp"%>
		<div class="contens">
			관리자 수정
			<form id="admin_form" name="admin_form" method="post" action="admin_modify_action">
			<table border=1 style="align-content: center;">
				<tr>
					<td>아이디</td>
					<td><label>${admin_info.ad_id}
					<input type="hidden" id="ad_seq" name="ad_seq" value="${ad_seq}" />
					<input type="hidden" id="result" name="result" value="${result}" />
					</label></td>

				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="ad_name" name="ad_name"
						value="${admin_info.ad_name}"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" id="ad_contact" name="ad_contact"
						value="${admin_info.ad_contact}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="ad_email" name="ad_email"
						value="${admin_info.ad_email}"></td>
				</tr>
				<tr>
					<td colspan="2">
					<c:if test="${result == 'sucess'}">
					변경이완료되었습니다.
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="button" value="저장" onclick="admin_modify()" />
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>