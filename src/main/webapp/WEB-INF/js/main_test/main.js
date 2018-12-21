jQuery(document).ready(function($){
    $(".about_menu").click(function(event){
    event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        //ofWfset()함수로 위치를 찾음
    });
    $(".portfolio_menu").click(function(event){
        event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
            //ofWfset()함수로 위치를 찾음
     });
    $(".downloadst_menu").click(function(event){
        event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
            //ofWfset()함수로 위치를 찾음
     });
    $(".customer_menu").click(function(event){
        event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
            //ofWfset()함수로 위치를 찾음
     });
    $(".home_icon").click(function(event){
        event.preventDefault();
            $('html,body').animate({scrollTop:0}, 500);
            //ofWfset()함수로 위치를 찾음
     });
    
    /*메인으로 아이콘*/
    $(window).scroll(function() {
    	  var $el = $('.show-on-scroll');
    	  
    	  if($(this).scrollTop() >= 400) $(".home_icon").show();
    	  else $(".home_icon").hide();
    });
    
    /*모달창*/
    $(document).on("click",".openMask",function(e){
    	
    	var id_check = $(this).attr("id"); //해당 seq값을 가져오기위해 새로 추가 
    	
    	$.ajax({
    		type : "POST",
    		url : "mainDownHit",
    		async : false,
    		data : {board_seq : id_check} ,
    		dataType : "json",
    		cache: false,
    		success: function(data){    
    		}  
    	});
    	
		e.preventDefault();
		$('body').css("overflow", "hidden");
		wrapWindowByMask(id_check);
	});

	//닫기 버튼을 눌렀을 때
    $(document).on("click",".window .close",function(e){  
	    //링크 기본동작은 작동하지 않도록 한다.
	    e.preventDefault();  
	    $('body').css("overflow", "scroll");
	    $('#mask, .window').hide();  
	});       

	//검은 막을 눌렀을 때
    $(document).on("click","#mask",function(){  
	    $(this).hide();
	    $('body').css("overflow", "scroll");
	    $('.window').hide();  
	});
	/* 이미지 효과 */
	$(".home_icon").hide();
	
	$(".downloadsTable table tr").mouseover(function(){
		$(this).find("img").attr("src", "resources/mainImg/download_arrow_pink.png");
	}).mouseleave(function(){
		$(this).find("img").attr("src", "resources/mainImg/download_arrow_white.png");
    });
	
	 $( window ).resize( function() {
		 var maskHeight = $(document).height();  
		 $('#mask').css({'width':'100%','height':maskHeight});
		 
     });
	 
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

function wrapWindowByMask(seq){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  

	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	/*$('#mask').css({'width':maskWidth,'height':maskHeight}); */ 
	$('#mask').css({'width':'100%','height':maskHeight});  

	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.8);    

	//윈도우 같은 거 띄운다.
	$('#'+seq+'').show();
}