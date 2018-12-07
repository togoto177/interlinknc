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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>interlinknc</title>
	<script type="text/javascript">
	$(document).ready(function() { 

							
							//게시물 등록 클릭
							$("#insert_view").click(function() {
								location.href = "cms_board_insert?board_division=" + $("#board_division").val();
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
							
							var i = $("#hidden_type").val();
							$("#sch_type > option[value='"+i+"']").attr("selected","selected");
							
							// 체크박스 선택제어
							$(document).ready(function() {
										$("#product_check_all").click(function() {
											
													var chk = $(this).is(":checked");
													if (chk) {
														$('input[name*="board_seq"]').prop('checked',true);
													} else {
														$('input[name*="board_seq"]').prop('checked',false);
													}
												});		
							});
							
						}); 
						
						function all_check() {
					
							var chk = $(this).prop("disabled");
							$('input:checkbox[name="check_box"]').each(function() {
					
								if (chk) {
									$('input[name="check_box"]').each(function() {
										var opt = $(this).prop("disabled");
										if (!opt) {
											$(this).attr("checked", true);
										}
									});
								} else {
									$("input[name='check_box']").attr("checked", false);
								}
							});
						};
					
						
						// 버튼 선택 제어 
						function checkboxSelectQue(n, obj) {
							var i;
							var chk = document.getElementsByName(obj);
							var tot = chk.length;
							for (i = 0; i < tot; i++) {
								if (n == 1)
									chk[i].checked = true;
								if (n == 2)
									chk[i].checked = false;
							}
						};
						
						 function detailSubmit() {
							    	//체크박스 선택에 따른 삭제 유무
									if(confirm("정말로 삭제 하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
								           document.board_form.action='cms_board_delete';
												alert("삭제 되었습니다.");
								          } else{
								            alert("삭제하실 목록을 체크하여 주십시오.")
								            return;
								             }
										}else{
											alert("취소 되었습니다.");
											return;
										}	
							    document.board_form.submit();
							  };
	</script>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
<div>
	<%@ include file="../cms_left_bar.jsp"%>
	<div style="padding-top: 100px;">	
		<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
		
			<c:if test="${board_division == 'download'}">
			<h1>downloads</h1>
			</c:if>
			<c:if test="${board_division == 'portfolio'}">
			<h1>portfolio</h1>
			</c:if>
			<c:if test="${board_division == 'customer'}">
			<h1>customer</h1>
			</c:if>

			<form name="board_form"  method="get">
				<input type="hidden" id="board_division" name="board_division" value="${board_division}">
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
    			<table style="border: 0; width: 700px;">		
					<tbody>	
					<tr>
						<td colspan="2" align="left" width="200px">TOTAL : ${totalCnt}건 ( ${startPage} / ${totalPage} ) 페이지</td>
					 	
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
			</form>				
				<br>	
				<table class="table table-hover" border="1" style="width: 700px; font-size: small;" >
					<tr class="table-info" align="center">
						<th align="center" width="30px">
							<input type="checkbox" id="product_check_all"/> 
						</th>
						<th align="center" width="30px">No</th>
						
						<c:if test="${board_division == 'portfolio' }">
						<th align="center" width="100px">구분</th>
						</c:if>
						
						<th align="center" width="300px">제목</th>
						
						<c:if test="${board_division == 'customer' }">
						<th align="center" width="100px">작성자</th>
						</c:if>
						
						<th align="center" width="100px">일자</th>
						
						<c:if test="${board_division == 'download'}">
						<th align="center" width="100px">첨부파일</th>
						<th align="center" width="100px">총 다운 수</th>
						</c:if>
						
						<c:if test="${board_division == 'portfolio' ||board_division == 'download'}">
						<th align="center" width="100px">조회수</th>
						</c:if>
						
						<c:if test="${board_division == 'customer' }">
						<th align="center" width="100px">답변상태</th>
						</c:if>
					</tr>												
						<c:forEach var="board_list" items="${board_list}"  varStatus="status">
							<input type="hidden" id="filename" name="filename" value="${filename}">
					<tr class="qest">
						<td align="center">
						<input type="checkbox" id="checkOne" name="board_seq" value="${board_list.board_seq}"/>
						</td>
						<td align="center">
                           <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                           <c:set var="startpage" value="${startPage-1}" />
                           <c:set var="statuscount" value="${status.count }" />
                           ${totalCnt+1-(startpage*10+statuscount)} 
                                 
                        </td>
                        
                        <c:if test="${board_division == 'portfolio' }">
						<td align="center">${board_list.pf_division}</td>
						<td>
						<a id="title" class="mouseOverHighlight" onclick="location.href='cms_board_body?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a>
						</td>
						<td align="center">${board_list.business_period}</td>
						</c:if>
						 
						 <c:if test="${board_division == 'customer' }">
						<td>
						<a id="title" class="mouseOverHighlight" onclick="location.href='cms_board_body?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a>
						</td>
						<td align="center">${board_list.user_id}</td>
						<td align="center">${board_list.board_registerdate}</td>
						</c:if>
						
						<c:if test="${board_division == 'download'}">
						<td><a id="title" class="mouseOverHighlight" onclick="location.href='cms_board_body?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a></td>
						<td align="center">${board_list.board_registerdate}</td>
						<td align="center">
						<c:set var="boardlist" value="${board_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(board_list.file_sub_name,'|')}" />
						<c:if test="${board_list.file_cnt == 0}">
						X
						</c:if>
						<c:if test="${board_list.file_cnt == 1}">
						<c:forEach items="${split_file}" var="boardlist">
						<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${board_list.board_seq}');">
						<c:set var="TextValue" value="${boardlist}"/>다운로드									
						</button>
						<br/>
						</c:forEach>
						</c:if>
						<c:if test="${board_list.file_cnt >= 2}">
						<button type="button" id="hidden_over" name="hidden_over" onclick="over('${board_list.board_seq}');" >열기</button>		
						</c:if>
						</td>
						<td align="center">
						${board_list.file_hit}
						</td>
						</c:if>
						
						<c:if test="${board_division == 'download' || board_division == 'portfolio'}">
						<td align="center">${board_list.board_hit}</td>
						</c:if>
						<c:if test="${board_division == 'customer'}">
							<c:if test="${board_list.status == '0'}">
								<td align="center">미확인</td>
							</c:if>
							<c:if test="${board_list.status == '1'}">
								<td align="center">확인</td>
							</c:if>
						</c:if>
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
		<div>
		<br/>
			<table style="width: 700px;">
				<tr>
					<td align="left">
					   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체선택" onclick="checkboxSelectQue(1,'board_seq')" />
					   <input class="btn btn-primary" style="font-size: small;" type="button" value="전체해제" onclick="checkboxSelectQue(2,'board_seq')" /> 
					</td>
					<td align="right">
			        		<input class="btn btn-primary" style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn" onclick="detailSubmit()" />
							<c:if test="${board_division != 'customer' }">
							<input class="btn btn-primary" style="font-size: small;" type="button" value="업로드" id="insert_view" />
							</c:if>								
					</td>
				</tr>
			</table>
		</div>
		</div>
		<!-- 페이징 view -->
		<br/>
			<div align="center" style=" padding-left: 200px;">
				
				<table>
				<tr>
				<td><a href="cms_board?board_division=download&startPage=1&visiblePages=10">처음</a></td>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
				<td id="pagination"></td>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
				<td><a href="cms_board?board_division=download&startPage=${totalPage}&visiblePages=10">마지막</a></td>
				</tr>
				</table>
				
			</div>
		<!-- 페이징 end -->
	</div>

		
</div>
</body>
</html>