<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC>
<html>
<%@ include file="includever2.jsp"%>
<head>
	<%
       session.invalidate(); // 모든세션정보 삭제
   	%>
<script type="text/javascript">
$(document).ready(function() {

 	
	
    //이전 버튼을 클릭하면 이전 슬라이드로 전환
	  $( '#prevBtn' ).on( 'click', function () {
	   mySlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
	   return false;              //<a>에 링크 차단
	  } );

	    //다음 버튼을 클릭하면 다음 슬라이드로 전환
	  $( '#nextBtn' ).on( 'click', function () {
	   mySlider.goToNextSlide();  //다음 슬라이드 배너로 이동
	   return false;
	  } );
	    
	  $("#down_title").on("click", function(){
		  modal();
	  });

});
		
		//contact 등록 버튼 활성화
	    function save(){ 
		    var insertData = $('[name=contact_form]').serialize(); //contact_form의 내용을 가져옴
		    writeInsert(insertData); //Insert 함수호출(아래)
		}

		//contact 등록
		function writeInsert(insertData){
			var str_space = /\s/;
			if($("#user_id").val() == '' || $("#user_id").val() == null || str_space.exec($("#user_id").val()) ){
			    alert("작성자를 입력해주세요.");
			    $("#user_id").focus();
			    $("#user_id").val('');
			    return false;
			}
			if($("#user_email").val() == '' || $("#user_email").val() == null || str_space.exec($("#user_email").val())){
			    alert("이메일을 입력해주세요.");
			    $("#user_email").focus();
			    $("#user_email").val('');
			    return false;
			}
			if($("#user_contact").val() == '' || $("#user_contact").val() == null || str_space.exec($("#user_contact").val())){
			    alert("연락처를 입력해주세요.");
			    $("#user_contact").focus();
			    return false;
			}
			if($("#board_title").val() == '' || $("#board_title").val() == null){
			    alert("제목을 입력해주세요.");
			    $("#board_title").focus();
			    return false;
			}
			if($("#board_content").val() == '' || $("#board_content").val() == null){
			    alert("문의내용을 입력해주세요.");
			    $("#board_content").focus();
			    return false;
			}
			
		    $.ajax({
		        url : 'mainContactAction',
		        type : 'post',
		        data : insertData,
		        success : function(data){
				alert("문의사항 접수가 완료 되었습니다.");
				$('#user_id').val('');
				$('#user_email').val('');
				$('#user_contact').val('');
				$('#board_title').val('');
				$('#board_content').val('');
		        }
		    });
		}
	</script>
	<title>interlinknc</title>
