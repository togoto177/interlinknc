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
							
							//--페이지 셋팅
							var totalPage = ${totalPage}; //전체 페이지
							var startPage = ${startPage}; //현재 페이지
							
							var pagination = "";

							//--페이지네이션에 항상 10개가 보이도록 조절
							var forStart = 0;
							var forEnd = 0;

							if ((startPage - 5) < 1) {
								forStart = 1;
							} else {
								forStart = startPage - 5;
							}

							if (forStart == 1) {

								if (totalPage > 9) {
									forEnd = 10;
								} else {
									forEnd = totalPage;
								}

							} else {

								if ((startPage + 4) > totalPage) {

									forEnd = totalPage;

									if (forEnd > 9) {
										forStart = forEnd - 9
									}

								} else {
									forEnd = startPage + 4;
								}
							}
							//--페이지네이션에 항상 10개가 보이도록 조절

							//전체 페이지 수를 받아 돌린다.
							for (var i = forStart; i <= forEnd; i++) {
								if (startPage == i) {
									
									pagination  +=  '<a class="focus" name="page_move" start_page="'+i+'" disabled>'
											+ i + '</a>';
								} else {
									pagination += ' <a name="page_move" start_page="'+i+'">'
											+ i + '</a>';
								}
							}
						
						
							//하단 페이지 부분에 붙인다.
							$("#pagination").append(pagination);
							//--페이지 셋팅

							$("#searchBtn").click(function() {
								document.board_form.submit();
							
							});
							
							

							//페이지 번호 클릭시 이동
							$(document).on("click","a[name='page_move']",
									function() {
										var visiblePages = 10;//리스트 보여줄 페이지
										
										$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
										$('#visiblePages').val(visiblePages);
										document.board_form.submit();
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
		<a>PORTFOLIO</a>
	</div>
	<form name="board_form"  method="get">
	<input type="hidden" id="board_division" name="board_division" value="${board_division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
	<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}" /><img alt="돋보기" src="resources/cms/search.png" id="searchBtn">
	<input type="hidden" value="board_title" name="sch_type" />
	</div>
	</form>
	<div class="portTable">
		<table>
			<colgroup>
					<col style="width: 5%" />
					<col style="width: 15%" />
					<col style="width: 50%" />
					<col style="width: 20%" />
					<col style="width: 10%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td>구분</td>
				<td>제목</td>
				<td>일자</td>
				<td>조회수</td>
			</tr>
			<c:forEach var="board_list" items="${board_list}"  varStatus="status">
			<tr class="portTd">
			<td>
                <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                ${totalCnt+1-(startpage*10+statuscount)} 
                                 
            </td>
            <td>${board_list.pf_division}</td>
			<td class="title"><a onclick="location.href='portfolioUpdate?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a></td>
			<td>${board_list.business_period}</td>
			<td>${board_list.board_hit}</td>
			</tr>
			</c:forEach>			
		</table>
	</div>
	
	<div class="portCount">
		<ul>
		<li class="portCount1">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/portfolioList?board_division=portfolio&startPage=1&visiblePages=10';">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png">
		</li>
		<li id="pagination"></li>
		<li class="portCount2">
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow1.png">
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/portfolioList?board_division=portfolio&startPage=${totalPage}&visiblePages=10';">
		</li>
		</ul>
 		<div class="btnList">
		<div class="btnDiv1">
		<a class="btn1" id="insert_view">WRITE</a>
		</div>
		</div>
	</div>
</div>
</body>
</html>