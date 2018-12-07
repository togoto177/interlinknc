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
    $('.openMask').click(function(e){
		e.preventDefault();
		$('body').css("overflow", "hidden");
		wrapWindowByMask();
	});

	//닫기 버튼을 눌렀을 때
	$('.window .close').click(function (e) {  
	    //링크 기본동작은 작동하지 않도록 한다.
	    e.preventDefault();  
	    $('body').css("overflow", "scroll");
	    $('#mask, .window').hide();  
	});       

	//검은 막을 눌렀을 때
	$('#mask').click(function () {  
	    $(this).hide();
	    $('body').css("overflow", "scroll");
	    $('.window').hide();  
	});
	/* 이미지 효과 */
	$(".home_icon").hide();

	$(".bxslider .background_1").mouseover(function(){
		$(this).find('.portCon3').hide();
		$(this).find('.protCon2_1').hide();
		$(this).find('.portCon2').css("background","none");
		$(this).find('.portUrl').css("color","#99ffff");
    }).mouseleave(function(){
    	$(this).find('.portCon3').show();
    	$(this).find('.protCon2_1').show();
    	$(this).find('.portCon2').css("background","#6600ff");
    	$(this).find('.portUrl').css("color","#87ceeb00");
    });
	$(".bxslider .background_2").mouseover(function(){
		$(this).find('.portCon3').hide();
		$(this).find('.protCon2_1').hide();
		$(this).find('.portCon2').css("background","none");
		$(this).find('.protCon2_2').css("color","black");
		$(this).find('.portUrl').css("color","#6600ff");
    }).mouseleave(function(){
    	$(this).find('.portCon3').show();
    	$(this).find('.protCon2_1').show();
    	$(this).find('.portCon2').css("background","#99ffff");

    	$(this).find('.protCon2_2').css("color","black");
    	$(this).find('.portUrl').css("color","#87ceeb00");
    });
	
	$(".downloadsTable table tr").mouseover(function(){
		$(this).find("img").attr("src", "resources/mainImg/downloadImg2.png");
	}).mouseleave(function(){
		$(this).find("img").attr("src", "resources/mainImg/downloadImg.png");
    });
	
});

function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  

	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':maskWidth,'height':maskHeight});  

	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.8);    

	//윈도우 같은 거 띄운다.
	$('.window').show();
}