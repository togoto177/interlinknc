<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../cms_include.jsp"%>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>interlinknc</title>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
	<%@ include file="../cms_left_bar.jsp"%>
	<div align="center" style="margin-top: 200px; height: 1500px;">
		
		<c:if test="${board_division == 'download'}">
		<h1>downloads</h1>
		</c:if>
		<c:if test="${board_division == 'portfolio'}">
		<h1>portfolio</h1>
		</c:if>	
		
		
		<form id="board_form" name="board_form" method="post" action="cms_board_insert_action" enctype="multipart/form-data">
				<input type="hidden" id="board_division" name="board_division" value="${board_division}"/>
				<table style="width: 700px;" border="1">
					<tr class="display_none">
						<td style="width: 20%;">ID</td>
						<td style="width:  80%;">${sessionScope.ad_id }</td>
					</tr>
					<tr>
						<c:if test="${board_division == 'portfolio' }">	
						<td style="width: 20%;">
						<select name="pf_division" id="pf_division">
							<option>구분</option>
							<option value="홈페이지">홈페이지</option>
							<option value="유지보수">유지보수</option>
						</select>
						</td>
						</c:if> 
						<td style="width: 80%;"><input type="text" name="board_title" id="board_title" style="width: 100%;" placeholder="" /></td>
					</tr>
					<c:if test="${board_division == 'portfolio' }">	
					<tr>
						<td style="width: 20%;">사업기간</td> 
						<td style="width: 80%;"><input type="text" name="business_period" id="business_period" style="width: 100%;" /></td>
					</tr>
					<tr>
						<td style="width: 20%;">발주처</td> 
						<td style="width: 80%;"><input type="text" name="buyer" id="buyer" style="width: 100%;" /></td>
					</tr>
					<tr>
						<td style="width: 20%;">연결주소</td> 
						<td style="width: 80%;"><input type="text" name="link" id="link" style="width: 100%;" /></td>
					</tr>
					</c:if>
					<tr>
						<td style="width: 20%;"><button type="button" id="newFile" >첨부파일</button></td> 
						<td style="width: 80%;">
						<div style="overflow-y:scroll; height:100px; width:100%">
						<c:if test="${board_division == 'portfolio'}">
						<input type="file" name="uploadfile" class="multi with-preview" id="orgFile" maxlength="1" />
						</c:if>
						<c:if test="${board_division == 'download'}">
						<input type="file" name="uploadfile" class="multi" id="orgFile" maxlength="2"/>
						</c:if>
						</div>
					</tr>
					
				</table>
				<table style="width: 700px;">	
					<tr>
						<td colspan="4"><textarea name="board_content" id="board_content" style="width:100%; height:412px;"></textarea></td>
					</tr>
					<tr>
						<td align="left" colspan="1">
						<br><button type="button" class="btn btn-primary" id="list">목록</button>
						</td>
						<td align="right" colspan="2">
						<br><button type="button" class="btn btn-primary" id="save">저장</button>
						</td>
					</tr>
			    </table>
			</form>




	</div>
</body>
</html>