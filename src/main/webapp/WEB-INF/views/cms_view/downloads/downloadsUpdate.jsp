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
		<a>ㅇㅇㅇ님 환영합니다.</a>
		<a>비밀번호변경 | 로그아웃</a>
	</div>
</div>
<div class="cmsLeft">
	<ul>
		<li class="title">게시판관리</li>
		<li><a class="right">&rtrif;</a><a href="/portfoiloList"> PORTFOLIO</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/downloadsList">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
	</ul>
</div>

<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	
	<div class="portTitleView">
		<a>수정</a>
	</div>
	<div class="portBox">
		<table>
			<tr>
				<td class="oneTitle"><input type="text" placeholder="제목을 입력하세요." /></td>
			</tr>
			<tr>
				<td class="down">
					<div class="downFile">
						<label>첨부파일</label>
							<div class="downFileBox">
								<div class="upload-btn_wrap">
								  <input type="file" class="input_file" title="파일찾기">
								  <button type="button" title="파일선택하기">
								   <span>선택</span>
								  </button>
								</div>
								<input type="text" class="upload_text" readonly="readonly">
							</div>
							<div class="downFileBox">
								<div class="upload-btn_wrap">
								  <input type="file" class="input_file" title="파일찾기">
								  <button type="button" title="파일선택하기">
								   <span>선택</span>
								  </button>
								</div>
								<input type="text" class="upload_text" readonly="readonly">
							</div>
							<div class="downFileBox">
								<div class="upload-btn_wrap">
								  <input type="file" class="input_file" title="파일찾기">
								  <button type="button" title="파일선택하기">
								   <span>선택</span>
								  </button>
								</div>
								<input type="text" class="upload_text" readonly="readonly">
							</div>
						
					</div>
				</td>
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
		<div class="btnDiv3">
			<a class="btn1">REMOVE</a>
		</div>
		<div class="btnDiv2">
			<a class="btn1" style="padding: 30 29;">LIST</a>
		</div>
	</div>
</div>
</body>
</html>