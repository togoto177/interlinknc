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
$(function(){
	$('.upload_text').val('미리보여줄 텍스트.');
	$('.input_file').change(function(){
		var i = $(this).val();
		$('.upload_text').val(i);
	});
});
</script>
</head>
<body>
<div class="cmsTop">
	<div class="cmsTopLogo">
		<img alt="인터링크앤씨 로고" src="resources/cms/logo_darkgray.png">
	</div>
	<div class="cmsTopText">
		<a class="cmsTopText1">ㅇㅇㅇ</a><a class="cmsTopText2">님 환영합니다.</a>
		<a class="cmsTopText3" href="/password">비밀번호변경</a><a class="cmsTopText4">|</a><a class="cmsTopText3">로그아웃</a>
	</div>
</div>
<div class="cmsLeft">
	<ul>
		<li class="title">게시판관리</li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/portfolioList"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>PORTFOLIO</a>
	</div>
	
	<div class="portTitleView">
		<a>등록</a>
	</div>
	<div class="portBox">
		<table>
			<colgroup>
				<col style="width: 15%" />
				<col style="width: 35%" />
				<col style="width: 15%" />
				<col style="width: 35%" />
			</colgroup>
			<tr>
				<td><select>
				  <option>구분</option>
				  <option value="saab">홈페이지</option>
				  <option value="opel">유지보수</option>
				  <option value="audi">등등</option>
				</select></td>
				<td colspan="3"><input class="titleText" type="text" placeholder="제목을 입력하세요." /></td>
			</tr>
			<tr>
				<td colspan="2"><label>사업기간</label><input type="text" /></td>
				<td rowspan="3" colspan="2" class="imgTd">
					<a>첨부이미지</a>
					<input type="text" class="upload_text" readonly="readonly">
					<div class="upload-btn_wrap">
					  <button type="button" title="파일선택하기">
					   <span>선택</span>  
					  </button>
					  <input type="file" class="input_file" title="파일찾기">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><label>발주처</label><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="2"><label>연결주소</label><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="4" class="textarea"><textarea rows="5" cols="5" placeholder="내용을 입력하세요."></textarea></td>
			</tr>
		</table>
	</div>
	<div class="btnbox">
		<div class="btnDiv1">
			<a class="btn1">SAVE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" href="/portfolioList">CANCEL</a>
		</div>
	</div>
</div>
</body>
</html>