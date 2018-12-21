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
										 $('input:checkbox[name="chk"]').click(function(){
										   				var index = $('input:checkbox[name="chk"]').index(this);
										        if($('input:checkbox[name="chk"]').is(":checked") == true){
										   				$('#ad_rank'+index).removeAttr('disabled');
										   				$('#datepicker'+index).removeAttr('disabled');
										   				$('#datepicker'+index).attr('readonly', true);
										        }else{
										        		$('#ad_rank'+index).attr('disabled', 'true');
										        		$('#datepicker'+index).attr('disabled', 'true');
										        		$('#datepicker'+index).val('');
										        		$('#datepicker'+index).attr('readonly', false);

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
								           document.admin_form.action='admin_delete';
												alert("삭제 되었습니다.");
								          } else{
								            alert("삭제하실 목록을 체크하여 주십시오.")
								            return;
								             }
										}else{
											alert("취소 되었습니다.");
											return;
										}	
							    document.admin_form.submit();
							  };
							  
							  function waitDelete() {
							    	//체크박스 선택에 따른 삭제 유무
							    	$("#ad_rank").remove();
									if(confirm("회원가입을 거절 하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked") == true)  {
								           document.wait_form.action='wait_delete';
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
									if(confirm("해당 대기자들을 승인하시겠습니까?") == true) {
										if($('input:checkbox[id="checkOne"]').is(":checked")){
											var index = $('input:checkbox[name="chk"]').index(this);
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
							  
							  $(function() {

								  $('input:text[name="ad_hiredate"]').datepicker({
								    dateFormat: 'yy년 mm월 dd일'
								  });
								});
							
	</script>
</head>
<body>
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>사원관리</a>
	</div>
	<form name="admin_form"  method="get">
	<input type="hidden" id="division" name="division" value="${division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
		<div class="infoText">
			<a>회원가입 대기</a><a class="color" href="#signUpList"> ${waitCnt}</a><a>명</a>
		</div>
	</div>
	<div class="portTable">
		<table class="adminList">
			<colgroup>
					<col style="width: 7%" />
					<col style="width: 7%" />
					<col style="width: 10%" />
					<col style="width: 20%" />
					<col style="width: 16%" />
					<col style="width: 25%" />
					<col style="width: 15%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td><input type="checkbox" id="product_check_all" /></td>
				<td class="textLeft">직급</td>
				<td>작성자</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>입사일</td>
			</tr>
			<c:forEach var="list" items="${employee_list}"  varStatus="status">
			<c:if test="${list.ad_id != 'interlink_admin'}">
			<tr class="portTd">
				<td>
				<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                ${totalCnt+1-1-(startpage*10+statuscount)} 
				</td>
				<td><input type="checkbox" class="check" id="checkOne" name="ad_seq" value="${list.ad_seq}" /><label class="label"></label></td>
				<td class="textLeft">${list.ad_rank}</td>
				<td class="title"><a href="/adminUpdate?ad_seq=${list.ad_seq}">${list.ad_name}</a></td>
				<td>${list.ad_contact}</td>
				<td>${list.ad_email}</td>
				<td>${list.ad_hiredate}</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
	
	
	<div class="portCount">
		<ul>
		<li class="portCount1">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/adminList?startPage=1&visiblePages=10';">
		<c:if test="${startPage != '1' }">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/adminList?startPage=${startPage-1}&visiblePages=10';">
		</c:if>
		</li>
		<li id="pagination"></li>
		<li class="portCount2">
		<c:if test="${totalPage != '1' && totalPage != startPage}">
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/adminList?startPage=${startPage+1}&visiblePages=10';">
		</c:if>
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/adminList?startPage=${totalPage}&visiblePages=10';">
		</li>
		</ul>
		<div class="btnList">
			<div class="btnDiv1">
				<a class="btn1" onclick="detailSubmit()" style="padding: 30 21;">DELETE</a>
			</div>
		</div>
	</div>
	</form>
</div>

<a href="#x" class="overlay1" id="signUpList"></a>
<div class="popup1">
	<div class="popupCon1">
		<div class="title">
			<a>회원가입 대기자</a>
		</div>
		<form name="wait_form"  method="get">
		<div class="adminBox">
			<c:forEach var="wait_list" items="${wait_list}"  varStatus="status">
			<div class="listCon" style="margin-top: 35;">
				<div class="listCon1">
					<div class="listCon1_No">
						<a>
						<!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
				        <c:set var="startpage" value="${startPage-1}" />
				        <c:set var="statuscount" value="${status.count }" />
					    ${totalCnt+1-1-(startpage*10+statuscount)} 
					    </a>
					</div>
					<div class="listCon1_Check">
						<input type="checkbox" id="checkOne" name="chk" value="${wait_list.ad_seq}" />
					</div>
					<div class="listCon1_Text">
						<a>이름 : ${wait_list.ad_name} , 아이디 : ${wait_list.ad_id}</a>
					</div>
					<div class="listCon1_Select">
						<select disabled="disabled" name="ad_rank" id="ad_rank${status.index}" >
							<option selected>직급</option>
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
					</div>
					<div class="listCon1_Date">
						<label>입사일</label><input type="text" name="ad_hiredate" disabled="disabled" id="datepicker${status.index}" />
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</form>
		<div class="adminBtn">
			<div class="adminBtn1">
				<a class="adminBtn1_1" onclick="waitDelete()">거절</a>
			</div>
			<div class="adminBtn1" style="float: right;">
				<a class="adminBtn1_2" onclick="waitSubmit()">승인</a>
			</div>
		</div>
	</div>
	
<a class="close1" href="#close"></a>
</div>
</body>
</html>