</head>
<body class="main_body">
	<div class="mainImg">
		<div class="mainImgEx1">
		<img alt="별이미지1" src="resources/mainImg/mainbg_violet_particle.png">
		</div>
		<div class="mainImgEx2">
		<img alt="별이미지2" src="resources/mainImg/mainbg_green_particle.png">
		</div>
		<div class="mainImgEx3">
		<img alt="별이미지3" src="resources/mainImg/mainbg_white_particle.png">
		</div>
		
		<div class="mainImg_con2">
		<a class="con1"><img alt="main 사선 이미지" src="resources/mainImg/diagonal_main.png"></a><br />
		<img class="logo_Img" alt="logo" src="resources/mainImg/white_logo.png"><br />
		<a class="en">WE</a><a class="en2">ARE</a><a class="en3">INTERLINK&amp;C</a><br />
		<a class="ko">솔루션 네트워킹으로 정보화를 이끄는 기업</a><br />
		<a class="con2"><img alt="main 사선 이미지" src="resources/mainImg/diagonal_portfolio.png"></a>
		
		<div class="whatwedo">
			<a class="whatwedoA">WHAT WE DO</a>
		</div>
		<hr class="border-top">
			<div class="mainImg_con3">
				<div class="text1">
					<a>소프트웨어 개발 및 공급</a>
				</div>
				<div class="text2">
					<ul>
						<li><a>Web기반의 솔루션 및 업무용 패키지 개발</a></li>
						<li><a>포털 홈페이지 개발</a></li>
						<li><a>그룹웨어 및 전자상거래 구축</a></li>
						<li><a>컴포넌트, 통신 소프트웨어 개발</a></li>
						<li><a>응용프로그램 개발 및 유지보수</a></li>
						<li><a>기술 연구</a></li>
					</ul>
				</div>
			</div>
		<hr class="border-bottom">
		</div>
		
		<div class="scroll">
			<a href="#about" class="about_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
		</div>
	</div>
	<div class="home_icon"><img alt="맨위로 가기" src="resources/mainImg/home.png"></div>
	<div class="about" id="about">
	
		<div class="about_inter">
			<img alt="뒷배경 이미지" src="resources/mainImg/about_interlinkandc.png">
		</div>
		
		<div class="about_title">
		<a class="about_titleA"><img alt="about us 이미지" src="resources/mainImg/diagonal_about.png"><br />ABOUT</a><a class="about_titleA2">US</a>
		</div>
		
		<div class="about2">
				<a class="about2A">(주)인터링크앤씨는 다년간 정부 중앙부처 및 산하기관의 시스템을 구축하고 운영해 온<br />
				다년간의 경험이 있습니다. 이를 바탕으로 습득한 노하우를<br />
				전산시스템 구축이 필요한 고객사인 공공기관&#180;기업에 적용하여<br />
				업무상 발생가능한 문제점을 최소화하고 니즈를 충족시키는<br />
				고객 맞춤형 토털솔루션을 제공합니다.<br />
				&#150;<br />
				(주)인터링크앤씨는 활동분야를 확대하여,<br />
				웹 기반의 비즈니스 솔루션 제공 서비스에 지향점을 두고 있습니다.<br />
				최고의 컨설팅과 양질의 소프트웨어를 제공하는 업계 선도기업으로 도약하려 합니다.<br />
				나아가 인터넷 및 전산시스템과 관련한 블루오션을 모색하여<br />
				사용자들의 잠재적 니즈를 충족시키고 새로운 가치를 창충하는<br />
				참신한 소프트웨어 개발에 주력하겠습니다.</a>
		</div>

		<div class="about_history">
			<img alt="history 뒷배경 이미지" src="resources/mainImg/about_history.png">
		</div>
		
		<div class="about3">
		<div class="history_title">
			<a class="history_titleA"><img alt="history 이미지" src="resources/mainImg/diagonal_about.png"><br />HISTORY</a>
		</div>
			<div class="history">
			<table>
				<colgroup>
					<col style="width: 45%" />
					<col style="width: 45%" />
				</colgroup>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2006.11
					</div>
					<div class="historyText">
						<a>(주)씨앤닷컴 법인회사 설립 및 법인사업자 신고</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2007.03
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>벤처기업확인서 인증(기술보증기금)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2007.04
					</div>
					<div class="historyText">
						<a>소프트웨어 사업자 신고(한국소프트웨어 산업협회)</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2008.05
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>직접생산확인증명서 승인(중소기업중앙회)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2009.03
					</div>
					<div class="historyText">
						<a>직접생산확인증명서 연장승인(중소기업중앙회)</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2010.05
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>스마트폰을 활용한 웹프로그램 저작권등록(한국저작권위원회)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2010.12
					</div>
					<div class="historyText">
						<a>국토해양부장관 표장(제12235호)</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2012.12
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>농림수산식품부 장관 표창(제82260호)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2014.05
					</div>
					<div class="historyText">
						<a>스마트카드(IC)급모듈 외 4종 프로그램 저작권등록(한국저작권위원회)</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2015.07
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>스마트카드 플릿 이중 보안방법 특허등록(제10-1542106호)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
				<tr>
					<td class="historyLeft"></td>
					<td class="historyRight">
					<div class="historyImg">
						<img alt="히스토리 이미지" src="resources/mainImg/history_right.png">
						2017.02
					</div>
					<div class="historyText">
						<a>(주)씨앤닷컴 대표이사 김종우 사임<br />
						(주)인터링크앤씨로 회사명 변경 및 대표이사 김제범 취임</a>
					</div>
					</td>
				</tr>
				<tr>
					<td class="historyLeft">
					<div class="historyImg">
						2017.11
						<img alt="히스토리 이미지" src="resources/mainImg/history_left.png">
					</div>
					<div class="historyText">
						<a>직접생산확인증명서 승인(중소기업중앙회)</a>
					</div>
					</td>
					<td class="historyRight"></td>
				</tr>
			</table>
			</div>
		</div>
		
		<div class="scroll">
			<a href="#portfolio" class="portfolio_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
		</div>
	</div>
	
	<div class="portfolio_menu"></div>
	
	<div class="portfolio" id="portfolio">
	<div id="edd">
	<input type="hidden" name="pf_year" id="pf_year" value="${pf_year}">
		<div class="portfolioImg" id="pf_context">
			<div class="portfolio_title"><a class="portfolio_titleA"><img alt="portfolio 이미지" src="resources/mainImg/diagonal_portfolio.png"><br/>PORTFOLIO</a></div>
			<div class="portfolio_navigator">
				<img alt="포트폴리오이미지" src="resources/mainImg/portfolio_navigator.png">
				<div class="portfolio_div_ul">
					<ul class="portfolio_ul">
						<li class="left" style="cursor:pointer;"><a name="page_move" id="2007">&ltrif;</a></li>
						<li style="cursor:pointer;"><a name="page_move" id="2007">2007</a></li>
						<li>&#183;</li>
						<li class="dddd">2018</li>
						<li>&#183;</li>
						<li style="cursor:pointer;"><a name="page_move" id="2009">2009</a></li>
						<li class="right" style="cursor:pointer;"><a name="page_move" id="2009">&rtrif;</a></li>
					</ul>
				</div>
			</div>
			<!-- 슬라이더 -->
			<div class="portfolioImg_div">
			<ul class="bxslider">
				<!-- back-보라 -->
				<c:forEach var="portfolio_list" items="${portfolio_list}"  varStatus="status">
				<c:set var="TextValue" value="${portfolio_list.file_sub_name}"/>
				<c:if test="${portfolio_list.seq_division == '0'}">
				<li class="background_1">
									<div class="portImg">
						<c:if test="${portfolio_list.file_sub_name ne null}">			
						<img class="img1" alt="포트폴리오이미지" src="${portfolio_list.file_path}${fn:substringBefore(TextValue,'*')}">
						</c:if>
						<c:if test="${portfolio_list.file_sub_name eq null}">			
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf_no_img1.jpg">
						</c:if>
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">${portfolio_list.buyer}</a><br />
							<a class="portUrl" href="//${portfolio_list.link}" target="_blank">${portfolio_list.link}</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">${portfolio_list.business_period}</a><br />
							<a class="protCon2_2">${portfolio_list.board_title}</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>${portfolio_list.board_content}</li>
							</ul>
						</div>
					</div>
				</li>
				</c:if>
				<c:if test="${portfolio_list.seq_division == '1'}">
				<li class="background_2">
					<div class="portImg">
						<c:if test="${portfolio_list.file_sub_name ne null}">
						<img class="img1" alt="포트폴리오이미지" src="${portfolio_list.file_path}${fn:substringBefore(TextValue,'*')}">
						</c:if>
						<c:if test="${portfolio_list.file_sub_name eq null}">			
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf_no_img2.jpg">
						</c:if>
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">${portfolio_list.buyer}</a><br />
							<a class="portUrl" href="//${portfolio_list.link}" target="_blank">${portfolio_list.link}</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">${portfolio_list.business_period}</a><br />
							<a class="protCon2_2">${portfolio_list.board_title}</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>${portfolio_list.board_content}</li>
							</ul>
						</div>
					</div>
				</li>
				</c:if>
				</c:forEach>
				</ul>
			</div>
		</div>
		</div>
		
		<div class="scroll">
			<a href="#downloads" class="downloadst_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
		</div>
	</div>
	<div id="downLoadsList">
		<div class="downloads" id="downloads">
		<div class="downloads_title"><a class="downloads_titleA"><img alt="downloads 이미지" src="resources/mainImg/diagonal_download.png"><br/>DOWNLOAD</a></div>

		<form name="board_form"  method="get" id="board_form">
		<input type="hidden" id="board_division" name="board_division" value="download" />
		<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
		<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
		<input type="hidden" id="servletPath" name="servletPath" value="${servletPath}">
		<div class="downloadsTable" id="downloadsTable">
		<div class="a" id="a">
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
			</div>
			
			<div class="downCnt" id="downCnt">
			<input type="hidden" id="startPage" name="startPage" value="">
			<input type="hidden" id="visiblePages" name="visiblePages" value="">
				<c:if test="${fn:length(board_list) != 0}">
				<ul id="paging">
				</ul>
				</c:if>
				<c:if test="${fn:length(board_list) == 0}">
				<ul>
				<li>0</li>
				</ul>
				</c:if>
			</div>
		</div>
		</form>
		<div class="scroll">
			<a href="#customer" class="customer_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
		</div>
		</div>
	</div>
	
	<div class="customer" id="customer">
	<div class="customer_title"><a class="customer_titleA"><img alt="customer 이미지" src="resources/mainImg/diagonal_contact.png"><br/>CUSTOMER</a></div>
		<div class="customer_con">
			<div class="customerLeft">
				<div class="customerLeftText">
					<a class="text1">Tel.</a><a>02-2202-8565</a><br />
					<a class="text1">Email.</a><a>info@interlinknc.com</a><br />
					<a class="text1">Address.</a><a>서울특별시 송파구 위례성대로 18, 703호(방이동, 금복빌딩)</a>
				</div>
				<div class="coustomerLeftImg" id="map" style="width: 100%; height: 340px; border: 1px solid #0033cc;">
				</div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de82005d08935c110538a83eeca00381"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(37.516544, 127.114316),
						level: 3
					};
					
					var map = new daum.maps.Map(container, options);

					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(37.516544, 127.114316); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);

					var iwContent = '<div style="padding:5px;">금복빌딩 <br><a href="http://map.daum.net/link/map/금복빌딩,37.516544, 127.114316" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/금복빌딩,37.516544, 127.114316" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new daum.maps.LatLng(37.516544, 127.114316); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				</script>
			</div>
			<div class="customerRight">
				<div class="customerRightText">
					<a>인터링크앤씨는 고객 여러분의 문의를 기다립니다.<br />
					온라인으로 문의사항을 접수해 주시면<br />
					이메일 또는 유선상으로 답변 드립니다</a>
				</div>
				<div class="customerRightInput">
					<form id="contact_form" name="contact_form" method="post" action="mainContactAction" enctype="multipart/form-data">
					<input type="hidden" id="board_division" name="board_division" value="contact"/>
					<label>작성자</label><input type="text" id="user_id" name="user_id" /><br />
					<label>이메일</label><input type="text" id="user_email" name="user_email" /><br />
					<label>연락처</label><input type="text" id="user_contact" name="user_contact" /><br />
					<label>제목</label><input type="text" id="board_title" name="board_title" /><br />
					<label>문의내용</label><textarea id="board_content" name="board_content"></textarea>
					</form>
				</div>
			</div>
			<div class="send_bt">
				<a class="sendBt" onclick="save()" style="cursor:pointer;">SEND</a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
