<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="cmsTop">
	<div class="cmsTopLogo">
		<img alt="인터링크앤씨 로고" src="resources/cms/logo_darkgray.png">
	</div>
	<div class="cmsTopText">
		<a class="cmsTopText1">${sessionScope.ad_name}</a><a class="cmsTopText2"> 님 환영합니다.</a>
		<a class="cmsTopText3" id="sessionExit" style="cursor: pointer;">메인 홈페이지</a><a class="cmsTopText4">|</a>
		<script type="text/javascript">
		$('#sessionExit').click(function(){
			var con = confirm("메인 홈페이지로 이동시 관리자페이지는 로그아웃됩니다."+'\n'+"이동하시겠습니까?");
			if(con == true){
			alert("정상적으로 로그아웃 되었습니다.");
			<%
			response.setHeader("cache-control","no-store"); //뒤로가기시 이전페이지 유실시키기
			%>
			window.open('main_test', '_blank'); 
			location.href = "view_cms_main";
			}else{
			 return false;	
			}
		});
		</script>
		<a class="cmsTopText3" href="password">비밀번호변경</a><a class="cmsTopText4">|</a>
		<a class="cmsTopText3" style="cursor:pointer;" onclick="logout()">로그아웃</a>
	</div>
</div>