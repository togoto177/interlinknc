<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="includever2.jsp"%>
<html>
<head>
<script type="text/javascript">
$(document).ready(function() {
	
	var mySlider = $('.bxslider').bxSlider({
		auto: true,
		controls:true,     //이전/다음 버튼 노출 여부
		autoHover: true,   // 마우스 호버시 정지 여부
		pager:false,
		maxSlides: 3,
		moveSlides:1,
		slideWidth: 230,
		slideMargin:0,
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

});
</script>
	<title>interlinknc</title>
</head>
<body class="main_body">
	<div class="mainImg">
		<div class="mainImgEx">
		<img alt="logo" src="resources/mainImg/bg_starry.png">
		</div>
		<div class="mainImg_con2">
		<a class="con1">/</a><br />
		<img alt="logo" src="resources/mainImg/white_logo.png"><br />
		<a class="en">WE ARE INTERLINK&amp;C</a><br />
		<a class="ko">솔루션 네트워킹으로 정보화를 이끄는 기업</a><br />
		<a class="con2">/</a>
		
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
	</div>
	<div class="exlink"><a href="/main1">1번</a><a href="/main2">2번</a><a href="/main3">3번</a><a href="/main4">4번</a></div>
	<div class="about" id="about">
		<div class="about_title"><a class="about_titleA">ABOUT US</a></div>
		
		<div class="about2">
				<a class="about2A">(주)인터링크앤씨는 다년간 정부 중앙부처 및 산하기관의 시스템 구축과 운영 경험을 바탕으로<br />
				습득한 노하우를 전산시스템 구축을 필요로 하는 기관 및 기업에 적용할 수 있도록<br />
				시스템 구축 컨설팅과 시스템 개발을 통하여<br />
				시스템 구축시 발생할 수 있는 문제점을 최소화 할 수 있는 시스템을 적용하고 있습니다.<br />
				현재 소프트웨어 개발 및 공급과, 포털 홈페이지 구축 운영,<br />
				해양어촌관광(상품개발) 컨설팅 프로젝트를 진행하고 있습니다.<br />
				향후 인터링크앤씨는 더욱 분야를 확대하여,<br />
				최고의 컨설팅으로 최고의 소프트웨어를 제공하는 기업으로 확대하여 나갈 예정입니다.<br />
				웹 기반의 비지니스 솔루션 공급 사업으로 서비스 체계를 갖춘 기업으로 도약할 것입니다.<br />
				또한 저희 기업은 인터넷 및 전산시스템과 관련한 블루오션을 찾아 항상 생각하고 창출하여<br />
				사용자들이 원하는 소프트웨어 개발에 주력하고자 합니다.</a>
		</div>
		
		<div class="about_inter"><a class="icolor">I</a><a>nter-</a><br />
			<a>Link<br />
			and<br />
			C</a>
		</div>
		
		<div class="about3">
			<br />
			<div class="history">
			<table>
				<colgroup>
					<col style="width: 5%" />
					<col style="width: 15%" />
					<col style="width: 80%" />
				</colgroup>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2006</td>
				</tr>
				<tr>
					<td class="tb_img"></td>
					<td class="mon">11월</td>
					<td>(주)씨앤닷컴 법인회사 설립 및 법인사업자 신고</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2007</td>
				</tr>
				<tr>
					<td class="tb_img"></td>
					<td class="mon">3월</td>
					<td>벤처기업확인서 인증(기술보증기금)</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">4월</td>
					<td>소프트웨어 사업자 신고(한국소프트웨어 산업협회)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2008</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">5월</td>
					<td>직접생산확인증명서 승인(중소기업중앙회)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2009</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">3월</td>
					<td>직접생산확인증명서 연장승인(중소기업중앙회)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2010</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">5월</td>
					<td>스마트폰을 활용한 웹프로그램 저작권등록(한국저작권위원회)</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">12월</td>
					<td>국토해양부장관 표창(제12235호)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2012</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">12월</td>
					<td>농림수산식품부 장관 표창(제82260호)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2014</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">5월</td>
					<td>스마트카드(IC)발급모듈 외 4종 프로그램 저작권등록(한국저작권위원회)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2015</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">7월</td>
					<td>스마트카드 애플릿 이중 보안방법 특허등록(제10-1542106호)</td>
				</tr>
				<tr>
					<td class="tb_img">&bull;</td>
					<td colspan="2" class="year">2017</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">2월</td>
					<td>(주)씨앤닷컴 대표이사 김종우 사임<br />
					(주)인터링크앤씨로 회사명 변경 및 대표이사 김제범 취임</td>
				</tr>
				<tr>
					<td></td>
					<td class="mon">11월</td>
					<td>직접생산확인증명서 승인(중소기업중앙회)</td>
				</tr>
			</table>
			</div>
		</div>
		<br />
		
		<div class="about_history"><a class="hcolor">H</a><a>istory</a>
		</div>
	</div>
	
	<div class="portfolio_menu"></div>
	<div class="portfolio" id="portfolio">
		<div class="portfolioImg">
			<div class="prevBtn"><a id="prevBtn">앞</a></div>
			<div class="portfolioImg_div">
			<ul class="bxslider">
				<li class="banner_a1" style="background: url('resources/mainImg/pf1.jpg')"><a href="#">1</a></li>
				<li class="banner_a2" style="background: url('resources/mainImg/pf2.jpg')"><a href="#">1</a></li>
				<li class="banner_a3" style="background: url('resources/mainImg/pf1.jpg')"><a href="#">1</a></li>
				<li class="banner_a4" style="background: url('resources/mainImg/pf2.jpg')"><a href="#">1</a></li>
			</ul>
			</div>
			<div class="nextBtn"><a id="nextBtn">뒤</a></div>
		</div>
	</div>
	
	<div class="downloads" id="downloads">
	<br />
	<h1>Downloads</h1>
		<div class="downloadsTable">
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
				<tr>
					<td>1</td>
					<td>스마트카드 v.1.0.1</td>
					<td>2018.11.21</td>
					<td><img alt="" src="resources/mainImg/downloadImg.png"> </td>
					<td>99999</td>
				</tr>
			</table>
		</div>
		<br />
	</div>
	
	<div class="customer" id="customer">
	<br />
	<h1>Customer</h1>
		<div class="customerCon">
			<table>
				<colgroup>
					<col style="width: 45%" />
					<col style="width: 55%" />
				</colgroup>
				<tr>
					<td rowspan="5"><img alt="네이버 지도" src="resources/mainImg/nav.jpg"></td>
					<td><label>작성자</label><input type="text" /></td>
				</tr>
				<tr>
					<td><label>이메일</label><input type="text" /></td>
				</tr>
				<tr>
					<td><label>연락처</label><input type="text" /></td>
				</tr>
				<tr>
					<td><label>문의내용</label><textarea></textarea> </td>
				</tr>
				<tr>
					<td class="send_bt"><a>Send</a></td>
				</tr>
			</table>
		</div>
	<br />
	</div>
	<%@ include file="../front/footer.jsp"%>
</body>
</html>
