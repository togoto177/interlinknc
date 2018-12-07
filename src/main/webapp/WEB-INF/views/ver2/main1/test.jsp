<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<hr class="downloadsTable" id="Context">
		<input type="hidden" id="board_division" name="board_division" value="${board_division}" />
			<table>
				<colgroup>
					<col style="width: 10%" />
					<col style="width: 40%" />
					<col style="width: 20%" />
					<col style="width: 15%" />
					<col style="width: 15%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>일자</th>
					<th>다운로드</th>
					<th>조회수</th>
				</tr>
				
				<!-- 다운로드 view 뿌리기위해 테스트중 2018-12-05 박권수 -->
				<c:forEach var="download_list" items="${download_list}"  varStatus="status">
				<tr>
					<td><!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
							<input type="hidden" id="board_seq" name="board_seq" value="${download_list.board_seq}">
							<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
							<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
							<input type="hidden" id="wow" name="wow" value="${wow}">
                           <c:set var="startpage" value="${startPage-1}" />
                           <c:set var="statuscount" value="${status.count }" />
                           ${totalCnt+1-(startpage*10+statuscount)} </td>
					<td><a href="javascript:void(0);" class="openMask" id="${download_list.board_seq}">${download_list.board_title}</a></td>
					<td>${download_list.board_registerdate}</td>
					<td>
					<c:set var="boardlist" value="${download_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(download_list.file_sub_name,'|')}" />
						<c:if test="${download_list.file_cnt == 0}">
						</c:if>
						<c:if test="${download_list.file_cnt == 1}">
						<c:forEach items="${split_file}" var="boardlist">
						<a href="javascript:void(0);" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${download_list.board_seq}');">
						<img alt="" src="resources/mainImg/downloadImg.png">
						</a>									
						</c:forEach>
						</c:if>
						<c:if test="${download_list.file_cnt >= 2}">
						<a href="javascript:void(0);" class="openMask" id="${download_list.board_seq}"><img alt="" src="resources/mainImg/downloadImg.png"></a>		
						</c:if>
					
					</td>
					<td>${download_list.board_hit}</td>
				</tr>
				<tr id = "hidden${download_list.board_seq}" style="display: none;">
						<td align="center" colspan="7">			
							<c:forEach items="${split_file}" var="boardlist">
							<a href="javascript:void(0);" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}');">
							<c:set var="TextValue" value="${boardlist}"/>${fn:substringAfter(TextValue,'_') }
							<img alt="" src="resources/mainImg/downloadImg.png">									
							</a>
							<br/>
							</c:forEach>
						</td>
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
						<a class="windowConTitle"></a>
						${download_list.board_title}
					</div>
					<div class="windowCon2">
						<a>${download_list.board_content}</a>
					</div>
					<div class="windowCon3">
						<c:forEach items="${split_file}" var="boardlist">
						<a href="javascript:void(0);" class="windowConBut" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${download_list.board_seq}');">
						DOWNLOAD &darr;
						</a>									
						</c:forEach>
						<!-- <a class="windowConBut">DOWNLOAD &darr;</a> -->
					</div>
				</div>
			</div>
				</c:forEach>

				<!-- 다운로드 view 뿌리기위해 테스트중 2018-12-05 박권수 -->
				
			</table>
