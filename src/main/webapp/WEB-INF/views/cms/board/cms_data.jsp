<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../cms_include.jsp"%>
<html>
<head>
	<title>interlinknc</title>
	<script type="text/javascript">
	$(document).ready(function() { 
							$("검색").click(function() {
								document.listForm.submit();
							
							});
							

							//게시물 등록 클릭
							$("#insert").click(function() {
								location.href = "cms_data_insert?board_division=" + $("#board_division").val();
							});
						 }); 
	</script>
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div class="contens">	
		<form name="listForm"  method="get">
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<h1>downloads</h1>
			<input type="hidden" id="board_division" value="${board_division}">
    		
		
				<table style="border: 0; width: 900px;">		
					<tbody>	
					<tr>
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</td>
					
												<!-- 검색 view  -->
					<td colspan="5" align="right">
 					<select class="selectForm" name="sch_type" id="sch_type" >
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="admin_id">작성자</option>
					</select> 
					<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}"/>
					<input class="btn btn-secondary" type="button" id="searchBtn" value="검색"/>
					<input type="hidden" value="${sch_type}" id="hidden_type" />
					</td>
					<!-- 검색 end  -->
				
					</tr>
					</tbody>
					</table>
					<br>	
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
				<table class="table table-hover">
					<tr class="table-info" align="center">
						<th align="center" width="30px">
							<input type="checkbox" id="product_check_all"/> 
						</th>
						<th align="center" width="50px">No</th>
						<th align="center" width="240px">제목</th>
						<th align="center" width="120px">일자</th>
						<th align="center" width="100px">첨부파일</th>
						<th align="center" width="180px">다운수</th>
						<th align="center" width="180px">조회수</th>
					</tr>												
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
								<tr>
									
									<td align="center">
									<input type="checkbox" id="checkOne" name="seq_id" value="${board_list.seq_id}"/>
									</td>
									<td align="center">
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)}
                                    </td>
									<td>
									<a id="title" class="mouseOverHighlight" onclick="location.href='centernews_detail.do?board_id=${board_list.board_id}&seq_id=${board_list.seq_id}'">${board_list.title}</a>
									</td>
									<td align="center">관리자</td>
									<td align="center">${board_list.admin_name}</td>								
									<td align="center">${board_list.hit}</td>
									<td align="center">${board_list.register_date}</td>
									<td align="center">${board_list.file_name3}
									</td>
								</tr>
				</table>
				<div style="padding-top: 30px;" align="center">
					<table style="width: 900px;">
						<tr>
							<td align="left">
							   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체선택" onclick="checkboxSelectQue(1,'seq_id')" />
							   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체해제" onclick="checkboxSelectQue(2,'seq_id')" /> 
							</td>
					<td align="right">
					        		<input class="btn btn-primary" style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn" onclick="detailSubmit(1)" />
									<input class="btn btn-primary" style="font-size: small;" type="button" value="업로드" id="insert" />								
							</td>
						</tr>
					</table>
				</div>
				</div>

				<!-- 페이징 view -->
						
						<div class="c-pagination" align="center" style="padding-left: 200px; padding-bottom:100px; margin-top:-27px; width: auto;">
							<a href="centernews_list.do?board_id=${board_id}&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="centernews_list.do?board_id=${board_id}&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
				<!-- 페이징 end -->
				</form>
	</div>

		
</div>
</body>
</html>