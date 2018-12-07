<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="header">
	<div class="header_img">
		<img alt="로고" onclick="javascript:location.href='/cms_main';" src="/resources/mainImg/logo.png" />
	</div>
	<div class="header_text">
		<a>${sessionScope.ad_id}님 환영합니다.</a><a href="#">[비밀번호 변경]</a><a>[로그아웃]</a>
	</div>
</div>