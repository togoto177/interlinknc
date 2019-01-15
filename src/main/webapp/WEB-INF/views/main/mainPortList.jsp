<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="includever2.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
jQuery(document).ready(function($){

	 /*slider*/
	 var $slider; 
		function buildSliderConfiguration() { 
		    var windowWidth = $(window).width(); 
		    var numberOfVisibleSlides;

		    if (windowWidth < 570) { 
		    numberOfVisibleSlides = 1;
		    }
		    else if (windowWidth < 800) { 
		    numberOfVisibleSlides = 2; 
		    } 
		    else if (windowWidth < 1200) { 
		    numberOfVisibleSlides = 3;
		    } 
		    else if (windowWidth < 1400) { 
		    numberOfVisibleSlides = 4;
		    } 
		    else { 
			numberOfVisibleSlides = 5;
			} 

		    return { 
		    pager: false, 
		    mode: 'horizontal',
		    controls: true, 
		    auto: false,
		    autoHover: true,
		    slideWidth: 230,
		    moveSlides: 1, 
		    slideMargin: 5, 
		    minSlides: numberOfVisibleSlides, 
		    maxSlides: numberOfVisibleSlides,
		    onSliderLoad: function(){ 
		    	$("#edd").css("visibility", "visible").animate({opacity:1}); 
		    	} //깜빡임 문제 해결을 위해 권수 추가 2018-12-20
		    }; 
		} 
		
		function configureSlider() { 
		    var config = buildSliderConfiguration();

		    if ($slider && $slider.reloadSlider) { 
		    $slider.reloadSlider(config); 
		    } 
		    else { 
		    $slider = $('.bxslider').bxSlider(config); 
		    } 
		}
		$(window).on("orientationchange resize", configureSlider); 
		configureSlider();
	/*slider end*/
		
});
</script>
		<div id="edd" style="visibility:hidden;opacity:0">
		<input type="hidden" name="pf_year" id="pf_year" value="${pf_year}">
		<div class="portfolioImg" id="pf_context">
			<div class="portfolio_title"><a class="portfolio_titleA"><img alt="portfolio 이미지" src="resources/mainImg/diagonal_portfolio.png"><br/>PORTFOLIO</a></div>
			<div class="portfolio_navigator">
				<img alt="포트폴리오이미지" src="resources/mainImg/portfolio_navigator.png">
				<div class="portfolio_div_ul">
					<ul class="portfolio_ul">
					<c:if test="${pf_year == '2018'}">
						<li class="left" style="cursor:pointer;"><a name="page_move" id="2007">&ltrif;</a></li>
						<li style="cursor:pointer;"><a name="page_move" id="2007">2007</a></li>
						<li>&#183;</li>
						<li class="dddd">2018</li>
						<li>&#183;</li>
						<li style="cursor:pointer;"><a name="page_move" id="2009">2009</a></li>
						<li class="right" style="cursor:pointer;"><a name="page_move" id="2009">&rtrif;</a></li>
					</c:if>
					<c:if test="${pf_year == '2009'}">
						<li class="left" style="cursor:pointer;"><a name="page_move" id="2018">&ltrif;</a></li>
						<li style="cursor:pointer;"><a name="page_move" id="2018">2018</a></li>
						<li>&#183;</li>
						<li class="dddd">2009</li>
						<li>&#183;</li>
						<li style="cursor:pointer;"><a name="page_move" id="2008">2008</a></li>
						<li class="right" style="cursor:pointer;"><a name="page_move" id="2008">&rtrif;</a></li>
					</c:if>
					<c:if test="${pf_year == '2008'}">
						<li class="left" style="cursor:pointer;"><a name="page_move" id="2009">&ltrif;</a></li>
						<li style="cursor:pointer;"><a name="page_move" id="2009">2009</a></li>
						<li>&#183;</li>
						<li class="dddd">2008</li>
						<li>&#183;</li>
						<li style="cursor:pointer;"><a name="page_move" id="2007">2007</a></li>
						<li class="right" style="cursor:pointer;"><a name="page_move" id="2007">&rtrif;</a></li>
					</c:if>
					<c:if test="${pf_year == '2007'}">
						<li class="left" style="cursor:pointer;"><a name="page_move" id="2008">&ltrif;</a></li>
						<li style="cursor:pointer;"><a name="page_move" id="2008">2008</a></li>
						<li>&#183;</li>
						<li class="dddd">2007</li>
						<li>&#183;</li>
						<li style="cursor:pointer;"><a name="page_move" id="2018">2018</a></li>
						<li class="right" style="cursor:pointer;"><a name="page_move" id="2018">&rtrif;</a></li>
					</c:if>		
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
							<c:if test="${!empty portfolio_list.link}">
							<a class="portUrl" href="//${portfolio_list.link}" target="_blank">${portfolio_list.link}</a>
							</c:if>
							<c:if test="${empty portfolio_list.link}">
							<a class="portUrl">interlinknc.com</a>
							</c:if>
							
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