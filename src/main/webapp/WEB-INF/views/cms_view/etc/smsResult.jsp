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
<script type="text/javascript">
$(document).ready(function(){
    $('#textarea_msg1').keyup();
}); 

</script>
<!-- <style type="text/css">
	.messagesTr{
		visibility: hidden;
	}
</style> -->
<title>interLink&amp;C</title>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>문자 결과</a>
	</div>
	
	<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
	<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
	<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
	<form name="board_form"  method="get">
	<input type="hidden" id="board_division" name="board_division" value="${board_division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
	<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}" /><img alt="돋보기" style="cursor:pointer;" src="resources/cms/search.png" id="searchBtn">
	<input type="hidden" value="board_title" name="sch_type" />
	</div>
	</form>
	
	<div class="portTable">
		<table>
			<colgroup>
					<col style="width: 5%" />
					<col style="width: 30%" />
					<col style="width: 30%" />
					<col style="width: 15%" />
					<col style="width: 20%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td>발신번호</td>
				<td>발신일</td>
				<td>발신결과</td>
				<td>수신결과(슈어엠)</td>
			</tr>
			<c:forEach var="board_list" items="${board_list}"  varStatus="status">
			<tr class="portTd">
				<td>
	                <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
	                <c:set var="startpage" value="${startPage-1}" />
	                <c:set var="statuscount" value="${status.count }" />
	                ${totalCnt+1-(startpage*10+statuscount)}
	            </td>
	            <td class="smsTitle">${board_list.sms_tell}</td>
				<td class="smsTitle">${board_list.sms_sendDate}</td>
				<td>${board_list.sms_result}</td>
				<td>${board_list.sms_result2}</td>
			</tr>
			<tr class="messagesTr" style="display: none;">
				<td colspan="5">${board_list.sms_messages}</td>
			</tr>
			</c:forEach>			
		</table>
	</div>
	
	<div class="portCount">
		<c:if test="${fn:length(board_list) != 0}">
		<ul id="paging">
		</ul>
		</c:if>
		<c:if test="${fn:length(board_list) == 0}">
		<ul>
		<li>0</li>
		</ul>
		</c:if>
		
 		<div class="btnList">
		</div>
	</div>
	
</div>
</body>
</html>