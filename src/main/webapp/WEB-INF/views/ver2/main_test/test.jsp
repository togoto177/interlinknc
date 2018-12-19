<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
		<hr class="downloads_border-top" id="Context">
			<table>
				<colgroup>
					<col style="width: 25%" />
					<col style="width: 5%" />
					<col style="width: 20%" />
					<col style="width: 9%" />
					<col style="width: 9%" />
					<col style="width: 7%" />
					<col style="width: 25%" />
				</colgroup>
				<tr class="tabletH">
					<td style="color:rgba(0, 0, 0, 0); border-bottom: none;">-</td>
					<td>no</td>
					<td>제목</td>
					<td>날짜</td>
					<td>download</td>
					<td>조회수</td>
					<td style="color:rgba(0, 0, 0, 0); border-bottom: none;">-</td>
				</tr>
				<c:forEach var="download_list" items="${download_list}"  varStatus="status">
				<tr class="tabletD">
					
					<td>
					<%-- <input type="hidden" id="board_seq" name="board_seq" value="${download_list.board_seq}"> --%>
					</td>
					<td>
					<c:set var="startpage" value="${startPage-1}" />
                    <c:set var="statuscount" value="${status.count }" />
                    ${totalCnt+1-(startpage*10+statuscount)} 
                    </td>
					<td class="title"><a href="javascript:void(0);" class="openMask" id="${download_list.board_seq}">${download_list.board_title}</a></td>
					<td>${download_list.board_registerdate}</td>
					<td><img alt="" src="resources/mainImg/download_arrow_white.png"> </td>
					<td>${download_list.board_hit}</td>
					<td></td>
				</tr>
			
			<!-- 모달창 -->
			<!-- 뒷배경 -->
			<div id="mask"></div>
			<!-- 모달 view -->
			<div class="window" id="${download_list.board_seq}">
				<div class="close_div"><a class="close">X</a></div>
				<div class="windowCon">
					<div class="windowCon1">
						<a class="windowConNo">${totalCnt+1-(startpage*10+statuscount)}</a>&ensp;<a class="windowConDay">
						<fmt:formatDate value="${download_list.board_registerdate}" pattern="yyyy.MM.dd"/> 
						/ ${download_list.board_hit} views</a><br />
						<a class="windowConTitle">${download_list.board_title}</a>
					</div>
					<div class="windowCon2">
						<a>${download_list.board_content}</a>
					</div>
					<div class="windowCon3">
						<a class="windowConBut">DOWNLOAD&darr;</a>
					</div>
				</div>
			</div>
			</c:forEach>
			</table>