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
			           document.board_form.action='board_delete';
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
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>CONTACT</a>
	</div>
	<form name="board_form"  method="get">
	<input type="hidden" id="board_division" name="board_division" value="${board_division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
		<input type="text" class="searchForm" id="sch_value" name="sch_value" value="${sch_value}" /><img alt="돋보기" src="resources/cms/search.png" id="searchBtn">
		<input type="hidden" value="board_title" name="sch_type" />
	</div>
	<div class="portTable">
		<table>
			<colgroup>
					<col style="width: 7%" />
					<col style="width: 7%" />
					<col style="width: 41%" />
					<col style="width: 13%" />
					<col style="width: 17%" />
					<col style="width: 15%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td><input type="checkbox" id="product_check_all" /></td>
				<td>제목</td>
				<td>작성자</td>
				<td>일자</td>
				<td>상태</td>
			</tr>
			<c:forEach var="board_list" items="${board_list}"  varStatus="status">
			<tr class="portTd">
			<td>
                <!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                <c:set var="startpage" value="${startPage-1}" />
                <c:set var="statuscount" value="${status.count }" />
                ${totalCnt+1-(startpage*10+statuscount)} 
                                 
            </td>
            <td><input type="checkbox" id="checkOne" name="board_seq" class="check" value="${board_list.board_seq}" /><label class="label"></label></td>
			<td class="title"><a id="title" onclick="location.href='contactUpdate?board_division=${board_division}&board_seq=${board_list.board_seq}'">${board_list.board_title}</a></td>
			<td>${board_list.user_id}</td>
			<td>${board_list.board_registerdate}</td>
				<c:if test="${board_list.status == '0'}">
					<td>미확인</td>
				</c:if>
				<c:if test="${board_list.status == '1'}">
					<td>확인</td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
	</div>
	</form>
	<div class="portCount">
		<ul>
		<li class="portCount1">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/contactList?board_division=contact&startPage=1&visiblePages=10';">
		<c:if test="${startPage != '1' }">
		<img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/contactList?board_division=contact&startPage=${startPage-1}&visiblePages=10';">
		</c:if>
		</li>
		<li id="pagination"></li>
		<li class="portCount2">
		<c:if test="${totalPage != '1' && totalPage != startPage}">
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow1.png" onclick="location.href='/contactList?board_division=contact&startPage=${startPage+1}&visiblePages=10';">
		</c:if>
		<img alt="오른쪽" src="resources/mainImg/download_board_arrow2.png" onclick="location.href='/contactList?board_division=contact&startPage=${totalPage}&visiblePages=10';">
		</li>
		</ul>
		<div class="btnList">
			<div class="btnDiv1">
				<a class="btn1" onclick="detailSubmit()" style="padding: 30 21;">DELETE</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>