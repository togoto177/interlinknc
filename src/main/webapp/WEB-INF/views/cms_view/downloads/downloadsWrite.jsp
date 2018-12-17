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
<%@ include file="../cms_header.jsp"%>
<%@ include file="../cms_left_bar.jsp"%>
<div class="portfolioBody">
	<div class="portTitle">
		<img alt="포트폴리오 이미지" src="resources/mainImg/diagonal_download.png">
		<a>DOWNLOADS</a>
	</div>
	
	<div class="portTitleView">
		<a>등록</a>
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
		<div class="btnDiv2">
			<a class="btn1" href="/downloadsList">CANCEL</a>
		</div>
	</div>
</div>
</body>
</html>