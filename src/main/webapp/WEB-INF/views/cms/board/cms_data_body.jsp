<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../cms_include.jsp"%>
<html>
<head>
	<title>interlinknc</title>
<script type="text/javascript">
function downFile(fileName){
	alert(fileName);
	location.href="dataFileDown.do?file_name="+encodeURI(fileName);
}

function list(){
	location.href="cms_data?board_division="+$("#board_division").val();
}

function modify(){
	location.href="cms_data_update?board_division="+$("#board_division").val()+"&board_seq="+$("#board_seq").val();
}

function Delete(){
	location.href="cms_data_delete?board_division="+$("#board_division").val()+"&board_seq="+$("#board_seq").val();
}



</script>	
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div class="contens">	
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<h1>downloads</h1>
			<input type="hidden" id="board_division" name="board_division" value="${board_body.board_division}">
			<input type="hidden" id="board_seq" name="board_seq" value="${board_body.board_seq}">
		<br>
			<table border="1" class="table table-hover" style="margin-bottom: 0;">

				<tr>
					<td class="table-info" colspan="1" width="150px">제목</td>
					<td>&ensp;${board_body.board_title}</td>
				</tr>
					<tr>
					<td class="table-info">ID</td>
					<td>&ensp;${board_body.board_writer}</td>
					</tr>
					<tr>
					<td class="table-info">작성일자</td>
					<td>&ensp;${board_body.board_registerdate}</td>
					</tr>
					<tr>
					<td class="table-info">조회수</td>
					<td>&ensp;${board_body.board_hit}</td>
					</tr> 
					<tr height="200px">
					<td class="table-info">내용</td>
					<td valign="top">
							<br>
					${board_body.board_content}
					</td>
					</tr>
			</table>
			</div>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table border="1" class="table table-hover">
					 <c:choose>
						<c:when test="${fn:length(board_body.file_ori_name) == 0}">												
							<tr>
								<td class="table-info" colspan="1" width="150px">첨부파일</td>
								<td colspan="2" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<tr>
								 <td class="table-info" width="150px">첨부파일</td>
								 <td align="left" colspan="2">	
								 <c:forEach items="${file_list}" var="file_list">

									${file_list.file_ori_name}
									<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${file_list.file_sub_name}');">		
												다운받기
									</button>
									${file_list.file_size}KB
									    <br/>
									</c:forEach>
								</td>
							</tr>
							
						</c:otherwise>
					</c:choose>
					
			</table>
			</div>
					

			 
			<br>
			<div align="center" style=" padding-left: 200px; width: auto;">
			<table class="table table-hover">
				<tr>
					<td align="left">
						<button type="button" class="btn btn-primary" onclick="list();">목록</button>
					</td>
					<td colspan="2" align="right">
						
					    		
					        		<button type="button" class="btn btn-primary" id="modify" name="modify" onclick="modify();">글 수정</button>
									<button type="button" class="btn btn-primary" id="delete" name="delete" onclick="Delete();">글 삭제</button>
					    		
							
						
					</td>
			
				</tr>
			</table>
			</div>
			<div align="center">
				<table >
			<tr>
			<td align="left">
<!-- 			<button id="preBtn" name="preBtn">이전글</button>
			<button id="afterBtn" name="afterBtn">다음글</button> -->
			</td>
			</tr>
			</table>
			</div>
			
			</div>
	</div>

		

</body>
</html>