<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="cmsLeft">
<input type="hidden" value="${board_division}" id="board_division" />
<input type="hidden" value="${division}" id="division" />
	<ul class="leftbar_ul">
		<li class="title">게시판관리</li>
			<li id="li_02"><a class="right" id="portfolio">&rtrif;</a><a href="/interlinknc/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
			<li id="li_03"><a class="right" id="download">&rtrif;</a><a href="/interlinknc/downloadsList?board_division=download">  DOWNLOADS</a></li>
			<li id="li_04"><a class="right" id="contact">&rtrif;</a><a href="/interlinknc/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">기타</li>
			<li id="li_06"><a class="right" id="emailSend">&rtrif;</a><a href="/interlinknc/emailSend"> 메일보내기</a></li>
			<li id="li_07"><a class="right" id="smsSend">&rtrif;</a><a href="/interlinknc/smsSend.do"> 문자보내기</a></li>
		<li class="title">설정</li>
			<li id="li_09"><a class="right" id="info">&rtrif;</a><a href="/interlinknc/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
			<li id="li_10"><a class="right" id="admin">&rtrif;</a><a href="/interlinknc/adminList?division=admin"> 사원관리</a></li>
	</ul>
</div>