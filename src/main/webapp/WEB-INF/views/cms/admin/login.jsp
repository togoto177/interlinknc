<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../cms_include.jsp"%>
<html>
<head>
	<title>interlinknc</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#login_btn").click(function(){
				login();
			});
 			$("#signUp_btn").click(function(){
				signUpFun();
			});
			$("#userIdCheck_btn").click(function(){
				userIdCheck();
			});
 			$("#ad_password").on('change keyup paste', function () {
 				var password = $("#ad_password").val();
				var password2 = $("#ad_password2").val();
				if(password != password2){
					$("#ps_check").text("*비밀번호가 일치하지 않습니다.");
				}else{
					$("#ps_check").text("");
				}
 			});
 			$("#ad_password2").on('change keyup paste', function () {
 				var password = $("#ad_password").val();
				var password2 = $("#ad_password2").val();
				if(password != password2){
					$("#ps_check").text("*비밀번호가 일치하지 않습니다.");
				}else{
					$("#ps_check").text("");
				}
 			});
 			$("#ad_id").on('change keyup paste', function () {
 				$("#idchek_hidden").val("0");
 			});
 			if ($("#result").val() == 'fail') {
				alert("아이디와 비밀번호를 확인해주세요.");
			}else if($("#result").val() == 'fail_auth'){
				alert("관리자의 승인이 되지 않았습니다.");
			}
				
		});
	</script>
</head>
<body class="login_body">
<div class="login_div">
	<div class="login_logo">
		<img alt="로고" src="/resources/mainImg/logo.png" />
	</div>
	<div class="login_table">
		<form id="login_form">
			<input type="hidden" id="result" name="result" value="${result}" />
			<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="user_id" name="ad_id"></td>
				<td rowspan="2"><a id="login_btn">login</a></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="user_pwd" name="ad_password"></td>
			</tr>
			</table>
		</form>
		<div class="atec">
		<a href="#signUp">가입하기</a>
		</div>
		
		<!-- 로그인 모달 창 -->
		<a href="#x" class="overlay" id="signUp"></a>
		<div class="popup">
			<div class="popup_menu">
				<div class="title">
			    	<h2>회원가입</h2>
			    </div>
		    	<div class="table">
		    	<form id="sign_form">
		    		<table>
			    		<caption>회원가입</caption>
						<colgroup>
							<col style="width:30%" />
							<col style="width:70%" />
						</colgroup>
		    			<tr>
		    				<th>아이디<input type="hidden" value="0" id="idchek_hidden"></th>
		    				<td><input type="text" id="ad_id" name="ad_id"><a id="userIdCheck_btn"> 중복확인</a></td>
		    			</tr>
		    			<tr>
		    				<th>비밀번호</th>
		    				<td><input type="password" id="ad_password" name="ad_password"></td>
		    			</tr>
		    			<tr style="padding:0;">
		    				<th style="padding:0;"></th>
		    				<td style="padding:0;"><a style="color:red; font-size: 6;" id="ps_check"></a></td>
		    			</tr>
		    			<tr>
		    				<th>비밀번호 확인</th>
		    				<td><input type="password" id="ad_password2"></td>
		    			</tr>
		    			<tr>
		    				<th>이름</th>
		    				<td><input type="text" id="ad_name" name="ad_name"></td>
		    			</tr>
		    			<tr>
		    				<th>전화번호</th>
		    				<td><input type="text" id="ad_contact" name="ad_contact"></td>
		    			</tr>
		    			<tr>
		    				<th>이메일</th>
		    				<td><input type="text" id="ad_email" name="ad_email"></td>
		    			</tr>
		    		</table>
		    	</form>
		    		<div class="atec">
		    		<a>*가입 후 관리자가 승인해야 로그인이 가능합니다.</a><br />
		    		<a id="signUp_btn">가입하기</a>
		    		</div>
		    	</div>
			</div>
		    <a class="close" href="#close"></a>
		</div>
	</div>
</div>
</body>
</html>