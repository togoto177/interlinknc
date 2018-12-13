<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../cms_include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>interlinknc</title>
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
							
							

							//페이지 번호 클릭시 이동
							$(document).on("click","a[name='page_move']",
									function() {
										var visiblePages = 10;//리스트 보여줄 페이지
										
										$('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
										$('#visiblePages').val(visiblePages);
										document.board_form.submit();
									});
							
							// 체크박스 선택제어
							$(document).ready(function() {
										$("#product_check_all").click(function() {
											
													var chk = $(this).is(":checked");
													if (chk) {
														$('input[name*="ad_seq"]').prop('checked',true);
													} else {
														$('input[name*="ad_seq"]').prop('checked',false);
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
								           document.employee_form.action='employee_delete';
												alert("삭제 되었습니다.");
								          } else{
								            alert("삭제하실 목록을 체크하여 주십시오.")
								            return;
								             }
										}else{
											alert("취소 되었습니다.");
											return;
										}	
							    document.employee_form.submit();
							  };
							  
							  function waitDelete() {
							    	//체크박스 선택에 따른 삭제 유무
							    	$("#ad_rank").remove();
									if(confirm("회원가입을 거절 하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
											/* $("#ad_rank").remove(); */
								           document.wait_form.action='employee_delete';
												alert("리스트에서 제거 되었습니다.");
								          } else{
								            alert("삭제하실 목록을 체크하여 주십시오.")
								            return;
								             }
										}else{
											alert("취소 되었습니다.");
											return;
										}	
							    document.wait_form.submit();
							  };
							  
							  function waitSubmit() {
								  $('#toto').attr('disabled', true); 
									if(confirm("해당 대기자들을 승인하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked")){
											document.wait_form.action='wait_admit';
												alert("가입이 승인 되었습니다.");
								          } else{
								            alert("승인하실 목록을 체크하여 주십시오.")
								            return;
								             }
										}else{
											alert("취소 되었습니다.");
											return;
										}	
							    document.wait_form.submit();
							  };	
	</script>
</head>
<body>
	<%@ include file="../cms_header.jsp"%>
	<div>
		<%@ include file="../cms_left_bar.jsp"%>
		<div style="padding-top: 100px;">
		<form name="employee_form"  method="get">
			<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
				<h1>사원관리</h1>
				<input type="hidden" id="startPage" name="startPage" value="">
				<input type="hidden" id="visiblePages" name="visiblePages" value="">
			<table>
			<tr>
			<td align="right">
			<a href="#">회원가입 대기 ${waitCnt} 명</a>
			</td>
			</tr>
			</table>	
			<table>
				<tr>
					<th>No</th>
					<th><input type="checkbox" id="product_check_all"/></th>
					<th>직급</th>
					<th>작성자</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>입사일</th>
				</tr>
				<c:forEach var="list" items="${employee_list}"  varStatus="status">
				<c:if test="${list.ad_id != 'interlink_admin'}">
				<tr>
				<td>
				<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                           <c:set var="startpage" value="${startPage-1}" />
                           <c:set var="statuscount" value="${status.count }" />
                           ${totalCnt+1-1-(startpage*10+statuscount)} 
				</td>
				<td>
				<input type="checkbox" id="checkOne" name="ad_seq" value="${list.ad_seq}" />
				</td>
				<td>
				${list.ad_rank}
				</td>
				<td>
				${list.ad_name}
				</td>
				<td>
				${list.ad_contact}
				</td>
				<td>
				${list.ad_email}
				</td>
				<td>
				${list.ad_hiredate}
				</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<table style="width: 700px;">
				<tr>
					<td align="right">
			        		<input class="btn btn-primary" style="font-size: small;" type="button" value="게시물 삭제" id="listDelBtn" name="listDelBtn" onclick="detailSubmit()" />
					</td>
				</tr>
			</table>

			<!-- 페이징 end -->
			</div>
			
			<div align="center" style=" padding-left: 200px;">
				
				<table>
				<tr>
				<td><a href="employee_list?startPage=1&visiblePages=10">처음</a></td>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--prev">이전페이지로</a> -->
				<td id="pagination"></td>
				<!-- <a href="#" class="c-pagination__arrow c-pagination__arrow--next">다음페이지로</a> -->
				<td><a href="employee_list?startPage=${totalPage}&visiblePages=10">마지막</a></td>
				</tr>
				</table>
				
			</div>
			</form>
			<form name="wait_form"  method="get">
			<div align="center" style="padding-top: 100px; padding-left: 200px; width: auto;">
			<h1>회원가입 대기자</h1>
			<table border="1">
			<c:forEach var="wait_list" items="${wait_list}"  varStatus="status">
			<tr>
			<td>
			<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
            <c:set var="startpage" value="${startPage-1}" />
            <c:set var="statuscount" value="${status.count }" />
			${totalCnt+1-1-(startpage*10+statuscount)} <input type="checkbox" id="checkOne" name="ad_seq" value="${wait_list.ad_seq}" /> 이름 : ${wait_list.ad_name} , 아이디 : ${wait_list.ad_id}
			<select name="ad_rank" id="ad_rank" >
				<option id="toto" value="1">선택</option>
				<option value="사원">사원</option>
				<option value="대리">대리</option>
				<option value="주임">주임</option>
				<option value="과장">과장</option>
				<option value="차장">차장</option>
				<option value="부장">부장</option>
				<option value="이사">이사</option>
				<option value="부사장">부사장</option>
				<option value="대표">대표</option>
			</select> 
			</td>
			</tr>
			</c:forEach>
			</table>
			<table>
				<tr>
					<td align="left">
			        		<button class="btn btn-primary" style="font-size: small;" type="button" onclick="waitDelete()" >거절</button>
					</td>				
					<td align="right">
			        		<button class="btn btn-primary" style="font-size: small;" type="button" onclick="waitSubmit()" >승인</button>
					</td>
				</tr>
			</table>
			</div>
			</form>
			
		</div>


	</div>
</body>
</html>