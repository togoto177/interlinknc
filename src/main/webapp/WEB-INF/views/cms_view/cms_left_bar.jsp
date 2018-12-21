<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="cmsLeft">
	<ul>
		<c:if test="${board_division == 'portfolio'}">
		<li class="title">게시판관리</li>		
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList?division=admin"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${board_division == 'download'}">
		<li class="title">게시판관리</li>		
		<li><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList?division=admin"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${board_division == 'contact'}">
		<li class="title">게시판관리</li>		
		<li><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList?division=admin"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${division == 'info'}">
		<li class="title">게시판관리</li>		
		<li><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList?division=admin"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${division == 'admin'}">
		<li class="title">게시판관리</li>		
		<li><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${division == 'password'}">
		<li class="title">게시판관리</li>		
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
		<li><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
		
		<c:if test="${division == 'email'}">
		<li class="title">게시판관리</li>		
		<li><a class="right">&rtrif;</a><a href="/portfolioList?board_division=portfolio"> PORTFOLIO</a></li>
		<li><a class="right">&rtrif;</a><a href="/downloadsList?board_division=download">  DOWNLOADS</a></li>
		<li><a class="right">&rtrif;</a><a href="/contactList?board_division=contact"> CONTACT</a></li>
		<li class="title">설정</li>
		<li><a class="right">&rtrif;</a><a href="/info?ad_seq=${ad_seq}"> 내정보수정</a></li>
		<li><a class="right">&rtrif;</a><a href="/adminList"> 사원관리</a></li>
		<li class="rightAc"><a class="right">&rtrif;</a><a href="/emailSend"> 메일보내기</a></li>
		</c:if>
	</ul>
</div>