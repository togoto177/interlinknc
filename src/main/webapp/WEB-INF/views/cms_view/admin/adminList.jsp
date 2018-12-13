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
<div class="cmsTop">
	<div class="cmsTopLogo">
		<img alt="인터링크앤씨 로고" src="resources/cms/logo_darkgray.png">
	</div>
	<div class="cmsTopText">
		<a>ㅇㅇㅇ님 환영합니다.</a>
		<a>비밀번호변경 | 로그아웃</a>
	</div>
</div>
<div class="cmsLeft">
	<ul>
		<li class="title">게시판관리</li>
		<li><a class="right">&rtrif;</a><a href="/portfoiloList"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info"> 내정보수정</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

<div class="portfolioBody">
	<div class="portTitle">
		<img alt="이미지" src="resources/mainImg/diagonal_download.png">
		<a>사원관리</a>
	</div>
	<div class="portSerch">
		<div class="infoText">
			<a>회원가입 대기</a><a class="color" href="#signUpList"> 0</a><a>명</a>
		</div>
	</div>
	<div class="portTable">
		<table class="adminList">
			<colgroup>
					<col style="width: 7%" />
					<col style="width: 7%" />
					<col style="width: 20%" />
					<col style="width: 10%" />
					<col style="width: 16%" />
					<col style="width: 25%" />
					<col style="width: 15%" />
			</colgroup>
			<tr class="portTh">
				<td>No</td>
				<td><input type="checkbox"></td>
				<td class="textLeft">직급</td>
				<td>작성자</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>입사일</td>
			</tr>
			<tr class="portTd">
				<td>9</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>8</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>7</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>6</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>5</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>4</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>3</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>2</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
			<tr class="portTd">
				<td>1</td>
				<td><input type="checkbox" class="check"><label class="label"></label></td>
				<td class="textLeft">사원</td>
				<td class="title"><a href="/contactUpdate">ㅇㅇㅇ</a></td>
				<td>02-2222-2222</td>
				<td>info@interlinknc.com</td>
				<td>2018.12.12</td>
			</tr>
		</table>
	</div>
	
	<div class="portCount">
		<ul>
		<li class="portCount1"><img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png"><img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"></li>
		<li class="focus">1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li class="portCount2"><img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"><img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png"></li>
		</ul>
		<div class="btnList">
			<div class="btnDiv1">
				<a class="btn1" href="/downloadsWrite" style="padding: 30 21;">DELETE</a>
			</div>
		</div>
	</div>
</div>

<a href="#x" class="overlay1" id="signUpList"></a>
<div class="popup1">
	<div class="popupCon1">
		<div class="title">
			<a>회원가입 대기자</a>
		</div>
		
		<div class="adminBox">
			<div class="listCon" style="margin-top: 35;">
				<div class="listCon1">
					<div class="listCon1_No">
						<a>3</a>
					</div>
					<div class="listCon1_Check">
						<input type="checkbox" />
					</div>
					<div class="listCon1_Text">
						<a>이름 : ㅇㅇㅇ , 아이디 : dkdlel</a>
					</div>
				</div>
			</div>
			<div class="listCon">
				<div class="listCon1">
					<div class="listCon1_No">
						<a>2</a>
					</div>
					<div class="listCon1_Check">
						<input type="checkbox" />
					</div>
					<div class="listCon1_Text">
						<a>이름 : ㅇㅇㅇ , 아이디 : dkdlel</a>
					</div>
				</div>
			</div>
			<div class="listCon">
				<div class="listCon1">
					<div class="listCon1_No">
						<a>1</a>
					</div>
					<div class="listCon1_Check">
						<input type="checkbox" />
					</div>
					<div class="listCon1_Text">
						<a>이름 : ㅇㅇㅇ , 아이디 : dkdlel</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="adminBtn">
			<div class="adminBtn1">
				<a class="adminBtn1_1">거절</a>
			</div>
			<div class="adminBtn1" style="float: right;">
				<a class="adminBtn1_2">승인</a>
			</div>
		</div>
	</div>
	
<a class="close1" href="#close"></a>
</div>
</body>
</html>