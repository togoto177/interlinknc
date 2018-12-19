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
<script type="text/javascript">
$(document).ready(function() {

	
 	var mySlider = $('.bxslider').bxSlider({
 		mode: 'horizontal',  //ie 로딩 오류 해결(쫌 괜찮아진듯...)
		auto: false,
		controls:true,     //이전/다음 버튼 노출 여부
		autoHover: true,   // 마우스 호버시 정지 여부
		pager:false,
		maxSlides: 5,
		minSlides: 1,
		moveSlides:1,
		slideWidth: 230,
		slideMargin:5,
	});
 	
	
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
	<div class="home_icon"><img alt="맨위로 가기" src="/resources/mainImg/home.png"></div>
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
		<div class="portfolioImg">
			<div class="portfolio_title"><a class="portfolio_titleA"><img alt="portfolio 이미지" src="resources/mainImg/diagonal_portfolio.png"><br/>PORTFOLIO</a></div>
			<div class="portfolio_navigator">
				<img alt="포트폴리오이미지" src="resources/mainImg/portfolio_navigator.png">
				<div class="portfolio_div_ul">
					<ul class="portfolio_ul">
						<li class="left">&ltrif;</li>
						<li>2009</li>
						<li>&#183;</li>
						<li class="dddd">2008</li>
						<li>&#183;</li>
						<li>2007</li>
						<li class="right">&rtrif;</li>
					</ul>
				</div>
			</div>
			<!-- 슬라이더 -->
			<div class="portfolioImg_div">
			<ul class="bxslider">
				<!-- back-보라 -->
				<li class="background_1">
					<div class="portImg">
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf1.jpg">
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">수협중앙회</a><br />
							<a class="portUrl">www.interlinknc.com</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">2007.01 - 2007.12</a><br />
							<a class="protCon2_2">어촌사랑 홈페이지</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>홈페이지의 지속적인 유지보수 및 운영지원</li>
								<li>유지보수교육 실시 지원</li>
								<li>여행상품 개발, 수익모델 구현 등<br />
								"어촌사랑" 운영업무 지원</li>
								<li>웹 검색 포털사이트 등록</li>
								<li>한국정보문화진흥원의 한국형<br />
								웹컨텐츠 접근성지침1.0 정책 준수</li>
								<li>1111111111111111</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="background_2">
					<div class="portImg">
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf2.jpg">
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">수협중앙회</a><br />
							<a class="portUrl">www.interlinknc.com</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">2007.01 - 2007.12</a><br />
							<a class="protCon2_2">어촌사랑 홈페이지<br />운영 및 유지보수</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>홈페이지의 지속적인 유지보수 및 운영지원</li>
								<li>유지보수교육 실시 지원</li>
								<li>여행상품 개발, 수익모델 구현 등<br />
								"어촌사랑" 운영업무 지원</li>
								<li>웹 검색 포털사이트 등록</li>
								<li>한국정보문화진흥원의 한국형<br />
								웹컨텐츠 접근성지침1.0 정책 준수</li>
								<li>2222222222222222222</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="background_1">
					<div class="portImg">
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf3.jpg">
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">수협중앙회</a><br />
							<a class="portUrl">www.interlinknc.com</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">2007.01 - 2007.12</a><br />
							<a class="protCon2_2">어촌사랑 홈페이지</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>홈페이지의 지속적인 유지보수 및 운영지원</li>
								<li>유지보수교육 실시 지원</li>
								<li>여행상품 개발, 수익모델 구현 등<br />
								"어촌사랑" 운영업무 지원</li>
								<li>웹 검색 포털사이트 등록</li>
								<li>한국정보문화진흥원의 한국형<br />
								웹컨텐츠 접근성지침1.0 정책 준수</li>
								<li>333333333333333333333</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="background_2">
					<div class="portImg">
						<img class="img1" alt="포트폴리오이미지" src="resources/portfolio/pf4.jpg">
						<img class="img2" alt="포트폴리오이미지" src="resources/portfolio/portfolio_monitor.png">
					</div>
					<div class="portConText">
						<div class="portCen">
							<div class="portCon"></div>
							<a class="portA">수협중앙회</a><br />
							<a class="portUrl">www.interlinknc.com</a>
						</div>
						<div class="portCon2">
							<a class="protCon2_1">2007.01 - 2007.12</a><br />
							<a class="protCon2_2">어촌사랑 홈페이지</a>
						</div>
						<div class="portCon3">
							<ul>
								<li>홈페이지의 지속적인 유지보수 및 운영지원</li>
								<li>유지보수교육 실시 지원</li>
								<li>여행상품 개발, 수익모델 구현 등<br />
								"어촌사랑" 운영업무 지원</li>
								<li>웹 검색 포털사이트 등록</li>
								<li>한국정보문화진흥원의 한국형<br />
								웹컨텐츠 접근성지침1.0 정책 준수</li>
								<li>4444444444444444444444</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
			</div>
		</div>
		
		<div class="scroll">
			<a href="#downloads" class="downloadst_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
		</div>
	</div>
	
	<div class="downloads">
	<div class="downloads_title"><a class="downloads_titleA"><img alt="downloads 이미지" src="resources/mainImg/diagonal_download.png"><br/>DOWNLOAD</a></div>

		<form name="board_form"  method="get" id="board_form">
		<input type="hidden" id="board_division" name="board_division" value="${board_division}" />
		<input type="hidden" id="totalCnt" name="totalCnt" value="${totalCnt}">
		<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}">
		<input type="hidden" id="wow" name="wow" value="${wow}">
		<div class="downloadsTable">
		<div class="a" id="downloads">
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
						<!-- <a class="windowConBut">DOWNLOAD&darr;</a> -->
						<c:set var="boardlist" value="${download_list.file_sub_name}" />													
						<c:set var="split_file" value="${fn:split(download_list.file_sub_name,'|')}" />
						<c:forEach items="${split_file}" var="boardlist">
						<br/>
						<a href="javascript:void(0);" class="windowConBut" style="margin-bottom: 15;" id="downBtn" onclick="downFile('${boardlist}', '${download_list.board_seq}');">
						DOWNLOAD &darr;
						
						</a>									
						</c:forEach>
						
					</div>
				</div>
			</div>
			</c:forEach>
			</table>
			</div>
			
			<div class="downCnt">
			<input type="hidden" id="startPage" name="startPage" value="">
			<input type="hidden" id="visiblePages" name="visiblePages" value="">
			<ul>
			<li class="downCntli1">
			<a href="javascript:void(0);" name="page_move" id="page_first">
			<img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png">
			<!-- <img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"> -->
			</a>
			</li>
			<li id="pagination"></li>
			<li class="downCntli2"><a href="javascript:void(0)" name="page_move" id="page_last">
			<!-- <img alt="왼쪽" src="resources/mainImg/download_board_arrow1.png"> -->
			<img alt="왼쪽" src="resources/mainImg/download_board_arrow2.png">
			</a></li>
			</ul>
			</div>
			<hr class="downloads_border-bottom">
		</div>
		</form>
		<div class="scroll">
			<a href="#customer" class="customer_menu"><img alt="밑으로" src="resources/mainImg/scroll.png"></a>
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
				<div class="coustomerLeftImg">
					<img alt="네이버 지도" src="resources/mainImg/nav.jpg">
				</div>
			</div>
			<div class="customerRight">
				<div class="customerRightText">
					<a>인터링크앤씨는 고객 여러분의 문의를 기다립니다.<br />
					온라인으로 문의사항을 접수해 주시면<br />
					이메일 또는 유선상으로 답변 드립니다</a>
				</div>
				<div class="customerRightInput">
					<label>작성자</label><input type="text" /><br />
					<label>이메일</label><input type="text" /><br />
					<label>연락처</label><input type="text" /><br />
					<label>문의내용</label><textarea></textarea>
				</div>
			</div>
			<div class="send_bt">
				<a class="sendBt">SEND</a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
