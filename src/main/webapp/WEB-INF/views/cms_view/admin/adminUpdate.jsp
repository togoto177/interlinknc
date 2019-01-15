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
$(document).ready(function() {

$("#adDelete").click(function() {
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    location.href="/interlinknc/admin_delete?ad_seq="+$("#ad_seq").val();
	}else{   //취소
	    return;
	}
	
});
});
</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>사원관리</a>
	</div>
	
	<div class="portTitleView">
		<a>사원정보수정</a>
	</div>
	<form id="admin_form" name="admin_form" method="post" action="admin_modify_action">
	<input type="hidden" id="ad_seq" name="ad_seq" value="${admin_info.ad_seq}" />
	<input type="hidden" id="chk" name="chk" value="${admin_info.ad_seq}" />
	<input type="hidden" id="division" name="division" value="${division}">
	<div class="portBox">
		<table class="adminUpdate">
			<colgroup>
				<col style="width: 50%" />
				<col style="width: 50%" />
			</colgroup>
			<tr>
				<td>
					<div class="td1">아이디</div>
					<div class="td2">${admin_info.ad_id}</div>
				</td>
				<td>
					<div class="td1">전화번호</div>
					<div class="td2"><input type="text" id="ad_contact" name="ad_contact" value="${admin_info.ad_contact }" /></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="td1">이름</div>
					<div class="td2"><input type="text" name="ad_name" value="${admin_info.ad_name}" readonly="readonly"/></div>
				</td>
				<td>
					<div class="td1">이메일</div>
					<div class="td2"><input type="text" id="ad_email" name="ad_email" value="${admin_info.ad_email }" /></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="td1" style="position: relative; top: 3;">직급</div>
					<div class="td2">
						<select name="ad_rank">
							<option value="사원" ${admin_info.ad_rank eq "사원" ? "selected" :""}>사원</option>
							<option value="대리" ${admin_info.ad_rank eq "대리" ? "selected" :""}>대리</option>
							<option value="주임" ${admin_info.ad_rank eq "주임" ? "selected" :""}>주임</option>
							<option value="과장" ${admin_info.ad_rank eq "과장" ? "selected" :""}>과장</option>
							<option value="차장" ${admin_info.ad_rank eq "차장" ? "selected" :""}>차장</option>
							<option value="부장" ${admin_info.ad_rank eq "부장" ? "selected" :""}>부장</option>
							<option value="이사" ${admin_info.ad_rank eq "이사" ? "selected" :""}>이사</option>
							<option value="부사장" ${admin_info.ad_rank eq "부사장" ? "selected" :""}>부사장</option>
							<option value="대표" ${admin_info.ad_rank eq "대표" ? "selected" :""}>대표</option>
						</select>
					</div>
				</td>
				<td>
					<div class="td1">입사일</div>
					<div class="td2"><input type="text" name="ad_hiredate" id="datepicker" value="${admin_info.ad_hiredate}"/></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="td3">비고</div>
					<div class="td4" style="height: 325;"><textarea rows="3" cols="5" name="ad_etc" placeholder="내용을 입력하세요.">${admin_info.ad_etc}</textarea></div>
				</td>
			</tr>
		</table>
	</div>
	</form>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1" onclick="admin_modify()" style="cursor:pointer;">EDIT</a>
		</div>
		<div class="btnDiv3">
			<a class="btn1" id="adDelete" style="cursor:pointer;">DELETE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" href="/interlinknc/adminList" style="padding: 30 29;">LIST</a>
		</div>
	</div>
</div>
</body>
</html>