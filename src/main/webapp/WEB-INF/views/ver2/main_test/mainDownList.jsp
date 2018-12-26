<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
		<hr id="Context" style="display: none">
		<input type="hidden" id="startPageList" name="startPageList" value="${startPage}">
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
					<td style="height: 36px;">
					<c:set var="boardlist" value="${download_list.file_sub_name}" />
					<c:set var="split_file" value="${fn:split(download_list.file_sub_name,'|')}" />
					<c:choose>
					<c:when test="${download_list.file_cnt == 0}"><!-- 파일이 없을때 -->
					</c:when>
					<c:when test="${download_list.file_cnt == 1}"><!-- 파일이 1개일대 -->
						<c:forEach items="${split_file}" var="boardlist">
						<a onclick="downFile('${boardlist}', '${download_list.board_seq}');">
						<img alt="" src="resources/mainImg/download_arrow_white.png">
						</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);" class="openMask" id="${download_list.board_seq}">
						<img alt="" src="resources/mainImg/download_arrow_white.png">
						</a>
					</c:otherwise>
					</c:choose>
					
					</td>
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
					
					<c:if test="${download_list.file_cnt == 0}"><!-- 파일이 없을때 -->
					</c:if>
					<c:if test="${download_list.file_cnt != 0}">
						<!-- <a class="windowConBut">DOWNLOAD&darr;</a> -->													
						<c:set var="split_file" value="${fn:split(download_list.file_sub_name,'|')}" />
						<c:forEach items="${split_file}" var="boardlist">
						<a href="javascript:void(0);" class="windowConBut" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${download_list.board_seq}');">
						<c:set var="oriName" value="${fn:substringAfter(boardlist, '_')}" />
						${fn:substringBefore(oriName, '*')} &darr;
						
						</a>									
						</c:forEach>
					</c:if>
					</div>
					
					
				</div>
			</div>
			</c:forEach>
			</table>