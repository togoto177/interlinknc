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
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
	<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
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
					<col style="width: 50%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td>제목</td>
				<td>일자</td>
				<td>다운로드</td>
				<td>다운수</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="board_list" items="${board_list}"  varStatus="status">
			<input type="hidden" id="filename" name="filename" value="${filename}">
			<tr class="portTd">
				<td><!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                ${totalCnt+1-(startpage*10+statuscount)}</td>
				<td class="title"><a href="/interlinknc/downloadsUpdate?board_division=${board_division}&board_seq=${board_list.board_seq}">${board_list.board_title}</a></td>
				<td>${board_list.board_registerdate}</td>
				<td>
				
				<!-- <img alt="" src="resources/mainImg/download_arrow_white.png"> -->
				<c:set var="boardlist" value="${board_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(board_list.file_sub_name,'|')}" />
						<c:if test="${board_list.file_cnt == 0}">
						X
						</c:if>
						<c:if test="${board_list.file_cnt == 1}">
						<c:forEach items="${split_file}" var="boardlist">
						<img alt="" src="resources/mainImg/download_arrow_white.png" id="downBtn" onclick="downFile('${boardlist}', '${board_list.board_seq}');">
						<br/>
						</c:forEach>
						</c:if>
						<c:if test="${board_list.file_cnt >= 2}">
						<img alt="" src="resources/mainImg/download_arrow_white.png" id="hidden_over" name="hidden_over" onclick="over('${board_list.board_seq}');" >		
						</c:if>
				</td>
				<td>${board_list.file_hit}</td>
				<td>${board_list.board_hit}</td>
			</tr>
					<tr id = "hidden${board_list.board_seq}" style="display: none;">
						<td align="center" colspan="7">			
							<c:set var="split_file_ori" value="${fn:split(board_list.file_ori_name,'|')}" />
							<c:forEach var="boardlist" items="${split_file}" varStatus="status">
							<c:set var="fileLength" value="${split_file_ori[status.index]}" />
							${fileLength}																
							<img alt="" src="resources/mainImg/download_arrow_white.png" style="width: 15px; height: 15px;"  id="downBtn" onclick="downFile('${boardlist}');">
							<br/>
							</c:forEach>
						</td>
					</tr>
			</c:forEach>
		</table>
	</div>
	<div class="portCount">
	<ul id="paging">
	</ul>
	<div class="btnList">
		<div class="btnDiv1">
		<a class="btn1" href="/interlinknc/downloadsWrite?board_division=download">WRITE</a>
		</div>
		<div class="btnDiv1">
		<input type="button" value="Print" onclick="window.print()" />
		</div>
		</div>
	</div>
</div>
</body>
</html>