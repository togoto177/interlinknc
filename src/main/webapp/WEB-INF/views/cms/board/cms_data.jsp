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
	$(document).ready(function() { 
							$("검색").click(function() {
								document.data_form.submit();
							
							});
							

							//게시물 등록 클릭
							$("#insert").click(function() {
								location.href = "cms_data_insert?board_division=" + $("#board_division").val();
							});
							
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
									
									pagination  +=  '<a class="c-pagination__link" name="page_move" start_page="'+i+'"style="background-color: skyblue;" disabled>'
											+ i + '</a>';
								} else {
									pagination += ' <a class="c-pagination__link" name="page_move" start_page="'+i+'" style="cursor:pointer;" >'
											+ i + '</a>';
								}
							}
						
						
							//하단 페이지 부분에 붙인다.
							$("#pagination").append('<ul class="c-pagination__list">' + pagination + '</ul>');
							//--페이지 셋팅

							$("#searchBtn").click(function() {
								document.data_form.submit();
							
							});
							
							

							//페이지 번호 클릭시 이동
							$(document).on("click","a[name='page_move']",
									function() {
										var visiblePages = 10;//리스트 보여줄 페이지
										
										$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
										$('#visiblePages').val(visiblePages);
										document.data_form.submit();
									});
							

							


							
						 }); 
	$(document).ready(function() { 
		  
		  var i = $("#hidden_type").val();
			$("#sch_type > option[value='"+i+"']").attr("selected","selected");
			


	  });
	function downFile(fileName){
		location.href="dataFileDown.do?file_name="+encodeURI(fileName);
	}
	
	function over(fileNamee){
		
		var con = document.getElementById("hidden"+fileNamee);
		
		if(con.style.display=='none'){
	        con.style.display = '';
	    }else{
	        con.style.display = 'none';
	    } 


/* 		if(fileNamee == 1){
			$("#hidden").append('<ul class="c-pagination__list">' + pagination + '</ul>');
		} */
	}
	
	

	</script>
</head>
<body class="cms_portfolio_body">
<%@ include file="../cms_header.jsp"%>
<div class="cms_portfolio_div">
	<%@ include file="../cms_left_bar.jsp"%>
	<div class="contens">	
		<form name="data_form"  method="get">
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<h1>downloads</h1>
			<input type="hidden" id="board_division" name="board_division" value="${board_division}">
			<input type="hidden" id="filename" name="filename" value="${board_division}">
 			<input type="hidden" id="startPage" name="startPage" value="">
			<input type="hidden" id="visiblePages" name="visiblePages" value="">
    		
		
				<table style="border: 0; width: 900px;">		
					<tbody>	
					<tr>
					<td colspan="2" align="left" width="100px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</td>
				 	
												<!-- 검색 view  -->
					<td colspan="5" align="right">
 					<select class="selectForm" name="sch_type" id="sch_type" >
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
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
				<table class="table table-hover" border="1">
					<tr class="table-info" align="center">
						<th align="center" width="30px">
							<input type="checkbox" id="product_check_all"/> 
						</th>
						<th align="center" width="30px">No</th>
						<th align="center" width="300px">제목</th>
						<th align="center" width="100px">일자</th>
						<th align="center" width="100px">첨부파일</th>
						<th align="center" width="100px">다운수</th>
						<th align="center" width="100px">조회수</th>
					</tr>												
							<c:forEach var="board_list" items="${board_list}"  varStatus="status">
							<input type="hidden" id="filename" name="filename" value="${filename}">
								<tr class="qest">
									<td align="center">
									<input type="checkbox" id="checkOne" name="seq_id" value="${board_list.board_seq}"/>
									</td>
									<td align="center">
                                    <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                                    <c:set var="startpage" value="${startPage-1}" />
                                    <c:set var="statuscount" value="${status.count }" />
                                    ${totalCnt+1-(startpage*10+statuscount)} 
                                    
                                    </td>
									<td>
									<a id="title" class="mouseOverHighlight" onclick="location.href='cms_data_body?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a>
									</td>
									<td align="center">${board_list.board_registerdate}</td>
									<td align="center">
									
									<c:set var="boarlist" value="${board_list.file_sub_name}" />																	
									<c:set var="split_file" value="${fn:split(board_list.file_sub_name,'|')}" />					
															
									<c:if test="${fn:length(split_file) == 1}">
									<c:forEach items="${split_file}" var="boardlist">
									<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}');">
									<c:set var="TextValue" value="${boardlist}"/>다운로드									
									</button>
									<br/>
									</c:forEach>
									</c:if>
									<c:if test="${fn:length(split_file) >= 2}">
									<button type="button" id="hidden_over" name="hidden_over" onclick="over('${board_list.board_seq}');" >열기</button>		
									</c:if>
									</td>
									<td align="center">9999</td>
									<td align="center">9999</td>
								</tr>
								<tr id = "hidden${board_list.board_seq}" style="display: none;">
								<td align="center" colspan="7">			
									<c:forEach items="${split_file}" var="boardlist">
									<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}');">
									<c:set var="TextValue" value="${boardlist}"/>${fn:substringAfter(TextValue,'_') }									
									</button>
									<br/>
									</c:forEach>
									
									</td>
								</tr>
								</c:forEach>
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
							<a href="cms_data.do?board_division=download&startPage=1&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allprev">처음으로</a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
							<a href="#" class="c-pagination" id="pagination"></a>
							<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
							<a href="cms_data.do?board_division=download&startPage=${totalPage}&visiblePages=10"
								class="c-pagination__arrow c-pagination__arrow--allnext">마지막페이지로</a>
						</div>
				<!-- 페이징 end -->
				</form>
	</div>

		
</div>
</body>
</html>