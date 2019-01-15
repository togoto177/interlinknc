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
	<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
	<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
	<form name="admin_form"  method="get">
	<input type="hidden" id="division" name="division" value="${division}">
	<input type="hidden" id="startPage" name="startPage" value="">
	<input type="hidden" id="visiblePages" name="visiblePages" value="">
	<div class="portSerch">
		<div class="infoText">
			<a>회원가입 대기</a><a class="color" href="#signUpList" id="test"> ${waitCnt}</a><a>명</a>
			<c:if test="${fn:length(wait_list) == 0}">
			<script>
			$("#test").click(function() {	
			alert('대기중인 회원가입이 없습니다.');
			return false;
			});
			</script>
			</c:if>
		</div>
	</div>
	<div class="portTable">
		<table class="adminList">
			<colgroup>
					<col style="width: 7%" />
					<col style="width: 7%" />
					<col style="width: 10%" />
					<col style="width: 10%" />
					<col style="width: 16%" />
					<col style="width: 31%" />
					<col style="width: 19%" />
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
			<c:if test="${fn:length(employee_list) == 0}">
			<tr class="portTd">
			<td colspan="7">
			조회 결과가 없습니다.
			</td>
			</tr>
			</c:if>
			<c:if test="${fn:length(employee_list) != 0}">
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
				<td class="title"><a href="/interlinknc/adminUpdate?ad_seq=${list.ad_seq}">${list.ad_name}</a></td>
				<td>${list.ad_contact}</td>
				<td>${list.ad_email}</td>
				<td>${list.ad_hiredate}</td>
			</tr>
			</c:if>
			</c:forEach>
			</c:if>
		</table>
	</div>
	
	
	<div class="portCount">
	<c:if test="${fn:length(employee_list) != 0}">
		<ul id="paging">
		</ul>
		</c:if>
		<c:if test="${fn:length(employee_list) == 0}">
		<ul>
		<li>0</li>
		</ul>
		</c:if>
	
		<div class="btnList">
			<div class="btnDiv1">
				<a class="btn1" onclick="adminDeleteSubmit()" style="padding: 30 21; cursor: pointer;">DELETE</a>
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
				<a class="adminBtn1_1" onclick="waitDelete()" style="cursor:pointer;">거절</a>
			</div>
			<div class="adminBtn1" style="float: right;">
				<a class="adminBtn1_2" onclick="waitSubmit()" style="cursor:pointer;">승인</a>
			</div>
		</div>
	</div>
	
<a class="close1" href="#close"></a>
</div>
</body>
</html>