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
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div style="padding-top: 100px;">	
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<h1>downloads</h1>
			<input type="hidden" id="board_division" name="board_division" value="${board_body.board_division}">
			<input type="hidden" id="board_seq" name="board_seq" value="${board_body.board_seq}">
		<br>
			<table border="1" class="table table-hover" style="width: 700px;">

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
			<div align="center" style=" padding-left: 200px;">
			<table border="1" class="table table-hover" style="width: 700px;">
					 <c:choose>
						<c:when test="${fn:length(file_list) == 0}">												
							<tr>
								<td class="table-info" colspan="1" width="150px">첨부파일</td>
								<td colspan="2" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<tr>
								 <td class="table-info" width="150px">첨부파일</td>
								 <td align="left" colspan="2" style="font-size: small;">	
								 <c:forEach items="${file_list}" var="file_list">
									파일 명 : ${file_list.file_ori_name}
									| 파일 크기 : ${file_list.file_size}KB
									| 다운로드 수 : ${file_list.file_hit}
									<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${file_list.file_sub_name}*${file_list.file_seq}');">		
												↓
									</button>
									    <br/>
									</c:forEach>
								</td>
							</tr>
							
						</c:otherwise>
					</c:choose>
					
			</table>
			</div>
					

			 
			<br>
			<div align="center" style=" padding-left: 200px;">
			<table class="table table-hover" style="width: 700px;">
				<tr>
					<td colspan="1" align="left">
						<button type="button" class="btn btn-primary" id="list">목록</button>
					</td>
					<td colspan="2" align="right">
						
					    <button type="button" class="btn btn-primary" id="modify">글 수정</button>
						<button type="button" class="btn btn-primary" id="delete">글 삭제</button>
					</td>
					</tr>
				<tr>
					
					<td align="left">
						<c:if test="${board_body.preview eq null}">
						제일 첫 페이지 입니다.
						</c:if>
						<c:if test="${board_body.preview ne null}">
						<button type="button" class="btn btn-primary" id="preview" value="${board_body.preview}">이전 글 (${board_body.pretitle})</button>
						</c:if>
					</td>
					<td align="right">
						<c:if test="${board_body.nextview eq null}">
						제일 마지막 페이지 입니다.
						</c:if>
						<c:if test="${board_body.nextview ne null}">
						<button type="button" class="btn btn-primary" id="nextview" value="${board_body.nextview}">다음 글(${board_body.nexttitle})</button>
						</c:if>
						</td>
				</tr>
			</table>
			</div>		
			</div>
	</div>

		

</body>
</html>