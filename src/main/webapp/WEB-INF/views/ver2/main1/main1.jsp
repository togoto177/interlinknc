<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="includever2.jsp"%>

<html>
<head>
<script src="js/board/board.js"></script>
<script type="text/javascript">

//주소창 파라메터 값 제거 - 박권수 2018-12-05
/* history.replaceState({}, null, location.pathname);  */

$(document).ready(function() {
	imgMove();
	
	//customer 전송 - 박권수 2018-12-05
	$("#save").click(function(){

				 $("#board_form").submit(); 
		
	});
});
</script>
	<title>interlinknc</title>
</head>
<body class="main_body">
	<div class="mainImg">
		<div class="mainImg_con">
		<img alt="background" src="resources/main3back.jpg">
		</div>
	</div>
	<div class="exlink"><a href="/main1">1번</a><a href="/main2">2번</a><a href="/main3">3번</a><a href="/main4">4번</a></div>
	<div class="about" id="about">
		<br />
		<h1>about</h1>
		<div class="about1">
			<div class="about1_box">
				<div class="about1_center">
				<a class="about1_box_title">소프트웨어 개발 및 공급</a><br />
				</div>
				<br />
				<a>&raquo;웹 기반의 솔류션 및 업무용 패키지 개발</a><br />
				<a>&raquo;포털 홈페이지 개발</a><br />
				<a>&raquo;그룹웨어 및 전자상거래 구축</a><br />
				<a>&raquo;컴포넌트, 통신 소프트웨어 개발</a><br />
				<a>&raquo;응용프로그램 개발 및 유지보수</a><br />
				<a>&raquo;기술연구</a>
			</div>
		</div>
		<div class="about2">
				<a>(주)인터링크앤씨는 다년간 정부 중앙부처 및 산하기관의 시스템 구축과 운영 경험을 바탕으로<br />
				습득한 노하우를 전산시스템 구축을 필요로 하는 기관 및 기업에 적용할 수 있도록 시스템 구축 컨설팅과<br />
				시스템 개발을 통하여 시스템 구축시 발생할 수 있는 문제점을 최소화 할 수 있는 시스템을 적용하고 있습니다.<br />
				현재 소프트웨어 개발 및 공급과, 포털 홈페이지 구축 운영, 해양어촌광광(상품개발)<br />
				컨설팅 프로젝트를 진행하고 있습니다.<br />
				향후 인터링크앤씨는 더욱 분야를 확대하여, 최고의 컨설팅으로 최고의 소프트웨어를 제공하는<br />
				기업으로 확대하여 나갈 예정입니다.<br />
				웹 기반의 비즈니스 솔루션 공급 사업으로 서비스 체계를 갖춘 기업으로 도약할 것입니다.<br />
				또한 저희 기업은 인터넷 및 전산시스템과 관련한 블루오션을 찾아 항상 생각하고 창출하여<br />
				사용자들이 원하는 소프트웨어 개발에 주력하고자 합니다.<br />
				</a>
		</div>
		<div class="about3">
			<br>
			<h1>history</h1>
			<div class="historyImg">
				<img alt="이미지" src="resources/history.png" style="width: 50%;">
			</div>
		</div>
		<br />
	</div>
	
	<div class="portfolio" id="portfolio">
	<br />
		<h1>PORTFOLIO</h1>
		<div class="portfolioImg">
			<div class="portfolioImgAdd">
				<a href="#"><img alt="" src="resources/portfolio/1.png"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/2.jpg"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/3.png"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/4.png"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/5.jpg"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/6.jpg"></a>  
			    <a href="#"><img alt="" src="resources/portfolio/7.jpg"></a>
			</div>
		</div>
		<a id="stop">일시정지</a>
		<br />
	</div>
	
	<div class="downloads" id="downloads">
	<br />
	<h1>Downloads</h1>
		<div class="downloadsTable">
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
					<th>No</th>
					<th>제목</th>
					<th>일자</th>
					<th>다운로드</th>
					<th>조회수</th>
				</tr>
				
				<!-- 다운로드 view 뿌리기위해 테스트중 2018-12-05 박권수 -->
				<c:forEach var="board_list" items="${board_list}"  varStatus="status">
				<tr>
					<td><!--역순공식: 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) -->
                           <c:set var="startpage" value="${startPage-1}" />
                           <c:set var="statuscount" value="${status.count }" />
                           ${totalCnt+1-(startpage*10+statuscount)} </td>
					<td>${board_list.board_title}</td>
					<td>${board_list.board_registerdate}</td>
					<td>
					<%-- <a href="#" style="cursor: pointer;" onclick="downFile('${file_list.file_name2}');"
					title="첨부파일 다운로드" download>
					<img alt="" src="resources/mainImg/downloadImg.png"></a> --%>
					
					<c:set var="boardlist" value="${board_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(board_list.file_sub_name,'|')}" />
						<c:if test="${board_list.file_cnt == 0}">
						X
						</c:if>
						<c:if test="${board_list.file_cnt == 1}">
						<c:forEach items="${split_file}" var="boardlist">
						<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${board_list.board_seq}');">
						<!-- <img alt="" src="resources/mainImg/downloadImg.png"> -->다운
						</button>									
						</c:forEach>
						</c:if>
						<c:if test="${board_list.file_cnt >= 2}">
						<button type="button" id="hidden_over" name="hidden_over" onclick="over('${board_list.board_seq}');" >열기</button>		
						</c:if>
					
					</td>
					<td>${board_list.board_hit}</td>
				</tr>
				<tr id = "hidden${board_list.board_seq}" style="display: none;">
						<td align="center" colspan="7">			
							<c:forEach items="${split_file}" var="boardlist">
							<button type="button" class="btn btn-primary" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}');">
							<c:set var="TextValue" value="${boardlist}"/>${fn:substringAfter(TextValue,'_') }									
							</button>
							<br/>
							</c:forEach>
						</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
		<br />
	</div>
	
	<div class="customer" id="customer">
	<br />
	<h1>Customer</h1>
		<div class="customerCon">
			<form id="board_form" name="board_form" method="post" action="cms_board_insert_action" enctype="multipart/form-data">
			<input type="hidden" id="board_division" name="board_division" value="customer"/>
			<table>			
				<colgroup>
					<col style="width: 45%" />
					<col style="width: 55%" />
				</colgroup>
				<tr>
					<td rowspan="6"><img alt="네이버 지도" src="resources/mainImg/nav.jpg"></td>
					<td><label>작성자</label><input type="text" id="user_id" name="user_id" /></td>
				</tr>
				<tr>
					<td><label>이메일</label><input type="text" id="user_email" name="user_email"/></td>
				</tr>
				<tr>
					<td><label>연락처</label><input type="text" id="user_contact" name="user_contact"/></td>
				</tr>
				<tr>
					<td><label>제목</label><input type="text" id="board_title" name="board_title"/> </td>
				</tr>
				<tr>
					<td><label>문의내용</label><textarea id="board_contetnt" name="board_content"></textarea> </td>
				</tr>
				<tr>
					<td class="send_bt"><a id="save">Send</a></td>
				</tr>
			</table>
			</form>
		</div>
	<br />
	</div>
	<%@ include file="../front/footer.jsp"%>
</body>
</html>
